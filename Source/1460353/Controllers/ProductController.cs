using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1460353.Models;
namespace _1460353.Controllers
{
    //[Filters.Login]
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult New()
        {
            return View();
        }
        public ActionResult LoadSPTheoDanhMuc(int? iddm)
        {
            if (iddm.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                var list = daugia.sanphams.Where(s => s.id_danhmuc == iddm).ToList();
                return View(list);
            }
        }
    }
}