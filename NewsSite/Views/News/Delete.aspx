<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.Membership.News>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend>Подтвердите удаление новости</legend>
    </fieldset>

    <div class="row">
        <div class="span4">
            <% Html.RenderPartial("_News", Model); %>
        </div>

        <div class="span4 alert alert-success">
            <div>
                <h4>Краткое описание</h4>
                <h5><%: Model.BriefDescription %></h5>
            </div>
        </div>

        <div class="span6 alert alert-success">
            <div>
                <h4>Полное описание</h4>
                <h5><%: Model.FullText %></h5>
            </div>
        </div>
    </div>

    <br />
    <br />



    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" class="btn deleteButton" />
        <a href="/Admin/ViewNews/" class="btn linkButton">Назад к новостям</a>
    </p>
    <% } %>
</asp:Content>
