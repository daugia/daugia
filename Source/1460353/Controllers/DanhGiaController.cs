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
        //GET: DanhGia
        public ActionResult Index(int? id)
        {
            if (id.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                var list = daugia.danhgias.Where(dg => dg.id_nguoidung == id).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var dg in list)
                {
                    if (dg.mat == 1)
                    {
                        tot++;
                    }
                    if (dg.mat == 0)
                    {
                        xau++;
                    }
                }
                int tong = xau + tot;
                ViewBag.Tot = tot;
                ViewBag.Xau = xau;
                ViewBag.Tong = tong;
                ViewBag.id = id;
                return View(list);
            }
        }
        public ActionResult NguoiMua()
        {
            using (var daugia = new daugiaEntities())
            {
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidunghientai == n && s.tinhtrang == 2 && s.nguoimuadanhgia_ == 0).ToList();
                return View(list);
            }
        }
        [HttpPost]
        public ActionResult NguoiMua(int? idnd, int chon, String noidung, int idndg, int idsp)
        {
            using (var daugia = new daugiaEntities())
            {
                danhgia dg = new danhgia();
                dg.id_nguoidung = idnd;
                dg.noidung = noidung;
                dg.id_nguoidanhgia = idndg;
                dg.mat = chon;
                dg.ngaytao = DateTime.Now;
                daugia.danhgias.Add(dg);
                var sp = daugia.sanphams.Where(s => s.id == idsp).FirstOrDefault();
                sp.nguoimuadanhgia_ = 1;
                daugia.SaveChanges();
                var ndd = daugia.nguoidungs.Where(nd => nd.id == idnd).FirstOrDefault();
                var dgnd = daugia.danhgias.Where(dgn => dgn.id_nguoidung == idnd).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var d in dgnd)
                {
                    if (d.mat == 1)
                    {
                        tot++;
                    }
                    else if (d.mat == 1)
                    {
                        xau++;
                    }
                }
                double t = (tot / (tot - xau != 0 ? tot - xau : 1)) * 100;
                ndd.diem = t;
                daugia.SaveChanges();
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidunghientai == n && s.tinhtrang == 2 && s.nguoimuadanhgia_ == 0).ToList();
                return View(list);
            }
        }
        public ActionResult NguoiBan()
        {
            using (var daugia = new daugiaEntities())
            {
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == n && s.tinhtrang == 2 && s.nguoibandanhgia_ == 0).ToList();
                return View(list);
            }
        }
        [HttpPost]
        public ActionResult NguoiBan(int? idnd, int chon, String noidung, int idndg, int idsp)
        {
            using (var daugia = new daugiaEntities())
            {
                danhgia dg = new danhgia();
                dg.id_nguoidung = idnd;
                dg.noidung = noidung;
                dg.id_nguoidanhgia = idndg;
                dg.mat = chon;
                dg.ngaytao = DateTime.Now;
                daugia.danhgias.Add(dg);
                var sp = daugia.sanphams.Where(s => s.id == idsp).FirstOrDefault();
                sp.nguoibandanhgia_ = 1;
                daugia.SaveChanges();
                var ndd = daugia.nguoidungs.Where(nd => nd.id == idnd).FirstOrDefault();
                var dgnd = daugia.danhgias.Where(dgn => dgn.id_nguoidung == idnd).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var d in dgnd)
                {
                    if (d.mat == 1)
                    {
                        tot++;
                    }
                    else if (d.mat == 0)
                    {
                        xau++;
                    }
                }
                double t = (tot / (tot - xau != 0 ? tot - xau : 1)) * 100;
                ndd.diem = t;
                daugia.SaveChanges();
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == n && s.tinhtrang == 2 && s.nguoibandanhgia_ == 0).ToList();
                return View(list);
            }
        }
    }
}