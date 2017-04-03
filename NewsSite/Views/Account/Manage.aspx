<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.LocalPasswordModel>" %>

<asp:Content ID="manageTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Manage Account
</asp:Content>

<asp:Content ID="manageContent" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Manage Account.</h3>

    <p><%: (string) ViewBag.StatusMessage %></p>

    <span class="alert alert-danger">You're logged in as <strong><%: User.Identity.Name %></strong>.</span>



    <% Html.RenderPartial(ViewBag.HasLocalPassword ? "_ChangePasswordPartial" : "_SetPasswordPartial"); %>
</asp:Content>
