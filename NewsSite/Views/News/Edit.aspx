<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NewsSite.Models.Membership.News>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Редактирование новости</legend>
    </fieldset>


    <div class="row">

        <div class="span4">

            <div>
                <h4>Заголовок: </h4>
                <input type="text" name="Title" placeholder="Введите заголовок" required value="<%: Model.Title %>" style="width: 300px;" maxlength="100" /><br />
                <%: Html.ValidationMessageFor(model => model.Title) %>
            </div>
            <div>
                <h4>Дата события:</h4>
                <input type="date" name="Date" required value="<%: String.Format("{0:yyyy-MM-dd}", Model.Date) %>" />
            </div>


            <div>
                <h4>Краткое описание: </h4>
                <textarea name="BriefDescription" required style="display: block; height: 100px; width: 300px;" placeholder="Кратко опишите событие"><%: Model.BriefDescription %></textarea>
                <%: Html.ValidationMessageFor(model => model.BriefDescription) %>
            </div>

            <div>
                <h4>Выбранный файл:</h4>

                <img id="choosenPhoto" src="/Images/Collection/<%: Model.PictureUrl %>" style="height: 300px; width: 300px;" />

            </div>

            <br />
            <p>
                <input type="submit" value="Применить изменения" class="btn btn-large createButton" />
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

                <div class="span2" style="margin-left: 0px; margin-top: 20px;">
                    <img id="<%: i %>" src="/Images/Collection/<%: item.PictureUrl %>" onclick=" choose(<%: i %>) " style="height: 150px; width: 150px;" />

                </div>
                <% } %>
            </div>

        </div>

        <%: Html.Hidden("NewId", Model.NewId) %>
        <%: Html.Hidden("PictureUrl", Model.PictureUrl) %>

        <% } %>
    </div>





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

        if (hiddenUrl.value == null || hiddenUrl.value == "") {
            setPhoto("/Images/Pages/NoPhoto.jpg");
        };

    </script>



    <div>
        <a href="/Admin/ViewNews/" class="btn linkButton">Назад к новостям</a>
    </div>

</asp:Content>
