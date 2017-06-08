using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1460353.Models;
using _1460353.Helpers;
using _1460353.Filters;
namespace _1460353.Controllers
{
    [Filters.LoginUser]
    public class LichSuDauController : Controller
    {
        // GET: LichSuDau

        public ActionResult Index(int ?page = 1)
        {
            if (page.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                int nd = Login.nguoidung().id;
                var query = from sp in daugia.sanphams join ls in daugia.lichsudaus on sp.id equals ls.id_sanpham where ls.id_nguoidung == nd orderby ls.ngaydaugia descending select ls;
                var query2 = from sp in daugia.sanphams join ls in daugia.lichsudaus on sp.id equals ls.id_sanpham where ls.id_nguoidung == nd orderby ls.ngaydaugia descending select sp;
                int n = query.Count();
                int recordsPerPage = 4;
                int nPage = n / recordsPerPage;
                int m = n % recordsPerPage;
                if (m > 0)
                {
                    nPage++;
                }
                ViewBag.Pages = nPage;
                ViewBag.CurPage = page;
                var list = query.ToList().Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                var list2 = query2.ToList().Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                ViewBag.listsp = list2;
                return View(list);
            }
        }

        public ActionResult LSSanPham(int? id)
        {
            if (id.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            int nd = Login.nguoidung().id;
            using (var daugia = new daugiaEntities())
            {
                var ktnd = daugia.sanphams.Where(s => s.id_nguoidung == nd && s.id==id).FirstOrDefault();
                if (ktnd != null)
                {
                    var list = daugia.lichsudaus.Where(ls => ls.id_sanpham == id).ToList();

                    return View(list);
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }
        }
    }
}