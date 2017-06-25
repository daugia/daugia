using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Controllers
{
    public class MailController : Controller
    {
        // GET: Mail
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult load()//load danh sach ngay thang ket thuc cua san pham
        {
            using (var data = new Models.daugiaEntities())
            {
                var list = data.sanphams.Where(sp => sp.guimail_ == 0 && sp.tinhtrang == 1).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult send(int idsp)
        {
            using (var data = new Models.daugiaEntities())
            {
                var sanpham = data.sanphams.Find(idsp);
                if (sanpham.giakhoidiem == sanpham.giahientai)//san pham khong co nguoi dau gia
                {
                    //gui 1mail cho nguoi ban
                    Helpers.sendMail.send(idsp, (int)sanpham.id_nguoidung, "Rất tiếc sản phẩm của bạn không có ai đấu giá");
                    sanpham.tinhtrang = 0;
                }
                else if (sanpham.giahientai <= sanpham.giabanmongmuon && sanpham.id_nguoidunghientai !=null)
                {
                    var nguoidunght = data.nguoidungs.Where(nd => nd.id == sanpham.id_nguoidunghientai).FirstOrDefault();
                    nguoidunght.taikhoan = nguoidunght.taikhoan + sanpham.giahientai;
                    Helpers.sendMail.send(idsp, (int)sanpham.id_nguoidung, "Rất tiếc giá sản phẩm của bạn thấp hơn giá bán mong muốn");

                    Helpers.sendMail.send(idsp, (int)sanpham.id_nguoidunghientai, "Rất tiếc giá bạn đấu giá sản phẩm của bạn thấp hơn giá bán mong muốn");
                    sanpham.tinhtrang = 0;
                }
                else //san pham co nguoi dau gia 
                {
                    //maail nguoi ban
                    Helpers.sendMail.send(idsp, (int)sanpham.id_nguoidung, "Sản phẩm đã của bạn đã có người đấu giá thành công");
                    //maail nguoi mua
                    Helpers.sendMail.send(idsp, (int)sanpham.id_nguoidunghientai, "Chúc mừng bạn đã đấu giá thành công sản phẩm");
                    sanpham.tinhtrang = 2;
                }

                sanpham.guimail_ = 1;
                data.Entry(sanpham).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
            }

            return Content("", "text/plain");
        }
    }
}