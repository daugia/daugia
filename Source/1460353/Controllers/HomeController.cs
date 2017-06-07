using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            if (TempData["Message"] != null)
            {
                ViewBag.Message = TempData["Message"].ToString();
                TempData.Remove("Message");
                return View();
            }
            using (var ctx = new Models.daugiaEntities())
            {
                var list = ctx.sanphams.OrderByDescending(p => p.giahientai).Take(5).ToList();
                return View(list);
            }
        }

	}
}