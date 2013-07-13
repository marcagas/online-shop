<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FileUpload.aspx.cs" Inherits="BinaryData_FileUpload" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Upload a File</h2>
    <p>
        Choose a file:&nbsp;
        <asp:FileUpload ID="UploadTest" runat="server" />
    </p>
    <p>
        <asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" Text="Upload Selected File" />&nbsp;</p>
    <p>
        <asp:Label ID="UploadDetails" runat="server"></asp:Label>&nbsp;</p>
</asp:Content>

