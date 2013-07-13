<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Front_End_About" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">
<div id="menu">
		<ul>
			<li class="first"><a href="Home.aspx"><b>Home</b></a>
            <li class="second"><a href="Products.aspx"><b>Products</b></a>
            <%--<li class="third"><a href="MyCart.aspx"><b>My Cart</b></a>--%>
              <li><a href="#"><span class="fourth">Accessibility<b></b></span></a>
				    <ul>
					<li><a href="Login.aspx">Login</a></li>
					<li><a href="Register.aspx">Register</a></li>
                    <li><a href="Help.aspx">Help</a></li>
					</ul>
                    </li> 
		</ul>
		<br class="clearfix" />
</div>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
	    <div id="page">
            <h2>About Us</h2>
					<blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-Trade Enterprise is a computer store that sells different computers, laptop, printers, monitors, keyboards,
                    </br>processors, mouse, antivirus software, memory, scanners & etc. </blockquote></p>

                <p> <blockquote style="width: 864px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-Trade Enterprise, owned by Mr. Alberto Chua, is under the Crosspoint Computer’s Incorporation which is an
                Information Technology (IT) based business organization whose foremost corporate objective is to be recognized as a
                respective and leading system Integrator providing total solutions to corporate and government institutions.</blockquote></p>

                <p> <blockquote style="width: 864px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Crosspoint Computers Incorporation started on Mach 1996. It was managed by some engineers and
                </br>has not been successful because of organizational conflict. Mr. Alberto Chua then decided to run a small computer
                business and asked his wife, Mrs. Cheryl Chua to manage it. She started with an 18 square meter room and had
                Philippine Geothermal and Standard Charter as their main client.</blockquote></p>

                <p> <blockquote style="width: 864px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;On October of 2004, they decided to open the first branch of E-Trade Enterprise which is located at the
                </br>2nd floor of SM City Dasmariñas. The other two branches were established on September 2007 at Waltermart, Carmona
                and March 2010 at SM City Rosario. </blockquote></p>

            <blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The company’s mission is to be the leading distributor of computer products inside Cavite.
                </br>Prioritizing God and their employees is one of their main concerns.
				</blockquote></p>
        </div>
    </asp:Content>