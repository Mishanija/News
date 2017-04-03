<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<NewsSite.Models.Membership.News>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Все новости
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend>Список всех новостей</legend>
    </fieldset>

    <div class="row">

        <div class="pagination pagination-centered">
            Пролистывание
                <a id="forward" href="/Admin/ViewNews/<%: ((int) ViewBag.pageNumber) - 1 %>" class="btn chooseButton"><</a>
            <a id="back" href="/Admin/ViewNews/<%: ((int) ViewBag.pageNumber) + 1 %>" class="btn chooseButton">></a>
        </div>
    </div>

    <div class="row" style="height: auto">

        <% foreach (var item in Model)
           { %>

        <div class="newsColumn">

            <% Html.RenderPartial("_News", item); %>
            
            <br /><br />

            <div class="alert alert-danger">
                <span>Краткое описание: <%: item.BriefDescription %> </span>
            </div>
            
            <div class="alert alert-info">
                <span>Полное описание: <%: item.FullText %> </span>
            </div>

            <%--<h5>Краткое описание: <%: item.BriefDescription %> </h5>--%>
            <%--<h5>Полное описание: <%: item.FullText %> </h5>--%>
            <a href="/News/Edit/<%: item.NewId %>" class="btn editButton">Редактировать новость</a><br />
            <br />

            <a href="/News/Delete/<%: item.NewId %>" class="btn deleteButton">Удалить новость</a><br />
            <br />
        </div>

        <% } %>
    </div>
    <br />
    <br />




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
