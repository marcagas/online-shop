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

        if (strResponse == "VERIFIED")
        {
            //check the payment_status is Completed
            //check that txn_id has not been previously processed
            //check that receiver_email is your Primary PayPal email
            //check that payment_amount/payment_currency are correct
            //process payment

            string[] str_params = strRequest.Split('&');
            string txn_id, payment_date, payer_email, business, payer_id, txn_type, payment_status, payment_type, mc_gross, mc_fee, mc_currency, first_name, last_name, address_street, address_city, verify_sign;

            Dictionary<string, string> dic = new Dictionary<string, string>();

            foreach (string str_param in str_params)
            {
                string param_key = str_param.Split('=')[0];
                string param_val = HttpUtility.UrlDecode(str_param.Split('=')[1]);

                if (param_key != null && param_val != null)
                {
                    dic.Add(param_key, param_val);         
                }      
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
            con.Open();
                        
            string s = "INSERT into Sample values ("+ "'" + dic["business"] + "'" + ", 'just now')";            
            SqlCommand cmd = new SqlCommand(s, con);                                
                        
            cmd.ExecuteNonQuery();
            con.Close();

            using (StreamWriter w = File.AppendText("C:\\Users\\marc\\Desktop\\log.txt"))
            {                      
                Log(strResponse, w);                
                Log(strRequest, w);
            }

            using (StreamReader r = File.OpenText("C:\\Users\\marc\\Desktop\\log.txt"))
            {
                DumpLog(r);
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

    public static void Log(string logMessage, TextWriter w)
    {
        w.Write("\r\nLog Entry : ");
        w.WriteLine("{0} {1}", DateTime.Now.ToLongTimeString(),
            DateTime.Now.ToLongDateString());
        w.WriteLine("  :");
        w.WriteLine("  :{0}", logMessage);
        w.WriteLine("-------------------------------");
    }

    public static void DumpLog(StreamReader r)
    {
        string line;
        while ((line = r.ReadLine()) != null)
        {
            Console.WriteLine(line);
        }
    }

    public void test()
    {

    }
}