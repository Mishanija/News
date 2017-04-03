using System;
using System.IO;
using System.Web;
using NewsSite.Models.Membership;

namespace NewsSite.Service.PictureServices
{
    public class UploadPictureService
    {
        private readonly Counter _counter = new Counter("picture_id.counter");
        private readonly PictureCrudService _pictureCrud = new PictureCrudService();

        private const string ImageDirectory = "\\Images\\Collection\\";

        public void SavePicture(HttpPostedFileBase file)
        {
            string directory = AppDomain.CurrentDomain.BaseDirectory + ImageDirectory;

            if (!Directory.Exists(directory)) Directory.CreateDirectory(directory);

            string privateName = _counter.GetNumber() + "_" + file.FileName;
            file.SaveAs(directory + privateName);

            var picture = new Picture {PictureUrl = privateName};
            _pictureCrud.SaveObject(picture);
        }
    }
}