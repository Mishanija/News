using System;
using System.Collections.Generic;
using System.Linq;
using NewsSite.Models.Membership;

namespace NewsSite.Service.NewsServices
{
    public class NewsRandomService
    {
        private readonly MyEntities db = new MyEntities();

        public List<News> GetRandomNews()
        {
            var result = new List<News>();
            int length = db.News.Count();

            var random = new Random();
            for (int i = 0; i < 3; i++)
            {
                int id = random.Next(0, length);
                result.Add((from news in db.News orderby news.NewId select news).Skip(id).First());
            }
            return result;
        }
    }
}