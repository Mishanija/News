using System;
using System.Collections.Generic;
using System.Linq;
using NewsSite.Models.Membership;
using NewsSite.Service.NewsServices;

namespace NewsSite.Service.PictureServices
{
    public class PictureCrudService : CrudService<Picture>
    {
        private readonly NewsCrudService _newsCrud = new NewsCrudService();

        public PictureCrudService()
        {
            Table = db.Pictures;
        }

        public override Picture GetObjectById(int id)
        {
            return Table.Single(n => n.PictureId == id);
        }

        public void DeletePicture(Picture picture)
        {
            List<News> list = _newsCrud.FindNewsByPictureUrl(picture.PictureUrl);

            foreach (var news in list)
            {
                news.PictureUrl = null;
                _newsCrud.UpdateObject(news);
            }

            DeleteFile(picture.PictureUrl);
            DeleteObject(picture);
        }

        private void DeleteFile(string pictureUrl)
        {
            string directory = AppDomain.CurrentDomain.BaseDirectory;
            string url = "/Images/Collection/" + pictureUrl;
            System.IO.File.Delete(directory + url);
        }
    }
}