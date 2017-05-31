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
        public ActionResult LoadSPTheoDanhMuc(int? id,int page=1)
        {
            if (id.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                int n = daugia.sanphams.Where(s=>s.id_danhmuc == id).Count();
                int recordsPerPage = 4;
                int nPage = n / recordsPerPage;
                int m = n % recordsPerPage;
                if (m > 0)
                {
                    nPage++;
                }
                ViewBag.Pages = nPage;
                ViewBag.CurPage = page;
                var list = daugia.sanphams.Where(s => s.id_danhmuc == id).OrderBy(s => s.id).Skip((page - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                return View(list);
            }
        }
        public ActionResult ChiTiet(int? id)
        {
            if(id.HasValue==false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                var model = daugia.sanphams.Where(s => s.id == id).FirstOrDefault();
                return View(model);
            }
        }
        
        public ActionResult TimKiem(String TuKhoa, int ?page)
        {
            if (TuKhoa == null || page.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                int n = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower())).Count();
                int recordsPerPage = 4;
                int nPage = n / recordsPerPage;
                int m = n % recordsPerPage;
                if (m > 0)
                {
                    nPage++;
                }
                ViewBag.TuKhoa = TuKhoa;
                ViewBag.Pages = nPage;
                ViewBag.CurPage = page;
                var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower())).OrderBy(s => s.id).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                return View(list);
            }
        }
    }
}