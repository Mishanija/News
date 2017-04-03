<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.Membership.Picture>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DeletePhoto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend>Подтвердите удаление изображения</legend>
    </fieldset>

    <img src="/Images/Collection/<%: Model.PictureUrl %>" style="height: 300px; width: 300px;" />


    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" class="btn deleteButton" />
        <a href="/Admin/Collection/" class="btn resetButton">Не надо</a>
    </p>
    <% } %>
</asp:Content>
