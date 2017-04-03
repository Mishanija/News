using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using System.Windows.Forms;
using NewsSite.Models.Membership;
using NewsSite.Service.NewsServices;
using NewsSite.Service.PictureServices;

namespace NewsSite.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private readonly UploadPictureService _uploadService = new UploadPictureService();
        private readonly PictureService _pictureService = new PictureService();
        private readonly PictureCrudService _pictureCrudService = new PictureCrudService();
        private readonly PaginationService _pagination = new PaginationService(5);

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ViewNews(int id = 0)
        {
            if (!_pagination.IsCorrectRequest(id))
            {
                return HttpNotFound();
            }

            ViewBag.pageNumber = id;
            ViewBag.pagesCount = _pagination.GetPagesCount();

            IEnumerable<News> news = _pagination.GetNewsBlock(id);
            return View(news);
        }

        public ActionResult Collection()
        {
            IEnumerable<Picture> gallery = _pictureService.GetAllPictures();
            return View(gallery);
        }


        public ActionResult UploadPhotos()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UploadPhotos(IEnumerable<HttpPostedFileBase> fileUpload)
        {
            try
            {
                foreach (var file in fileUpload)
                {
                    if (file == null)
                    {
                        continue;
                    }
                    _uploadService.SavePicture(file);
                }
                
            }
            catch (HttpException)
            {
                MessageBox.Show("Ошибка! Слишком большой объем фото");
            }
            return RedirectToAction("Index");
        }

        public ActionResult DeletePhoto(int id)
        {
            var photo = _pictureCrudService.GetObjectById(id);
            if (photo == null)
            {
                return HttpNotFound();
            }
            return View(photo);
        }

        [HttpPost, ActionName("DeletePhoto")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var picture = _pictureCrudService.GetObjectById(id);
            if (picture == null)
            {
                return HttpNotFound();
            }
            _pictureCrudService.DeletePicture(picture);

            return RedirectToAction("Collection", "Admin");
        }
    }
}