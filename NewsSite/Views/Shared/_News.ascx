<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<NewsSite.Models.Membership.News>" %>

<span class="alert">Дата:
    <%: Model.Date.Day %>.<%: Model.Date.Month %>.<%: Model.Date.Year %> </span>
<h4>Заголовок:
    <br />
    <a href="/News/Details/<%: Model.NewId %>"><%: Model.Title %></a>  </h4>
<% if (Model.PictureUrl != null)
   { %>
    <img src="/Images/Collection/<%: Model.PictureUrl %>" style="height: 150px; width: 150px;" />
<% } %>