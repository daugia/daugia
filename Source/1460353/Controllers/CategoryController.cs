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
        public ActionResult Index()
        {
            return View();
        }
        //load list danh muc vao partial view
        public ActionResult LoadPartial()
        {
            using (var data = new Models.daugiaEntities())
            {
                return PartialView("LoadPartial",data.danhmucs.Where(dm=>dm.trinhtrang==1).ToList());
            }
           
        }
    }
}