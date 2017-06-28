using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        [Filters.LoginAdmin] //phan nay quan li cua admin
        public ActionResult Index()
        {
            using (var data = new Models.daugiaEntities())
            {
                var list=new  List<List<Models.danhmuc>>();
                if (Session["note"] != null)
                {
                    ViewBag.note = 1;
                    Session.Remove("note");
              
                }
                list.Add(data.danhmucs.Where(dm => dm.trinhtrang == 1).OrderByDescending(dm=>dm.id).ToList());
                list.Add(data.danhmucs.Where(dm => dm.trinhtrang == 0).OrderByDescending(dm => dm.id).ToList());
                return View(list);
            }

        }
        //load list danh muc vao partial view
        public ActionResult LoadPartial()
        {
            using (var data = new Models.daugiaEntities())
            {
                return PartialView("LoadPartial", data.danhmucs.Where(dm => dm.trinhtrang == 1).ToList());
            }

        }


        [Filters.LoginAdmin]
        public ActionResult Edit(Models.danhmuc dm)
        {
            using (var data = new Models.daugiaEntities())
            {
                
                var dmold = data.danhmucs.Find(dm.id);
                var thongbao = "Bạn đã cập nhật thành công danh mục :" + dmold.ten;
                dmold.ten = dm.ten;
                dmold.ngaycapnhat = DateTime.Now;
                dmold.trinhtrang = dm.trinhtrang;
                data.Entry(dmold).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
                Session["note"] = 1;

                //them thong bao sua thanh cong
                Helpers.thongbao.create(thongbao +" thành:"+dm.ten);
                return RedirectToAction("Index", "Category");
            }
        }

        [Filters.LoginAdmin]
        public ActionResult Add(Models.danhmuc dm)
        {
            using (var data = new Models.daugiaEntities())
            {
                dm.ngaytao = DateTime.Now;
                dm.ngaycapnhat = DateTime.Now;
                dm.trinhtrang = 1;
                data.danhmucs.Add(dm);
                data.SaveChanges();
                Session["note"] = 1;

                //them thong bao thêm thành công
                Helpers.thongbao.create("Bạn đã thêm danh mục:"+ dm.ten);
                return RedirectToAction("Index", "Category");
            }
        }

        [Filters.LoginAdmin]
        public ActionResult delete(int id)
        {
            using (var data = new Models.daugiaEntities())
            {
                var dmold = data.danhmucs.Find(id);
                dmold.trinhtrang = 0;
                data.Entry(dmold).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
                Session["note"] = 1;

                //them thong bao sua thanh cong
                Helpers.thongbao.create("Bạn đã xóa danh mục:" + dmold.ten);
                return RedirectToAction("Index", "Category");
            }
        }

        [Filters.LoginAdmin]
        public ActionResult Restore(int idphuchoi)
        {
            using (var p = new Models.daugiaEntities())
            {
                var dmcu = p.danhmucs.Find(idphuchoi);
                dmcu.trinhtrang = 1;
                p.Entry(dmcu).State = System.Data.Entity.EntityState.Modified;
                p.SaveChanges();
                Session["note"] = 1;

                //Them thong báo phục hồi thàng công
                Helpers.thongbao.create("Chúc mừng bạn đã phục hồi thành công:" + dmcu.ten);
                return RedirectToAction("Index", "Category");
            }
        }
    }
}