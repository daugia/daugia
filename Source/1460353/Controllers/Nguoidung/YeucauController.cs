using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers.Nguoidung
{

    public class YeucauController : Controller
    {
        // GET: Yeucau
        [Filters.LoginAdmin]
        public ActionResult Index()
        {
            return View();
        }

        [Filters.LoginUser]
        [HttpPost]
        public ActionResult New(string noidung)
        {
            using (var data = new Models.daugiaEntities())
            {
                var id = Helpers.Login.nguoidung().id;
                var kiemtrayeucau = data.yeucaus.Where(yc => yc.tinhtrang == 1 && yc.id_nguoidung == id).FirstOrDefault();

                if (kiemtrayeucau == null)
                {
                    var yeucau = new Models.yeucau()
                    {
                        id_nguoidung = Helpers.Login.nguoidung().id,
                        ngaytao = DateTime.Now,
                        tinhtrang = 1,
                        capphep = 0,
                        noidung = noidung
                    };
                    data.yeucaus.Add(yeucau);
                    data.SaveChanges();
                }
                else
                {
                    kiemtrayeucau.noidung = noidung;
                    kiemtrayeucau.ngaytao = DateTime.Now;
                    data.Entry(kiemtrayeucau).State = System.Data.Entity.EntityState.Modified;
                    data.SaveChanges();
                }

            }
            return RedirectToAction("Index", "Home");
        }
    }
}