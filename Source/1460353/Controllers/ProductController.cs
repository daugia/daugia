using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1460353.Models;
using _1460353.Helpers;
namespace _1460353.Controllers
{
    //[Filters.Login]
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        [Filters.Login]
        public ActionResult New()
        {
            using (var ctx = new daugiaEntities())
            {
                var list = ctx.danhmucs.ToList();
                ViewBag.Danhmuc = list;
            }
            return View();
        }
        [Filters.Login]
        [HttpPost]
        public ActionResult New(sanpham sp)
        {
            using(var ctx = new daugiaEntities())
            {
                if (sp.id_danhgia == null) sp.id_danhgia = 0;
                if (sp.giahientai == null) sp.giahientai = sp.giakhoidiem;
                if (sp.giacaonhat == null) sp.giacaonhat = sp.giakhoidiem;
                if (sp.id_nguoidung == null) sp.id_nguoidung = 0;
                if (sp.id_nguoidunghientai == null) sp.id_nguoidunghientai = 0;
                if (sp.tinhtrang == null) sp.tinhtrang = 1;
                if (sp.solantang10phut == null) sp.solantang10phut = 0;
                if (sp.tang10phut == null) sp.tang10phut = 0;
                ctx.sanphams.Add(sp);
                ctx.SaveChanges();
                var list = ctx.danhmucs.ToList();
                ViewBag.Danhmuc = list;
            }
            return View();
        }
        public ActionResult LoadSPTheoDanhMuc(int? id,int page=1)
        {
            if (id.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                int n = daugia.sanphams.Where(s=>s.id_danhmuc == id && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).Count();
                int recordsPerPage = 4;
                int nPage = n / recordsPerPage;
                int m = n % recordsPerPage;
                if (m > 0)
                {
                    nPage++;
                }
                ViewBag.Pages = nPage;
                ViewBag.CurPage = page;
                ViewBag.iddm = id;
                var list = daugia.sanphams.Where(s => s.id_danhmuc == id && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.id).Skip((page - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                return View(list);
            }
        }
        public ActionResult ChiTiet(int? id)
        {
            if(id.HasValue==false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                var model = daugia.sanphams.Where(s => s.id == id && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).FirstOrDefault();
                model.luotview++;
                daugia.SaveChanges();
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
                return View(model);
            }
        }
        
        public ActionResult TimKiem(String TuKhoa, int ?page,int ?iddm,int ?chon)
        {
            if (TuKhoa == null || page.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                var listdm = daugia.danhmucs.ToList();
                ViewBag.listdm = listdm;
                if (iddm.HasValue == false)
                {
                    int n = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).Count();
                    int recordsPerPage = 4;
                    int nPage = n / recordsPerPage;
                    int m = n % recordsPerPage;
                    if (m > 0)
                    {
                        nPage++;
                    }
                    ViewBag.TuKhoa = TuKhoa;
                    ViewBag.Pages = nPage;
                    ViewBag.CurPage = page;
                    ViewBag.Chon = chon;
                    if (chon == 1)
                    {
                        var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.ngayketthuc).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                        return View(list);
                    }
                    else
                    {
                        var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.giahientai).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                        return View(list);
                    }
                }
                else
                {
                    int n = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.id_danhmuc == iddm && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).Count();
                    int recordsPerPage = 4;
                    int nPage = n / recordsPerPage;
                    int m = n % recordsPerPage;
                    if (m > 0)
                    {
                        nPage++;
                    }
                    ViewBag.TuKhoa = TuKhoa;
                    ViewBag.Pages = nPage;
                    ViewBag.CurPage = page;
                    ViewBag.iddm = iddm;
                    ViewBag.Chon = chon;
                    if (chon == 1)
                    {
                        var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.id_danhmuc == iddm && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.ngayketthuc).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                        return View(list);
                    }
                    else
                    {
                        var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.id_danhmuc == iddm && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.giahientai).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                        return View(list);
                    }
                }
            }
        }
        [Filters.Login]
        [HttpPost]
        public ActionResult Mua(int? proId,decimal ?Gia)
        {
            using (var daugia = new daugiaEntities())
            {
                var model = daugia.sanphams.Where(s => s.id == proId).FirstOrDefault();
                if (model.ngayketthuc >= DateTime.Now)
                {
                    var nguoidungt = daugia.nguoidungs.Where(nd => nd.id == model.id_nguoidunghientai).FirstOrDefault();
                    int n = Login.nguoidung().id;
                    var nguoidunght = daugia.nguoidungs.Where(nd => nd.id ==n).FirstOrDefault();
                    if (nguoidunght.diem >= 80)
                    {
                        if (nguoidunght.taikhoan >= Gia)
                        {
                            if (Gia > model.giacaonhat)
                            {
                                nguoidungt.taikhoan = nguoidungt.taikhoan + model.giacaonhat;
                                model.giahientai = model.giacaonhat + 100000;
                                model.giacaonhat = Gia;
                                model.id_nguoidunghientai = Login.nguoidung().id;
                                nguoidunght.taikhoan = nguoidunght.taikhoan - Gia;
                                if (model.tang10phut == 1)
                                {
                                    if ((DateTime.Now - model.ngayketthuc.Value).TotalMinutes <= 5 && model.solantang10phut==0)
                                    {
                                        model.ngayketthuc = model.ngayketthuc.Value.AddMinutes(10);
                                        model.solantang10phut = 1;
                                    }
                                }
                                TempData["Message"] = "Chúc Mừng Bạn Đã Ra Giá Thành Công";
                            }
                            else
                            {
                                TempData["Error"] = "Có Giá Cao Hơn Giá Bạn Đặt";
                                if (model.tang10phut == 1)
                                {
                                    if ((DateTime.Now - model.ngayketthuc.Value).TotalMinutes <= 5 && model.solantang10phut == 0)
                                    {
                                        model.ngayketthuc = model.ngayketthuc.Value.AddMinutes(10);
                                        model.solantang10phut = 1;
                                    }
                                }
                                model.giahientai = Gia;
                            }
                        }
                        else
                        {
                            TempData["Error"] = "Tài Khoản Của Bạn Không Đủ Tiền Để Đấu Giá";
                        }
                    }
                    else
                    {
                        TempData["Error"] = "Tài Khoản Của Bạn Không Đủ Điểm Để Đấu Giá";
                    }
                }
                else
                {
                    TempData["Error"] = "Sản Phẩm Này Đã Hết Hạn Đấu Giá";
                }
                daugia.SaveChanges();
                return RedirectToAction("ChiTiet", "Product", new { id = proId });
            }
        }
    }
}