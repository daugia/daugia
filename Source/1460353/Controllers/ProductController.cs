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
            using (var ctx = new daugiaEntities())
            {
                var list = ctx.danhmucs.ToList();
                ViewBag.Danhmuc = list;
            }
            return View();
        }
        [HttpPost]
        public ActionResult New(sanpham sp)
        {
            using(var ctx = new daugiaEntities())
            {
                if (sp.id_danhgia == null) sp.id_danhgia = 0;
                if (sp.giahientai == null) sp.giahientai = sp.giakhoidiem;
                if (sp.giacaonhat == null) sp.giacaonhat = sp.giakhoidiem;
                if (sp.id_nguoidung == null) sp.id_nguoidung = 0;
                if (sp.id_nguoidunghientai == null) sp.id_nguoidunghientai = 0;
                if (sp.tinhtrang == null) sp.tinhtrang = 1;
                if (sp.ngaytao == null) sp.ngaytao = DateTime.Now.ToShortDateString();
                if(sp.ngaycapnhat == null) sp.ngaycapnhat = DateTime.Now.ToShortDateString();
                if (sp.solantang10phut == null) sp.solantang10phut = 0;
                if (sp.tang10phut == null) sp.tang10phut = 0;
                ctx.sanphams.Add(sp);
                ctx.SaveChanges();
                var list = ctx.danhmucs.ToList();
                ViewBag.Danhmuc = list;
            }
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
                ViewBag.iddm = id;
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
        
        public ActionResult TimKiem(String TuKhoa, int ?page,int ?iddm)
        {
            if (TuKhoa == null || page.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                if (iddm.HasValue == false)
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
                else
                {
                    int n = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.id_danhmuc==iddm).Count();
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
                    ViewBag.iddm = iddm;
                    var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.id_danhmuc == iddm).OrderBy(s => s.id).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                    return View(list);
                }
            }
        }
    }
}