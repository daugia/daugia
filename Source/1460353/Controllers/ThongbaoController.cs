using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    [Filters.Login]
    public class ThongbaoController : Controller
    {
        // GET: Thongbao
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult list()
        {
            using (var data = new Models.daugiaEntities())
            {
                var idnguoidung = Helpers.Login.nguoidung().id;
                var list = data.thongbaos.Where(tt => tt.id_nguoidung == idnguoidung).OrderByDescending(tt=>tt.id).ToList();
                return PartialView("list",list);

            }
        }

        public ActionResult check()//check daxem
        {
            using (var data=new Models.daugiaEntities())
            {
                var idnguoidung = Helpers.Login.nguoidung().id;
                var thongbao = data.thongbaos.Where(tt=>tt.daxem==0 && tt.id_nguoidung==idnguoidung);
                foreach (var tt in thongbao)
                {
                    tt.daxem = 1;
                    data.Entry(tt).State = System.Data.Entity.EntityState.Modified;
                   
                }
                data.SaveChanges();


                return Content("11");
            }
                
        }

    }
}