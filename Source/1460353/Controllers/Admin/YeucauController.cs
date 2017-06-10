using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers.Admin
{
    public class YeucauController : Controller
    {
        // GET: Yeucau
        [Filters.LoginAdmin]
        public ActionResult Index()
        {
            using (var data = new Models.daugiaEntities())
            {
                var list = new List<List<Models.yeucau>>();
                list.Add(data.yeucaus.Where(yc => yc.tinhtrang == 1 && yc.capphep == 1).OrderByDescending(yc=>yc.ngaytao).ToList());
                list.Add(data.yeucaus.Where(yc => yc.tinhtrang == 1 && yc.capphep == 0).OrderByDescending(yc => yc.ngaytao).ToList());
                if(Session["note"]!=null){
                    ViewBag.note = 1;
                    Session.Remove("note");
                }
                return View(list);
            }

        }

        [Filters.LoginAdmin]
        public ActionResult Accept(int id)
        {
            using (var data = new Models.daugiaEntities())
            {
                var yeucau = data.yeucaus.Find(id);
                yeucau.capphep = 1;
                yeucau.ngayduocban = DateTime.Now;
                yeucau.ngayketthuc = DateTime.Now.AddDays(7);
                data.Entry(yeucau).State = System.Data.Entity.EntityState.Modified;
                var nguoidung = data.nguoidungs.Find(yeucau.id_nguoidung);
                nguoidung.capphep = 1;
                data.SaveChanges();

                
                Session["note"] = 1;

                //them thong bao 
                Helpers.thongbao.create("Bạn đã cho phép "+nguoidung.ten+ " bán hang trong 7 ngày!");

                return RedirectToAction("Index","Yeucau");
            }

        }
        [Filters.LoginAdmin]
        public ActionResult Delete(int id1)
        {
            using (var data = new Models.daugiaEntities())
            {
                var nguoidung = data.yeucaus.Find(id1);
                data.yeucaus.Remove(nguoidung);
                data.SaveChanges();

            }
            return RedirectToAction("Index", "Yeucau");
        }
        [Filters.LoginUser]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult New(string noidung)
        {
            using (var data = new Models.daugiaEntities())
            {
                var id = Helpers.Login.nguoidung().id;
                var kiemtrayeucau = data.yeucaus.Where(yc => yc.tinhtrang == 1 && yc.id_nguoidung == id).FirstOrDefault();

                if (kiemtrayeucau == null)//chua co thi them
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

                    //them thong bao sua thanh cong
                    Helpers.thongbao.create("Bạn đã yêu cầu bán hàng trong 7 ngày!");
                }
                else//co roi thi cap nhat lai
                {
                    kiemtrayeucau.noidung = noidung;
                    kiemtrayeucau.ngaytao = DateTime.Now;
                    data.Entry(kiemtrayeucau).State = System.Data.Entity.EntityState.Modified;
                    data.SaveChanges();

                    //them thong bao sua thanh cong
                    Helpers.thongbao.create("Bạn đã yêu cầu bán hàng trong 7 ngày!");
                }

            }
            return RedirectToAction("Index", "Home");
        }
       
        [Filters.LoginAdmin]
        public ActionResult list()
        {
            using (var data=new Models.daugiaEntities())
            {
                var listyeucau = data.yeucaus.Where(yc=>yc.tinhtrang==1 && yc.capphep==0).ToList();
                return PartialView("list",listyeucau);
            }
               
        }

        [Filters.LoginAdmin]
        public ActionResult AcceptAjax(int id)
        {
            using (var data = new Models.daugiaEntities())
            {
                var yeucau = data.yeucaus.Find(id);
                yeucau.capphep = 1;
                yeucau.ngayduocban = DateTime.Now;
                yeucau.ngayketthuc = DateTime.Now.AddDays(7);
                data.Entry(yeucau).State = System.Data.Entity.EntityState.Modified;
                var nguoidung = data.nguoidungs.Find(yeucau.id_nguoidung);
                nguoidung.capphep = 1;
                data.SaveChanges();

                //them thong bao thanh cong
             
                Helpers.thongbao.create("Bạn đã cho phép :"+nguoidung.ten+" bán hàng trong 7 ngày!");
                return Json(1,JsonRequestBehavior.AllowGet);
            }
        }

        [Filters.LoginAdmin]
        public ActionResult DeleteAjax(int id)
        {
            using (var data=new Models.daugiaEntities())
            {
                var yeucau = data.yeucaus.Find(id);
                yeucau.tinhtrang = 0;
               
                data.Entry(yeucau).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
                return Json(1,JsonRequestBehavior.AllowGet);
            }
        }
    }
}