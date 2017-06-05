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
        [Filters.Login] //phan nay quan li cua admin
        public ActionResult Index()
        {
            using (var data = new Models.daugiaEntities())
            {
                var list=new  List<List<Models.danhmuc>>();
                if (Session["note"] != null)
                {
                    ViewBag.note = 1;
                    Session.Remove("note");
                    list.Add(data.danhmucs.Where(dm => dm.trinhtrang == 1).ToList());
                    list.Add(data.danhmucs.Where(dm => dm.trinhtrang == 0).ToList());
                }
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


        [Filters.Login]
        public ActionResult Edit(Models.danhmuc dm)
        {
            using (var data = new Models.daugiaEntities())
            {

                var dmold = data.danhmucs.Find(dm.id);
                dmold.ten = dm.ten;
                dmold.ngaycapnhat = DateTime.Now;
                data.Entry(dmold).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
                Session["note"] = 1;
                return RedirectToAction("Index", "Category");
            }
        }

        [Filters.Login]
        public ActionResult Add(Models.danhmuc dm)
        {
            using (var data = new Models.daugiaEntities())
            {
                dm.ngaytao = DateTime.Now;
                dm.trinhtrang = 1;
                data.danhmucs.Add(dm);
                data.SaveChanges();
                Session["note"] = 1;
                return RedirectToAction("Index", "Category");
            }
        }

        [Filters.Login]
        public ActionResult delete(int id)
        {
            using (var data = new Models.daugiaEntities())
            {
                var dmold = data.danhmucs.Find(id);
                dmold.trinhtrang = 0;
                data.Entry(dmold).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
                return RedirectToAction("Index", "Category");
            }
        }
    }
}