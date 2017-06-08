using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1460353.Helpers;
using _1460353.Models;
using _1460353.Filters;

namespace _1460353.Controllers
{
    [Filters.LoginUser]
    public class KichNguoiDungController : Controller
    {
        // GET: KichNguoiDung
        [HttpPost]
        public ActionResult Index(int? idsp, int? idnd)
        {
            using (var daugia = new daugiaEntities())
            {
                kichnguoidung k = new kichnguoidung();
                k.id_nguoidung = idnd;
                k.id_sanpham = idsp;
                k.id_nguoidungquanlysp = Login.nguoidung().id;
                daugia.kichnguoidungs.Add(k);
                daugia.SaveChanges();
                return RedirectToAction("LSSanPham", "LichSuDau", new { id = idsp });
            }
 
        }
    }
}