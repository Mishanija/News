<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AdminRequest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>AdminRequest</h2>

    <h4>Поздравляем, ваша заявка одобрена. Чтобы зайти на сайт, как администратор, вам нужно</h4>
    <a href="/Account/Register?id=generatedId" class="btn linkButton">пройти регистрацию</a>
    <h4>и аутэнтифицироваться через вашу электронную почту</h4>

</asp:Content>