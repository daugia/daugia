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
                if (Session["note"] != null)
                {
                    ViewBag.note = 1;
                    Session.Remove("note");
                }
                return View(list);
            }

        }

        public ActionResult Delete(int id)
        {
            using (var data = new Models.daugiaEntities())
            {
                var ndold = data.nguoidungs.Find(id);
                ndold.tinhtrang = 0;
                data.SaveChanges();
                Session["note"] = 1;


                var list_sp_all = data.sanphams.Where(sp => sp.tinhtrang == 1).ToList();
                foreach (var sp in list_sp_all)
                {
                    if (sp.id_nguoidung == ndold.id)//san pham cua nguoi dung //tra gia cho nguoi giữ giá và gắn sản phẩm = -1 (xóa)
                    {
                        var nd_giugia = data.nguoidungs.Find(sp.id_nguoidunghientai);
                        nd_giugia.taikhoan += sp.giacaonhat;
                        data.Entry(nd_giugia).State = System.Data.Entity.EntityState.Modified;
                        data.SaveChanges();
                        //gui thong bao cho nguoi giu gia
                        Helpers.thongbao.create_with_id("Sản phẩm:" + sp.ten + " bị xóa nên bạn được hoàn tiền đấu của sản phẩm này là:"+sp.giahientai+"!", (int)sp.id_nguoidunghientai);

                        sp.giahientai = sp.giakhoidiem;
                        sp.id_nguoidunghientai = null;
                        sp.tinhtrang = -1;//xoa
                        data.Entry(sp).State = System.Data.Entity.EntityState.Modified;
                        data.SaveChanges();
                    }
                    else if (sp.id_nguoidunghientai == ndold.id) //nguoi dung dang giu gia san pham nao do
                    {
                       
                        ndold.taikhoan += sp.giahientai;//tra tien lai cho tai khoan bi xoa
                        data.Entry(ndold).State = System.Data.Entity.EntityState.Modified;
                        data.SaveChanges();


                        sp.giahientai = sp.giakhoidiem;
                        sp.id_nguoidunghientai = null;
                        DateTime date = (DateTime)sp.ngayketthuc;
                        date.AddDays(3);
                        sp.ngayketthuc = date;
                        data.Entry(sp).State = System.Data.Entity.EntityState.Modified;
                        data.SaveChanges();
                        //gui thong bao cho nguoi ban sp
                        Helpers.thongbao.create_with_id("Vì tài khoản người giữ giá bị xóa nên sản phẩm:"+sp.ten+" của bạn sẽ bị quay lại giá khởi điểm!", (int)sp.id_nguoidung);


                    }
                }

                //them thong bao sua thanh cong
                Helpers.thongbao.create("Bạn đã xóa người dùng:" + ndold.ten);
                return RedirectToAction("Index", "Nguoidung");
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

                //them thong bao sua thanh cong
                Helpers.thongbao.create("Bạn đã phục hồi người dùng:" + ndold.ten);
                return RedirectToAction("Index", "Nguoidung");
            }
        }

        public ActionResult Reset(int id, string pass)
        {
            using (var data = new Models.daugiaEntities())
            {
                var ndold = data.nguoidungs.Find(id);
                ndold.pass = mahoa.Encrypt(pass + id);
                data.Entry(ndold).State = System.Data.Entity.EntityState.Modified;
                data.SaveChanges();
                Session["note"] = 1;

                //them thong bao sua thanh cong
                Helpers.thongbao.create("Bạn đã reset mật khẩu cho người dùng:" + ndold.ten);
                return RedirectToAction("Index", "Nguoidung");
            }
        }
    }
}