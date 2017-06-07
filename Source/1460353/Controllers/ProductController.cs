using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1460353.Models;
using _1460353.Helpers;
using System.IO;

namespace _1460353.Controllers
{
    //[Filters.LoginUser]
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        [Filters.LoginUser]
        public ActionResult New()
        {
            using (var data = new daugiaEntities())
            {
                var list = data.danhmucs.ToList();
                ViewBag.Danhmuc = list;
            }
            return View();
        }
        [Filters.LoginUser]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult New(sanpham sp, HttpPostedFileBase file1, HttpPostedFileBase file2, HttpPostedFileBase file3)
        {

            using (var data = new daugiaEntities())
            {
                var list = data.danhmucs.ToList();
                ViewBag.Danhmuc = list;
                if (Helpers.Login.nguoidung().capphep == 1)
                {
                    var idnguoidung = Helpers.Login.nguoidung().id;
                    sp.id_nguoidung = idnguoidung;
                    sp.ngaybatdau = DateTime.Now;
                    sp.ngayketthuc = DateTime.Now.AddDays(15);
                    sp.tinhtrang = 1;//dang ban
                    ViewBag.note = 1;
                    data.sanphams.Add(sp);
                    data.SaveChanges();

                    //luu hinh anh
                    //

                    var mapPath = Server.MapPath("~/Source/Images/sp");
                    var dir = Path.Combine(mapPath, sp.id.ToString());
                    Directory.CreateDirectory(dir);
                    var type1 = Path.GetExtension(file1.FileName);
                    var path1 = Path.Combine(dir, "hinh1" + type1);
                    file1.SaveAs(path1);

                    if (file2 != null)
                    {
                        var type2 = Path.GetExtension(file2.FileName);
                        var path2 = Path.Combine(dir, "hinh2" + type2);
                        file2.SaveAs(path2);
                    }
                    if (file3 != null)
                    {
                        var type3 = Path.GetExtension(file3.FileName);
                        var path3 = Path.Combine(dir, "hinh3" + type3);
                        file3.SaveAs(path3);
                    }
                }
                else
                {
                    ViewBag.note = 0;
                }
            }


            return View();
        }
        public ActionResult LoadSPTheoDanhMuc(int? id, int page = 1)
        {
            if (id.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                int n = daugia.sanphams.Where(s => s.id_danhmuc == id && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).Count();
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

                return View(loadyeuthich(list));
            }
        }
        private List<Models.sanpham> loadyeuthich(List<Models.sanpham> list)
        {
            foreach (var sp in list)
            {
                if (Helpers.yeuthich.isYeuthich(sp.id))
                {
                    sp.yt = true;
                }
                else
                {
                    sp.yt = false;
                }
            }
            return list;
        }
        public ActionResult ChiTiet(int? id)
        {
            if (id.HasValue == false)
            {
                return RedirectToAction("Index", "Home");
            }
            using (var daugia = new daugiaEntities())
            {
                var model = daugia.sanphams.Where(s => s.id == id && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).FirstOrDefault();
                if (model == null)
                {
                    return RedirectToAction("Index", "Home");
                }
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

        public ActionResult TimKiem(String TuKhoa, int? page, int? iddm, int? chon)
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
        [Filters.LoginUser]
        [HttpPost]
        public ActionResult Mua(int? proId, decimal? Gia)
        {
            using (var daugia = new daugiaEntities())
            {
                var model = daugia.sanphams.Where(s => s.id == proId).FirstOrDefault();
                if (model.ngayketthuc >= DateTime.Now)
                {
                    if (model.tinhtrang == 1)
                    {
                        var nguoidungt = daugia.nguoidungs.Where(nd => nd.id == model.id_nguoidunghientai).FirstOrDefault();
                        int n = Login.nguoidung().id;
                        var nguoidunght = daugia.nguoidungs.Where(nd => nd.id == n).FirstOrDefault();
                        if (nguoidunght.diem >= 80)
                        {
                            if (nguoidunght.taikhoan >= Gia)
                            {
                                if (Gia > model.giacaonhat)
                                {
                                    if (nguoidungt != null)
                                    {
                                        nguoidungt.taikhoan = nguoidungt.taikhoan + model.giacaonhat;
                                    }
                                    model.giahientai = model.giacaonhat + 100000;
                                    model.giacaonhat = Gia;
                                    model.id_nguoidunghientai = Login.nguoidung().id;
                                    nguoidunght.taikhoan = nguoidunght.taikhoan - Gia;
                                    lichsudau ls = new lichsudau();
                                    ls.tiendadau = Gia;
                                    ls.id_sanpham = proId;
                                    ls.id_nguoidung = Login.nguoidung().id;
                                    ls.ngaydaugia = DateTime.Now;
                                    daugia.lichsudaus.Add(ls);


                                    if (model.tang10phut == 1)
                                    {
                                        if ((DateTime.Now - model.ngayketthuc.Value).TotalMinutes <= 5 && model.solantang10phut == 0)
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

        [Filters.LoginUser]
        [HttpPost]
        public ActionResult MuaNgay(int? proId)
        {
            using (var daugia = new daugiaEntities())
            {
                var model = daugia.sanphams.Where(s => s.id == proId).FirstOrDefault();
                if (model.ngayketthuc >= DateTime.Now)
                {
                    if (model.tinhtrang == 1)
                    {
                        var nguoidungt = daugia.nguoidungs.Where(nd => nd.id == model.id_nguoidunghientai).FirstOrDefault();
                        int n = Login.nguoidung().id;
                        var nguoidunght = daugia.nguoidungs.Where(nd => nd.id == n).FirstOrDefault();
                        if (nguoidunght.diem >= 80)
                        {
                            if (nguoidunght.taikhoan >= model.giamuangay)
                            {
                                nguoidungt.taikhoan = nguoidungt.taikhoan + model.giacaonhat;
                                model.giahientai = model.giamuangay;
                                model.giacaonhat = model.giamuangay;
                                model.id_nguoidunghientai = Login.nguoidung().id;
                                nguoidunght.taikhoan = nguoidunght.taikhoan - model.giamuangay;
                                model.tinhtrang = 2;
                                lichsudau ls = new lichsudau();
                                ls.tiendadau = model.giamuangay;
                                ls.id_sanpham = proId;
                                ls.id_nguoidung = Login.nguoidung().id;
                                ls.ngaydaugia = DateTime.Now;
                                daugia.lichsudaus.Add(ls);
                            }
                            else
                            {
                                TempData["Error"] = "Tài Khoản Của Bạn Không Đủ Tiền Để Đấu Giá";
                                return RedirectToAction("ChiTiet", "Product", new { id = proId });
                            }
                        }
                        else
                        {
                            TempData["Error"] = "Tài Khoản Của Bạn Không Đủ Điểm Để Đấu Giá";
                            return RedirectToAction("ChiTiet", "Product", new { id = proId });
                        }
                    }
                }
                else
                {
                    TempData["Error"] = "Sản Phẩm Này Đã Hết Hạn Đấu Giá";
                    return RedirectToAction("ChiTiet", "Product", new { id = proId });
                }
                TempData["Message"] = "Bạn Đã Mua Thành Công Sản Phẩm";
                daugia.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
        }


        //Cua tao
        [Filters.LoginUser]
        public ActionResult searchlist(string name)
        {
            using (var data = new Models.daugiaEntities())
            {
                var prolist = data.sanphams.Where(sp => sp.ten.ToLower().Contains(name)).ToList();
                return Json(prolist, JsonRequestBehavior.AllowGet);
            }
        }
        //


    }
}