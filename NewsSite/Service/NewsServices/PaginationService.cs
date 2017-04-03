using System;
using System.Collections.Generic;
using System.Linq;
using NewsSite.Models.Membership;

// Сделать класс параметризированным?
// Нужна таблица, где лежат элементы
// Нужна колонка для сортировки элементов
// true, если по возростанию сортировать

namespace NewsSite.Service.NewsServices
{
    public class PaginationService
    {
        private readonly MyEntities db = new MyEntities();

        private readonly int _paginationSize;

        public PaginationService(int size)
        {
            _paginationSize = size;
        }


        public List<News> GetNewsBlock(int pageNumber)
        {
            return
                (from blockNews in db.News orderby blockNews.Date descending select blockNews).
                    Skip(pageNumber*_paginationSize).
                    Take(_paginationSize).
                    ToList();
        }

        public int GetPagesCount()
        {
            int length = db.News.Count();
            return (int) Math.Ceiling((double) length/_paginationSize);
        }

        public bool IsCorrectRequest(int pageNumber)
        {
            if (pageNumber < 0 || pageNumber >= GetPagesCount())
            {
                return false;
            }
            return true;
        }
    }
}