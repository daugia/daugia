﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            var list = new List<List<Models.sanpham>> ();
            using (var data=new Models.daugiaEntities())
            {
                //list sản phẩm có lượt ra nhiều nhất
                var date = DateTime.Now;
  
                var luotraggia = data.sanphams.Where(sp => sp.tinhtrang == 1 && sp.ngayketthuc > date).OrderByDescending(sp => sp.luotragia).Take(5).ToList();
                // list  5 san pham gan ket thuc han dau gia
                
                var ketthuc = data.sanphams.Where(sp => sp.tinhtrang == 1 && sp.ngayketthuc > date).OrderBy(sp => sp.ngayketthuc).Take(5).ToList();

                list.Add(luotraggia);
                list.Add(ketthuc);
            }
            if (TempData["Error"] != null)
            {
                ViewBag.Error = TempData["Error"].ToString();
                TempData.Remove("Error");
            }
            if (TempData["Message"] != null)
            {
                ViewBag.Message = TempData["Message"].ToString();
                TempData.Remove("Message");
            }
           
            return View( list);
        }
        public ActionResult Carousel()//top 5 san pham co gia cao nhat
        {
            using (var data=new Models.daugiaEntities())
            {
                var date =DateTime.Now;
                var list = data.sanphams.Where(sp => sp.tinhtrang == 1 && sp.ngayketthuc>date).OrderByDescending(sp => sp.giahientai ).Take(5).ToList();
                return PartialView("Carousel", list);

            }
               
        }
       
       
    }
}