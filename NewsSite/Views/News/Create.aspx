<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.Membership.News>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Создание новости</legend>
    </fieldset>

    <input type="hidden" name="Date" value="<%: Model.Date %>" />
    <%: Html.Hidden("PictureUrl", Model.PictureUrl) %>

    <div class="row">

        <div class="span5">
            <div>
                <h4>Заголовок: </h4>
                <input type="text" required name="Title" placeholder="Введите заголовок" value="<%: Model.Title %>" style="width: 300px;" maxlength="100" /><br />
                <%: Html.ValidationMessageFor(model => model.Title) %>
            </div>

            <div>
                <h4>Краткое описание: </h4>
                <textarea name="BriefDescription" required style="display: block; height: 100px; width: 300px;" placeholder="Кратко опишите событие"><%: Model.BriefDescription %></textarea>
                <%: Html.ValidationMessageFor(model => model.BriefDescription) %>
            </div>

            <div>
                <h4>Изображение новости:</h4>
                <img id="choosenPhoto" src="<%: Model.PictureUrl %>" style="height: 300px; width: 300px;" />
            </div>

            <br />
            <p>
                <input type="submit" value="Create" class="btn btn-large createButton" />
            </p>
        </div>

        <div class="span8">

            <div>
                <h4>Полное описание: </h4>
                <textarea name="FullText" required style="display: block; height: 300px; width: 600px;" placeholder="Текст статьи"><%: Model.FullText %></textarea>
                <%: Html.ValidationMessageFor(model => model.FullText) %>
            </div>

            <div class="row">
                <% int i = 0;
                   foreach (var item in ViewBag.Collection)
                   {
                       i++;
                %>

                <div class="span2" style="margin-left: 10px; margin-top: 20px;">
                    <img id="<%: i %>" src="/Images/Collection/<%: item.PictureUrl %>" onclick=" choose(<%: i %>) " style="height: 150px; width: 150px;" />

                </div>
                <% } %>
            </div>

        </div>

    </div>
    <% } %>

    <script>

        var hiddenUrl = document.getElementById("PictureUrl");
        var viewImage = document.getElementById("choosenPhoto");

        function choose(id) {
            var photo = document.getElementById(id);
            setPhoto(photo.src);
        };

        function setPhoto(source) {
            hiddenUrl.value = source;
            viewImage.src = source;
        };

    </script>


</asp:Content>
