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
        [HttpPost]
        public ActionResult NguoiMua(int? idnd, int chon, String noidung, int idndg)
        {
            using (var daugia = new daugiaEntities())
            {
                danhgia dg = new danhgia();
                dg.id_nguoidung = idnd;
                dg.noidung = noidung;
                dg.id_nguoidanhgia = idndg;
                if (chon == 1)
                {
                    dg.tot = 1;
                    dg.xau = 0;
                }
                else
                {
                    dg.tot = 0;
                    dg.xau = 1;
                }
                daugia.danhgias.Add(dg);
                daugia.SaveChanges();
                var ndd = daugia.nguoidungs.Where(nd => nd.id == idnd).FirstOrDefault();
                var dgnd = daugia.danhgias.Where(dgn => dgn.id_nguoidung == idnd).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var d in dgnd)
                {
                    if (d.tot == 1)
                    {
                        tot++;
                    }
                    else if (d.xau == 1)
                    {
                        xau++;
                    }
                }
                int t = (tot / (tot - xau != 0 ? tot - xau : 1)) * 100;
                ndd.diem = t;
                daugia.SaveChanges();
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == n && s.tinhtrang == 2).ToList();
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
        [HttpPost]
        public ActionResult NguoiBan(int? idnd, int chon, String noidung, int idndg)
        {
            using (var daugia = new daugiaEntities())
            {
                danhgia dg = new danhgia();
                dg.id_nguoidung = idnd;
                dg.noidung = noidung;
                dg.id_nguoidanhgia = idndg;
                if (chon == 1)
                {
                    dg.tot = 1;
                    dg.xau = 0;
                }
                else
                {
                    dg.tot = 0;
                    dg.xau = 1;
                }
                daugia.danhgias.Add(dg);
                daugia.SaveChanges();
                var ndd = daugia.nguoidungs.Where(nd => nd.id == idnd).FirstOrDefault();
                var dgnd = daugia.danhgias.Where(dgn => dgn.id_nguoidung == idnd).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var d in dgnd)
                {
                    if (d.tot == 1)
                    {
                        tot++;
                    }
                    else if (d.xau == 1)
                    {
                        xau++;
                    }
                }
                int t = (tot / (tot - xau != 0 ? tot - xau : 1)) * 100;
                ndd.diem = t;
                daugia.SaveChanges();
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == n && s.tinhtrang == 2).ToList();
                return View(list);
            }
        }
    }
}