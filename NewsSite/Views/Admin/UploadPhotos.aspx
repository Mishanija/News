<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    UploadPhotos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <fieldset>
        <legend>UploadPhotos</legend>
    </fieldset>

    

    <div class="container">

        <div class="row">
            <div class="span3">
                <p>
                    <% using (Html.BeginForm("UploadPhotos", "Admin", FormMethod.Post, new {enctype = "multipart/form-data"}))
                       { %>
                        <input type="file" name="fileUpload" multiple /><br />
                        <br /><br />
                        <input type="submit" name="Submit" id="button" value="Загрузить фотографии" class="btn addButton" />

                    <% } %>
                </p>
            </div>
            <div class="span6">

                <p style="text-align: center">
                    <img src="/Images/Pages/uploadPhotos.png" style="height: 300px" />
                </p>

            </div>
        </div>
    </div>

</asp:Content>