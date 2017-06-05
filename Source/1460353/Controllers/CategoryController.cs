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
                if(Session["note"]!=null){
                    ViewBag.note = 1;
                    Session.Remove("note");
                }
                return View(data.danhmucs.ToList());
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
        public ActionResult Edit(int id,string ten)
        {
            using(var data=new Models.daugiaEntities()){

                var dm = data.danhmucs.Find(id);
                dm.ten = ten;
                data.Entry(dm).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
               Session["note"] = 1;
                return RedirectToAction("Index","Category");
            }
        }
    }
}