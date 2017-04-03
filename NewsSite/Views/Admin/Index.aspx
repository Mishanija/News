<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Страница администратора
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Домашняя страница администратора</h2>

    <div class="row">

        <div class="span4">
            <h4>Все новости</h4>
            <a href="/Admin/ViewNews/">
                <img src="/Images/Bars/user/news.jpeg" style="height: 200px; width: 300px;">
            </a>
        </div>

        <div class="span4">
            <h4>Создать новость</h4>
            <a href="/News/Create/">
                <img src="/Images/Bars/admin/create.jpg" style="height: 200px; width: 300px;">
            </a>
        </div>

        <div class="span4">
            <h4>Коллекция изображений</h4>
            <a href="/Admin/Collection/">
                <img src="/Images/Bars/admin/upload.jpeg" style="height: 200px; width: 300px;">
            </a>
        </div>
    </div>

</asp:Content>