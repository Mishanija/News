<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Collection
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        jQuery(window).load(function() {
            $x = $(window).width();
            if ($x > 1024) {
                jQuery("#content .row").preloader();
            }
            jQuery('.magnifier').touchTouch();
            jQuery('.spinner').animate({ 'opacity': 0 }, 1000, 'easeOutCubic', function() { jQuery(this).css('display', 'none'); });
        });

    </script>

    <script type="text/javascript">
        if ($(window).width() > 1024) {
            document.write("<" + "script src='/Content/js/jquery.preloader.js'></" + "script>");
        }
    </script>

    <div class="row">
        <div class="span5">
            <div class="alert alert-success">
                <h4>Все изображения</h4>
            </div>
            
            <img src="/Images/Pages/photos.jpg" style="height: 80%; width: 80%;" alt="" />
        </div>
        <div class="span9">
            <div class="alert alert-success">
                <h4>Чтобы пополнить коллекцию, вы можете загрузить фотографии</h4>
            </div>
            
            <a href="/Admin/UploadPhotos/" class="btn addButton">Загрузить новые фотографии</a>
        </div>
    </div>

    <div class="row" style="margin-top: 40px;">

        <ul class="portfolio clearfix">
            <% foreach (var element in Model)
               { %>

                <li><a href="/Images/Collection/<%: element.PictureUrl %>" class="magnifier">
                        <img src="/Images/Collection/<%: element.PictureUrl %>" width="225" style="height: 150px"></a>
                    <a href="/Admin/DeletePhoto/<%: element.PictureId %>" class="btn deleteButton">Удалить изображение</a>
                </li>
            <% } %>
        </ul>
    </div>

</asp:Content>