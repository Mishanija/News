using System.Web.Mvc;

namespace NewsSite.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult AdminRequest()
        {
            return View();
        }

        public ActionResult Index()
        {
            //if (Request.IsAuthenticated)
            //{ return RedirectToAction("Index", "Admin"); }
            return View();
        }
    }
}