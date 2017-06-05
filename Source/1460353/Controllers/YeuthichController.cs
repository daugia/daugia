﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    [Filters.LoginUser]
    public class YeuthichController : Controller
    {
        //// GET: Yeuthich
        //public ActionResult Index()
        //{
        //    return View();
        //}

        public ActionResult themyeuthich(int idsanpham)
        {
            using(var data=new Models.daugiaEntities()){
                var yeuthich = new Models.yeuthich()
                {
                    id_nguoidung=Helpers.Login.nguoidung().id,
                    id_sanpham=idsanpham
                };
                data.yeuthiches.Add(yeuthich);
                data.SaveChanges();
            }
            return Content("1", "text/plain");
        }
        public ActionResult xoayeuthich(int idsanpham)
        {
            using (var data = new Models.daugiaEntities())
            {
                var idnguoidung=Helpers.Login.nguoidung().id;
                var yeuthich = data.yeuthiches.Where(yt => yt.id_sanpham == idsanpham && yt.id_nguoidung == idnguoidung).FirstOrDefault();
                data.yeuthiches.Remove(yeuthich);
                data.SaveChanges();
            }
            return Content("1", "text/plain");
        }
    }
}