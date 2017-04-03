<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.Membership.News>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend>Подробное описание</legend>
    </fieldset>




    <div class="span4">
        <span class="alert">Дата: <%: Model.Date.Day %>.<%: Model.Date.Month %>.<%: Model.Date.Year %> </span>
        <br />
        <br />

        <span class="alert alert-success">Заголовок: <%: Model.Title %> </span>
        <br />
        <br />


        <% if (Model.PictureUrl != null)
           { %>
        <img src="/Images/Collection/<%: Model.PictureUrl %>" style="width: 300px;" />
        <% } %>

        <br />
        <br />
        <p>
            <a href="/News/Index" class="btn linkButton">К списку новостей</a>
        </p>

    </div>



    <div class="span7 ">
        <div class="alert alert-success">
            <h4>Полный текст новости:</h4>
        </div>

        <div class="alert alert-info">
            <span><%: Model.FullText %> </span>
        </div>

    </div>

</asp:Content>
