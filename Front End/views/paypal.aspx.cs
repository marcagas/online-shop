using System;
using System.IO;
using System.Text;
using System.Net;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Windows.Forms;
using System.Drawing;
using System.Globalization;
using System.Net.Mail;
using System.Net;

public partial class Front_End_views_paypal : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        //Post back to either sandbox or live
        string strSandbox = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        string strLive = "https://www.paypal.com/cgi-bin/webscr";
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strSandbox);

        //Set values for the request back
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        byte[] param = Request.BinaryRead(HttpContext.Current.Request.ContentLength);
        string strRequest = Encoding.ASCII.GetString(param);
        strRequest += "&cmd=_notify-validate";
        req.ContentLength = strRequest.Length;

        //for proxy
        //WebProxy proxy = new WebProxy(new Uri("http://url:port#"));
        //req.Proxy = proxy;

        //Send the request to PayPal and get the response
        StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        streamOut.Write(strRequest);
        streamOut.Close();
        StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
        string strResponse = streamIn.ReadToEnd();
        streamIn.Close();

        string message, subject;

        if (strResponse == "VERIFIED")
        {
            //check the payment_status is Completed
            //check that txn_id has not been previously processed
            //check that receiver_email is your Primary PayPal email
            //check that payment_amount/payment_currency are correct
            //process payment

            string[] str_params = strRequest.Split('&');
            string txn_id, payment_date, payer_email, business, payer_id, txn_type, payment_status, payment_type, mc_fee, mc_currency, first_name, last_name, address_street, address_city, verify_sign, item_number;
            Decimal mc_gross = new Decimal();
            Int16 quantity;
            string item_number_prefix = "item_number";
            string mc_gross_prefix = "mc_gross_";
            string quantity_prefix = "quantity";
            string productId;
            string sql_str;
            SqlCommand cmd;

            Dictionary<string, string> dic = new Dictionary<string, string>();

            foreach (string str_param in str_params)
            {
                string param_key = str_param.Split('=')[0];
                string param_val = HttpUtility.UrlDecode(str_param.Split('=')[1]);

                if (param_key != null && param_val != null)
                {
                    //using (StreamWriter w = File.AppendText("C:\\Users\\marc\\Desktop\\log.txt")) { Log("param_key >>>>>>>>>>" + param_key, w); }
                    //using (StreamWriter w = File.AppendText("C:\\Users\\marc\\Desktop\\log.txt")) { Log("param_val >>>>>>>>>>" + param_val, w); }
                    dic.Add(param_key, param_val);         
                }      
            }

            //WriteLogs("PAYMENT STATUS >>>>>>>>>>>>>>>>>>>>>>");
            //WriteLogs(dic["payment_status"]);
           
            if (dic["payment_status"] == "Completed") 
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
                int num = Convert.ToInt32(dic["num_cart_items"]);
                //WriteLogs(strResponse);
                //WriteLogs(strRequest);

                con.Open();
                DateTime paymentDate;
                paymentDate = ConvertPayPalDateTime(dic["payment_date"]);                
                sql_str = "Insert into ORDERS (OrderDate, UserId, PaypalTransactionId, PaypalBusinessEmail, PaypalGross, CreatedAt) values ('" +
                          paymentDate + "', '" + dic["custom"] + "', '" + dic["txn_id"] + "', '" + dic["business"] + "', " + dic["mc_gross"] + ", '" + DateTime.Now.ToString() + "')";
                
                WriteLogs(sql_str);
                try
                {
                    WriteLogs("executing >>>>>>>>>>>>>>");
                    cmd = new SqlCommand(sql_str, con);
                    cmd.ExecuteNonQuery();
                }
                catch (SystemException except)
                {
                    WriteLogs(except.Message);
                }

                sql_str = "Select TOP(1) OrderID from Orders order by CreatedAt desc";
                cmd = new SqlCommand(sql_str, con);
                WriteLogs("cmd.executescalar");
                cmd.ExecuteScalar();
                Int32 order_id = (Int32)cmd.ExecuteScalar(); 
                WriteLogs("after cmd.executescalar"+order_id.ToString());
               
                WriteLogs("OrderId - " + order_id.ToString());
                WriteLogs(">>>>>>>>>>>>>>>>>> number of items ");
                WriteLogs(num.ToString());
                for (int i = 1; i <= num; i++)
                {
                    item_number = item_number_prefix + i.ToString();
                    mc_gross = Convert.ToDecimal(dic[mc_gross_prefix + i.ToString()]);
                    quantity = Convert.ToInt16(dic[quantity_prefix + i.ToString()]);

                    WriteLogs(item_number);
                    productId = dic[item_number];
                    WriteLogs(productId);

                    // add order details per product
                    sql_str = "Insert into OrderDetails (ProductID, UnitPrice, Quantity, OrderID, CreatedAt) values (" +
                              Convert.ToInt32(productId) + ", " + mc_gross + ", " + quantity + ", " + order_id + ", '" + DateTime.Now.ToString() + "')";

                    WriteLogs(sql_str);
                    try
                    {
                        cmd = new SqlCommand(sql_str, con);
                        cmd.ExecuteNonQuery();
                        WriteLogs("successful insert >>>>>>>>>>>>>");
                    }
                    catch (SystemException except)
                    {
                        WriteLogs("failed insert >>>>>>>>>>>>>");
                        WriteLogs(except.Message);
                    }
                    

                    // get product
                    sql_str = "Select * from Products where ProductID = " + productId;
                    WriteLogs(sql_str);
                    
                    sql_str = "Update Products set ";

                    // deduct to database
                    sql_str = "Update products set unitsinstock=(unitsinstock-" + quantity + ") where ProductId=" + productId;
                    cmd = new SqlCommand(sql_str, con);
                    cmd.ExecuteNonQuery();
                                        
                }
                WriteLogs("success insert to product details >>>>>>>>>>>>>>>>>>>>>>>>");
                //message = "<p>Thank you for purchasing with us.</p><br /><p>Etrade Enterprise</p>";
                //subject = "Order Confirmation";
                //SendEmail(dic["payer_email"], message, subject);
                con.Close();
                
            }
            else if (dic["payment_status"] == "Pending")
            {
                WriteLogs("Sending Email now >>>>>>>>>>>>>>>>>>>>>>" + dic["payer_email"]);                
                //message = "<p>Your order is being processed as of the moment. <br />We will send you an update once order has been accepted.</p><br /><p>Etrade Enterprise</p>";
                //subject = "Order Status";

                //SendEmail(dic["payer_email"], message, subject);
            }
            
            //NameValueCollection these_argies = HttpUtility.ParseQueryString(strResponse_copy);
            //string user_email = these_argies["payer_email"];
            //string pay_stat = these_argies["payment_status"];
        }
        else if (strResponse == "INVALID")
        {
            //log for manual investigation
        }
        else
        {
            //log response/ipn data for manual investigation
        }
    }

    public static void WriteLogs(string message)
    {
        using (StreamWriter w = File.AppendText("C:\\Users\\marc\\Desktop\\log.txt")) { Log(message, w); }
    }

    public static void SendEmail(string recipient, string message, string subject)
    {
        try
        {
            string sender = "etrade2004@gmail.com";
            string password = "pass2004";
            //Create Mail Message Object with content that you want to send with mail.
            System.Net.Mail.MailMessage MyMailMessage = new System.Net.Mail.MailMessage(sender, recipient, subject, message);
            System.Net.Mail.SmtpClient oMail = new System.Net.Mail.SmtpClient("TryIt");
            //System.Net.Mail.Attachment attachment = new System.Net.Mail.Attachment(txtAttachment.Text);
            //MyMailMessage.Attachments.Add(attachment);
            MyMailMessage.IsBodyHtml = true;

            //Proper Authentication Details need to be passed when sending email from gmail
            System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential(sender, password);

            //Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587
            //For different server like yahoo this details changes and you can
            //get it from respective server.
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

            //Enable SSL
            mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;
            mailClient.Send(MyMailMessage);
        }
        catch (Exception x)
        {
            WriteLogs("Sending email failed! - " + recipient);
        }
    }

    public static DateTime ConvertPayPalDateTime(string payPalDateTime)
    {
        CultureInfo enUS = new CultureInfo("en-US");
        // accept a few different date formats because of PST/PDT timezone and slight month difference in sandbox vs. prod.
        string[] dateFormats = { "HH:mm:ss MMM dd, yyyy PST", "HH:mm:ss MMM. dd, yyyy PST", "HH:mm:ss MMM dd, yyyy PDT", "HH:mm:ss MMM. dd, yyyy PDT",
                             "HH:mm:ss dd MMM yyyy PST", "HH:mm:ss dd MMM. yyyy PST", "HH:mm:ss dd MMM yyyy PDT", "HH:mm:ss dd MMM. yyyy PDT"};
        DateTime outputDateTime;

        DateTime.TryParseExact(payPalDateTime, dateFormats, CultureInfo.InvariantCulture, DateTimeStyles.None, out outputDateTime);

        // convert to local timezone
        TimeZoneInfo hwZone = TimeZoneInfo.FindSystemTimeZoneById("Pacific Standard Time");

        outputDateTime = TimeZoneInfo.ConvertTime(outputDateTime, hwZone, TimeZoneInfo.Local);

        return outputDateTime;
    }

    public static void Log(string logMessage, TextWriter w)
    {
        w.Write("\r\nLog Entry : ");
        w.WriteLine("{0} {1}", DateTime.Now.ToLongTimeString(),
            DateTime.Now.ToLongDateString());
        w.WriteLine("  :");
        w.WriteLine("  :{0}", logMessage);
        w.WriteLine("-------------------------------");
    }

    public void test()
    {

    }

    public static string getStatus() 
    {
        return "test";
    }
}