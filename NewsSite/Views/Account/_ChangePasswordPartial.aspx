﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.LocalPasswordModel>" %>

<% using (Html.BeginForm("Manage", "Account"))
   { %>
<%: Html.AntiForgeryToken() %>
<%: Html.ValidationSummary() %>

<fieldset>
    <legend>Change Password Form</legend>
</fieldset>

<ol>
    <li>
        <%: Html.LabelFor(m => m.OldPassword) %>
        <%: Html.PasswordFor(m => m.OldPassword) %>
    </li>
    <li>
        <%: Html.LabelFor(m => m.NewPassword) %>
        <%: Html.PasswordFor(m => m.NewPassword) %>
    </li>
    <li>
        <%: Html.LabelFor(m => m.ConfirmPassword) %>
        <%: Html.PasswordFor(m => m.ConfirmPassword) %>
    </li>
</ol>
<input type="submit" value="Change password" class="btn editButton" />

<% } %>