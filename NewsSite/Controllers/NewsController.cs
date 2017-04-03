using System;
using System.Collections.Generic;
using System.Web.Mvc;
using NewsSite.Models.Membership;
using NewsSite.Service.NewsServices;
using NewsSite.Service.PictureServices;

namespace NewsSite.Controllers
{
    public class NewsController : Controller
    {
        private readonly NewsCrudService _service = new NewsCrudService();
        private readonly PictureService _pictureService = new PictureService();
        private readonly NewsRandomService _randomNews = new NewsRandomService();
        private readonly PaginationService _pagination = new PaginationService(5);

        public ActionResult Index(int id = 0)
        {
            if (!_pagination.IsCorrectRequest(id))
            {
                return HttpNotFound();
            }

            ViewBag.pageNumber = id;
            ViewBag.pagesCount = _pagination.GetPagesCount();
            ViewBag.randomNews = _randomNews.GetRandomNews();

            List<News> news = _pagination.GetNewsBlock(id);
            return View(news);
        }

        public ActionResult Details(int id)
        {
            News news = _service.GetObjectById(id);

            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        [Authorize]
        public ActionResult Create()
        {
            var news = new News {Date = DateTime.Now, PictureUrl = _pictureService.GetNoPhoto()};

            ViewBag.Collection = _pictureService.GetAllPictures();

            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create(News news)
        {
            if (ModelState.IsValid)
            {
                _pictureService.CutUrl(news);
                _pictureService.Check(news);
                _service.SaveObject(news);
                return RedirectToAction("ViewNews", "Admin");
            }
            news.Date = DateTime.Now;
            ViewBag.Collection = _pictureService.GetAllPictures();

            return View(news);
        }

        [Authorize]
        public ActionResult Edit(int id)
        {
            News news = _service.GetObjectById(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.Collection = _pictureService.GetAllPictures();
            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit(News news)
        {
            _pictureService.CutUrl(news);
            _pictureService.Check(news);
            if (ModelState.IsValid)
            {
                _service.UpdateAndAttachObject(news);
                return RedirectToAction("ViewNews", "Admin");
            }

            ViewBag.Collection = _pictureService.GetAllPictures();
            return View(news);
        }


        [Authorize]
        public ActionResult Delete(int id)
        {
            News news = _service.GetObjectById(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }


        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = _service.GetObjectById(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            _service.DeleteObject(news);
            return RedirectToAction("ViewNews", "Admin");
        }

        protected override void Dispose(bool disposing)
        {
            _service.Dispose();
            base.Dispose(disposing);
        }
    }
}