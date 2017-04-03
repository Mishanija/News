<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.LoginModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log in
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">


    <section id="loginForm">

        <% using (Html.BeginForm(new {ViewBag.ReturnUrl}))
           { %>
            <%: Html.AntiForgeryToken() %>
            <%: Html.ValidationSummary(true) %>

            <fieldset>
                <legend>Log in Form</legend>

                <h4>Для входа нужно аутэнтифицироваться</h4>

                <ol>
                    <li>
                        <%: Html.LabelFor(m => m.UserName) %>
                        <%: Html.TextBoxFor(m => m.UserName) %>
                        <%: Html.ValidationMessageFor(m => m.UserName) %>
                    </li>
                    <li>
                        <%: Html.LabelFor(m => m.Password) %>
                        <%: Html.PasswordFor(m => m.Password) %>
                        <%: Html.ValidationMessageFor(m => m.Password) %>
                    </li>
                
                </ol>
                <p style="font-size: 18px;">
                    <input type="checkbox" id="RememberMe" name="RememberMe" value="true" class="checkBox1" />
                    Запомнить меня                            
                </p>
                <input type="submit" value="Log in" class="btn createButton" />
            </fieldset>
        <% } %>
    </section>

</asp:Content>