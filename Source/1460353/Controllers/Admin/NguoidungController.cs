using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers.Admin
{
    [Filters.LoginAdmin]
    public class NguoidungController : Controller
    {
        // GET: Nguoidung
        public ActionResult Index()
        {
            using (var data = new Models.daugiaEntities())
            {
                var list = new List<List<Models.nguoidung>>();
                list.Add(data.nguoidungs.Where(nd => nd.quyen == 0 && nd.tinhtrang == 1).ToList());
                list.Add(data.nguoidungs.Where(nd => nd.quyen == 0 && nd.tinhtrang == 0).ToList());
                if(Session["note"]!=null){
                    ViewBag.note = 1;
                    Session.Remove("note");
                }
                return View(list);
            }

        }
       
        public ActionResult Delete(int id)
        {
            using(var data=new Models.daugiaEntities()){
                var ndold = data.nguoidungs.Find(id);
                ndold.tinhtrang = 0;
                data.SaveChanges();
                Session["note"] = 1;
                return RedirectToAction("Index","Nguoidung");
            }
        }
      
        public ActionResult Restore(int id)
        {
            using (var data = new Models.daugiaEntities())
            {
                var ndold = data.nguoidungs.Find(id);
                ndold.tinhtrang = 1;
                data.SaveChanges();
                Session["note"] = 1;
                return RedirectToAction("Index", "Nguoidung");
            }
        }
     
        public ActionResult Reset(int id,string pass)
        {
            using (var data = new Models.daugiaEntities())
            {
                var ndold = data.nguoidungs.Find(id);
                ndold.pass = mahoa.Encrypt(pass+id);
                data.Entry(ndold).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
                Session["note"] = 1;
                return RedirectToAction("Index", "Nguoidung");
            }
        }
    }
}