using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1460353.Models;
using _1460353.Helpers;
using _1460353.Filters;
namespace _1460353.Controllers
{
    public class KichNguoiDungController : Controller
    {
        // GET: KichNguoiDung
        [Filters.LoginUser]
        [HttpPost]
        public ActionResult Index(int idsp, int idnd)
        {
            using (var daugia = new daugiaEntities())
            {
                kichnguoidung k = new kichnguoidung();
                k.id_nguoidung = idnd;
                k.id_sanpham = idsp;
                k.id_nguoidungquanlysp = Login.nguoidung().id;
                daugia.kichnguoidungs.Add(k);
                Helpers.sendMail.send(idsp,idnd, "Bạn Đã Bị Kich Khỏi Sản Phẩm !");
                var sp = daugia.sanphams.Where(s => s.id == idsp).FirstOrDefault();
                Helpers.thongbao.create_with_id("Bạn Bị Kích Khỏi Sản Phẩm" + sp.ten + " ! ", idnd);
                var lsd = daugia.lichsudaus.Where(ls => ls.id_sanpham == idsp && ls.id_nguoidung == idnd).ToList();
                foreach (var l in lsd)
                {
                    l.tinhtrang = 1;
                }
                daugia.SaveChanges();
                var nsp = daugia.sanphams.Where(s => s.id == idsp && s.id_nguoidunghientai == idnd).FirstOrDefault();
                if (nsp != null)
                {
                    var lsds = daugia.lichsudaus.Where(ls => ls.id_sanpham == idsp && ls.tinhtrang == 0).OrderByDescending(ls=>ls.id).FirstOrDefault();
                    var ndt = daugia.nguoidungs.Where(nd => nd.id == idnd).FirstOrDefault();
                    ndt.taikhoan = ndt.taikhoan + nsp.giacaonhat;
                    if (lsds == null)
                    {
                        nsp.giahientai = nsp.giakhoidiem;
                        nsp.giacaonhat = nsp.giakhoidiem;
                        nsp.id_nguoidunghientai = null;
                    }
                    else
                    {
                        nsp.giahientai = lsds.tiendadau;
                        nsp.giacaonhat = lsds.tiendadau;
                        nsp.id_nguoidunghientai = lsds.id_nguoidung;
                        var ndht = daugia.nguoidungs.Where(nd => nd.id == lsds.id_nguoidung).FirstOrDefault();
                        ndht.taikhoan = ndht.taikhoan - lsds.tiendadau;
                        Helpers.thongbao.create_with_id("Bây Là Người Giữ Giá Cao Nhất Sản Phẩm Của " + sp.ten + " ! ", ndht.id);
                    }
                }
                daugia.SaveChanges();
                return RedirectToAction("LSSanPham", "LichSuDau", new { id = idsp });
            }
        }
    }
}