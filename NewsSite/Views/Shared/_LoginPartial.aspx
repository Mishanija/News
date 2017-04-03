﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<% if (Request.IsAuthenticated)
   { %>
    Hello, <%: Html.ActionLink(User.Identity.Name, "Manage", "Account", null, new {@class = "username", title = "Manage"}) %>!
    <% using (Html.BeginForm("LogOff", "Account", FormMethod.Post, new {id = "logoutForm"}))
       { %>
        <%: Html.AntiForgeryToken() %>
        <a href="javascript:document.getElementById('logoutForm').submit()" class="btn btn-mini resetButton">Выйти</a>
    <% } %>
<% }
   else
   { %>
    <ul>
        <li><%: Html.ActionLink("Register", "Register", "Account", null, new {id = "registerLink"}) %></li>
        <li><%: Html.ActionLink("Log in", "Login", "Account", null, new {id = "loginLink"}) %></li>
    </ul>
<% } %>