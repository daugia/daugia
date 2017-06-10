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
    [LoginUser]
    public class DanhGiaController : Controller
    {
        // GET: DanhGia
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult NguoiMua()
        {
            using (var daugia = new daugiaEntities())
            {
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidunghientai == n && s.tinhtrang == 2).ToList();
                return View(list);
            }
        }
 
        public ActionResult NguoiBan()
        {
            using (var daugia = new daugiaEntities())
            {
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == n && s.tinhtrang == 2).ToList();
                return View(list);
            }
        }
    }
}