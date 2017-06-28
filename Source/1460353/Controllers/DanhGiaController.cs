using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1460353.Helpers;
using _1460353.Models;
using _1460353.Filters;
namespace _1460353.Controllers
{
    [LoginUser]
    public class DanhGiaController : Controller
    {
        //GET: DanhGia
        public ActionResult Index(int? id)
        {
            if (id.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                var list = daugia.danhgias.Where(dg => dg.id_nguoidung == id).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var dg in list)
                {
                    if (dg.mat == 1)
                    {
                        tot++;
                    }
                    if (dg.mat == 0)
                    {
                        xau++;
                    }
                }
                int tong = xau + tot;
                ViewBag.Tot = tot;
                ViewBag.Xau = xau;
                ViewBag.Tong = tong;
                ViewBag.id = id;
                return View(list);
            }
        }
        public ActionResult NguoiMua()
        {
            using (var daugia = new daugiaEntities())
            {
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidunghientai == n && s.tinhtrang == 2 && s.nguoimuadanhgia_ == 0).ToList();
                return View(list);
            }
        }
        [HttpPost]
        public ActionResult NguoiMua(int? idnd, int chon, String noidung, int idndg, int idsp)
        {
            using (var daugia = new daugiaEntities())
            {
                danhgia dg = new danhgia();
                dg.id_nguoidung = idnd;
                dg.noidung = noidung;
                dg.id_nguoidanhgia = idndg;
                dg.mat = chon;
                dg.ngaytao = DateTime.Now;
                daugia.danhgias.Add(dg);
                var sp = daugia.sanphams.Where(s => s.id == idsp).FirstOrDefault();
                sp.nguoimuadanhgia_ = 1;
                daugia.SaveChanges();
                var ndd = daugia.nguoidungs.Where(nd => nd.id == idnd).FirstOrDefault();
                var dgnd = daugia.danhgias.Where(dgn => dgn.id_nguoidung == idnd).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var d in dgnd)
                {
                    if (d.mat == 1)
                    {
                        tot++;
                    }
                    else if (d.mat == 1)
                    {
                        xau++;
                    }
                }
                double t = (tot / (tot - xau != 0 ? tot - xau : 1)) * 100;
                ndd.diem = t;
                daugia.SaveChanges();
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidunghientai == n && s.tinhtrang == 2 && s.nguoimuadanhgia_ == 0).ToList();
                return View(list);
            }
        }
        public ActionResult NguoiBan()
        {
            using (var daugia = new daugiaEntities())
            {
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == n && s.tinhtrang == 2 && s.nguoibandanhgia_ == 0).ToList();
                return View(list);
            }
        }
        [HttpPost]
        public ActionResult NguoiBan(int? idnd, int chon, String noidung, int idndg, int idsp)
        {
            using (var daugia = new daugiaEntities())
            {
                danhgia dg = new danhgia();
                dg.id_nguoidung = idnd;
                dg.noidung = noidung;
                dg.id_nguoidanhgia = idndg;
                dg.mat = chon;
                dg.ngaytao = DateTime.Now;
                daugia.danhgias.Add(dg);
                var sp = daugia.sanphams.Where(s => s.id == idsp).FirstOrDefault();
                sp.nguoibandanhgia_ = 1;
                daugia.SaveChanges();
                var ndd = daugia.nguoidungs.Where(nd => nd.id == idnd).FirstOrDefault();
                var dgnd = daugia.danhgias.Where(dgn => dgn.id_nguoidung == idnd).ToList();
                int tot = 0;
                int xau = 0;
                foreach (var d in dgnd)
                {
                    if (d.mat == 1)
                    {
                        tot++;
                    }
                    else if (d.mat == 0)
                    {
                        xau++;
                    }
                }
                double t = (tot / (tot - xau != 0 ? tot - xau : 1)) * 100;
                ndd.diem = t;
                daugia.SaveChanges();
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == n && s.tinhtrang == 2 && s.nguoibandanhgia_ == 0).ToList();
                return View(list);
            }
        }

        //29/6
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult sp_win(int id,int idsp ,string noidung_,int mat)//đánh giá người bán của sản phẩm thắng
        {
            
            using (var data=new Models.daugiaEntities())
            {
                var sanpham = data.sanphams.Find(idsp);
                if (sanpham.nguoibandanhgia_==0)//chua danh gia thi dc dnh gia = 0 la chua danh gia
                {
                    sanpham.nguoibandanhgia_ = 1;
                    data.SaveChanges();

                    var id_nguoiban = id;
                    var id_nguoimua = Helpers.Login.nguoidung().id;

                    var danhgia = new Models.danhgia()
                    {
                        noidung = noidung_,
                        id_nguoidung = id_nguoiban,
                        id_nguoidanhgia = id_nguoimua,
                        ngaytao = DateTime.Now,
                        mat = mat
                    };
                    data.danhgias.Add(danhgia);
                    data.SaveChanges();

                    

                    var nguoiban = data.nguoidungs.Find(id_nguoiban);
                    var danhgia_nguoiban_total = data.danhgias.Where(dg => dg.id_nguoidung == id_nguoiban).ToList();
                    var danhgia_nguoiban_tot = danhgia_nguoiban_total.Where(dg=>dg.mat==1).Count();//mat tot
                    string diem= String.Format("{0:0.00}", ((double)danhgia_nguoiban_tot / (double)danhgia_nguoiban_total.Count) * 100);
                    nguoiban.diem =  Double.Parse(diem);
                    data.SaveChanges();

                    //thong bao  danh gia san pham nay thanh cong
                    Helpers.thongbao.create("Bạn đã đánh giá sản phẩm: " + sanpham.ten + " với người bán : " + nguoiban.ten + "!");
                }
                else
                {
                    //thong bao ban da danh gia san pham nay
                    Helpers.thongbao.create("Xin lỗi bạn đã đánh giá sản phẩm: "+sanpham.ten+" rồi!");
                }
                
            }
            return RedirectToAction("list_win", "product");
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult sp_damua(int id, int idsp, string noidung_, int mat)//đánh giá người mua sản phẩm nay`
        {

            using (var data = new Models.daugiaEntities())
            {
                var sanpham = data.sanphams.Find(idsp);
                if (sanpham.nguoimuadanhgia_ == 0)//chua danh gia thi dc dnh gia = 0 la chua danh gia
                {
                    sanpham.nguoimuadanhgia_ = 1;
                    data.SaveChanges();

                    var id_nguoimua = id;
                    var id_nguoibban = Helpers.Login.nguoidung().id;

                    var danhgia = new Models.danhgia()
                    {
                        noidung = noidung_,
                        id_nguoidung = id_nguoimua,
                        id_nguoidanhgia = id_nguoibban,
                        ngaytao = DateTime.Now,
                        mat = mat
                    };
                    data.danhgias.Add(danhgia);
                    data.SaveChanges();

                    //thong bao  danh gia san pham nay thanh cong
                    Helpers.thongbao.create("Bạn đã đánh giá sản phẩm: " + sanpham.ten + " !");

                    var nguoimua = data.nguoidungs.Find(id_nguoimua);
                    var danhgia_nguoimmua_total = data.danhgias.Where(dg => dg.id_nguoidung == id_nguoimua).ToList();
                    var danhgia_nguoimmua_tot= danhgia_nguoimmua_total.Where(dg => dg.mat == 1).Count();//mat tot
                    string diem = String.Format("{0:0.00}", ((double)danhgia_nguoimmua_tot / (double)danhgia_nguoimmua_total.Count) * 100);
                    nguoimua.diem = Double.Parse(diem);
                    data.SaveChanges();

                }
                else
                {
                    //thong bao ban da danh gia san pham nay
                    Helpers.thongbao.create("Xin lỗi bạn đã đánh giá sản phẩm: " + sanpham.ten + " rồi!");
                }

            }
            return RedirectToAction("list_daduocmua", "product");
        }
    }
}