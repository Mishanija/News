<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Гостевая страничка
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">

        <div class="span4">
            <h4>Все новости</h4>
            <a href="/News/Index/">
                <img src="/Images/Bars/user/news.jpeg" style="height: 200px; width: 300px;">
            </a>
        </div>
        
        <div class="span4">
            <h4>В кабинет администратора</h4>
            <a href="/Admin/Index/">
                <img src="/Images/Bars/admin/admin.png" style="height: 200px; width: 300px;">
            </a>
        </div>

    </div>


    <br />
    <br />
    <br />
    
    
    



</asp:Content>