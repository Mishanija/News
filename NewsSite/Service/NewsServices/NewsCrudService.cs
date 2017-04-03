using System.Collections.Generic;
using System.Linq;
using NewsSite.Models.Membership;

namespace NewsSite.Service.NewsServices
{
    public class NewsCrudService : CrudService<News>
    {
        public NewsCrudService()
        {
            Table = db.News;
        }

        public override News GetObjectById(int id)
        {
            return Table.Single(n => n.NewId == id);
        }

        public List<News> FindNewsByPictureUrl(string pictureUrl)
        {
            return (from news in Table where news.PictureUrl == pictureUrl select news).ToList();
        }
    }
}