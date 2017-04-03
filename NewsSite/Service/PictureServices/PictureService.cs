using System.Collections.Generic;
using System.Linq;
using System.Web;
using NewsSite.Models.Membership;

namespace NewsSite.Service.PictureServices
{
    public class PictureService
    {
        private readonly MyEntities db = new MyEntities();

        private const string NoPhoto = "/Images/Pages/NoPhoto.jpg";

        public string GetNoPhoto()
        {
            return NoPhoto;
        }

        public void Check(News news)
        {
            if (news.PictureUrl.Equals(NoPhoto))
            {
                news.PictureUrl = null;
            }
        }

        public List<Picture> GetAllPictures()
        {
            return (from picture in db.Pictures select picture).ToList();
        }

        public void CutUrl(News news)
        {
            string uri =
                "http://"
                + HttpContext.Current.Request.Url.Host
                + ":"
                + HttpContext.Current.Request.Url.Port;

            const string subPath = "/Images/Collection/";

            news.PictureUrl = news.PictureUrl.Replace(uri, "");
            news.PictureUrl = news.PictureUrl.Replace(subPath, "");
        }
    }
}