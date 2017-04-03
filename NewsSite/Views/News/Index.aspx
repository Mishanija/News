<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<NewsSite.Models.Membership.News>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <fieldset>
        <legend>Список новостей</legend>
    </fieldset>

    <div class="row">
        <div class="pull-right">
            <span class="alert alert-danger">Хотите стать администратором?</span>
            <a href="/Home/AdminRequest/" class="btn linkButton">Подайте заявку</a>
        </div>
    </div>

    <div class="pagination pagination-centered">
        <a id="forward" href="/News/Index/<%: ((int) ViewBag.pageNumber) - 1 %>" class="btn chooseButton">Позже</a>
        <a id="back" href="/News/Index/<%: ((int) ViewBag.pageNumber) + 1 %>" class="btn chooseButton">Раньше</a>
    </div>

    <div class="row" style="height: auto;">

        <% foreach (var item in Model)
           { %>

        <div class="newsColumn">
            <% Html.RenderPartial("_News", item); %>
            <br />    <br />
            <div class="alert alert-info">
                <span>Краткое описание: <%: item.BriefDescription %> </span>
            </div>
            
        </div>

        <% } %>
    </div>
    <br />
    <br />

    <div class="row">
        <h3 style="color: #1bb215; margin-left: 30px;">Блок случайных новостей:</h3>
        <% foreach (NewsSite.Models.Membership.News item in ViewBag.randomNews)
           { %>

        <div class="span3">
            <% Html.RenderPartial("_News", item); %>
        </div>

        <% } %>

    </div>
    

    <script>

        var back = document.getElementById("back");
        var forward = document.getElementById("forward");

        function disable(source) {
            source.onclick = function () { return false; };
            source.href = "";
            source.setAttribute("class", "btn disabledButton");
        };

        if ("<%: ViewBag.pageNumber %>" == 0) {
            disable(forward);
        };

        if ("<%: ViewBag.pageNumber %>" == "<%: (int) ViewBag.pagesCount - 1 %>") {
            disable(back);
        };

    </script>

</asp:Content>
