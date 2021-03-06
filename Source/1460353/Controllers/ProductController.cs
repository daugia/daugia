﻿using System;
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
        public ActionResult New(Models.sanpham sp, HttpPostedFileBase file1, HttpPostedFileBase file2, HttpPostedFileBase file3)
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
                    sp.ngayketthuc = DateTime.Now.AddDays(7);
                    sp.giahientai = sp.giakhoidiem;
                    sp.giacaonhat = sp.giakhoidiem;
                    sp.luotragia = 0;
                    sp.tang10phut = sp.tang10phut;
                    sp.solantang10phut = 0;
                    if (sp.giabanmongmuon == null || sp.giabanmongmuon < sp.giakhoidiem) { sp.giabanmongmuon = sp.giakhoidiem; }
                    if (sp.giamuangay == null || sp.giamuangay < sp.giakhoidiem) { sp.giamuangay = null; }
                    sp.tinhtrang = 1;//dang ban
                    sp.nguoibandanhgia_ = 0;
                    sp.nguoimuadanhgia_ = 0;

                    sp.guimail_ = 0;
                    ViewBag.note = 1;
                    data.sanphams.Add(sp);
                    data.SaveChanges();

                    //them thong bao
                    Helpers.thongbao.create("Bạn đã thêm sản phẩm :" + sp.ten + "thành công!");

                   // luu hinh anh


                    var mapPath = Server.MapPath("~/Source/Images/sp");
                    var dir = Path.Combine(mapPath, sp.id.ToString());
                    Directory.CreateDirectory(dir);
                    var type1 = Path.GetExtension(file1.FileName);
                    var path1 = Path.Combine(dir, "hinh1" + type1);
                    file1.SaveAs(path1);
                    sp.hinh1 = "/Source/Images/sp/" + sp.id.ToString() + "/hinh1" + type1;
                    if (file2 != null)
                    {
                        var type2 = Path.GetExtension(file2.FileName);
                        var path2 = Path.Combine(dir, "hinh2" + type2);
                        file2.SaveAs(path2);
                        sp.hinh2 = "/Source/Images/sp/" + sp.id.ToString() + "/hinh2" + type2;
                    }
                    if (file3 != null)
                    {
                        var type3 = Path.GetExtension(file3.FileName);
                        var path3 = Path.Combine(dir, "hinh3" + type3);
                        file3.SaveAs(path3);
                        sp.hinh3 = "/Source/Images/sp/" + sp.id.ToString() + "/hinh3" + type3;
                    }
                    data.Entry(sp).State = System.Data.Entity.EntityState.Modified;
                    data.SaveChanges();

                    //them chi tiet
                    var chitietsp = new Models.chinhsuachitietsp()
                    {
                        id_sanpham = sp.id,
                        thoigian = DateTime.Now,
                        noidungchinhsua = sp.chitiet
                    };
                    data.chinhsuachitietsps.Add(chitietsp);
                    data.SaveChanges();
                }
                else
                {

                    ViewBag.note = 0;

                   // them thong bao
                    Helpers.thongbao.create("Bạn đã thêm sản phẩm :" + sp.ten + " thất bại!");
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
                var list = daugia.sanphams.Where(s => s.id_danhmuc == id && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderByDescending(sp=>sp.ngaybatdau).Skip((page - 1) * recordsPerPage).Take(recordsPerPage).ToList();

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
                    TempData["Error"] = "Sản Phẩm Đã Đấu Giá Xong Hoặc Không Tồn Tại";
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

        public ActionResult TimKiem(string TuKhoa, int? page, int? iddm, int? chon)
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
                        var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderByDescending(s => s.ngayketthuc).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                        return View(loadyeuthich(list));
                    }
                    else
                    {
                        var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.giahientai).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                        return View(loadyeuthich(list));
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
                        return View(loadyeuthich(list));
                    }
                    else
                    {
                        var list = daugia.sanphams.Where(s => s.ten.ToLower().Contains(TuKhoa.ToLower()) && s.id_danhmuc == iddm && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.giahientai).Skip((page.Value - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                        return View(loadyeuthich(list));
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
                        var knd = daugia.kichnguoidungs.Where(k => k.id_nguoidung == n && k.id_sanpham == proId).FirstOrDefault();
                        if (knd == null)
                        {
                            var ktndql = daugia.sanphams.Where(sp => sp.id_nguoidung == n && sp.id == proId).FirstOrDefault();
                            if (ktndql == null)
                            {
                                var nguoidunght = daugia.nguoidungs.Where(nd => nd.id == n).FirstOrDefault();
                                if (nguoidunght.diem >= 80)
                                {
                                    if (nguoidunght.taikhoan >= Gia)
                                    {
                                        if (Gia > model.giahientai)
                                        {
                                            if (Gia >= (model.giacaonhat+model.buocgia))
                                            {
                                                if (nguoidungt != null)
                                                {
                                                    nguoidungt.taikhoan = nguoidungt.taikhoan + model.giacaonhat;
                                                    Helpers.sendMail.send(proId.Value, nguoidungt.id, "Sản phẩm này hiện đang có người giữ giá cao hơn");
                                                    Helpers.thongbao.create_with_id("Sản phẩm " + model.ten+  " mà bạn đấu giá đã có người trả giá cao hơn", nguoidungt.id);
                                                }
                                                model.giahientai = model.giacaonhat + model.buocgia;
                                                model.giacaonhat = Gia;
                                                model.id_nguoidunghientai = Login.nguoidung().id;
                                                nguoidunght.taikhoan = nguoidunght.taikhoan - Gia;
                                                model.luotragia++;

                                                Helpers.sendMail.send(proId.Value, nguoidunght.id, "Bạn là người giữ giá sản phẩm cao nhất hiện nay");
                                                Helpers.thongbao.create_with_id ("Bạn hiện đã là người giữ giá cao nhất của sản phẩm " + model.ten, nguoidunght.id);

                                                var ndql = daugia.nguoidungs.Where(nd => nd.id == model.id_nguoidung).FirstOrDefault();
                                                Helpers.sendMail.send(proId.Value, ndql.id, "Sản phẩm của bạn đã có giá cao hơn");
                                                Helpers.thongbao.create_with_id("Sản phẩm " + model.ten + " của bạn có giá cao hơn ", ndql.id);


                                                lichsudau ls = new lichsudau();
                                                ls.tiendadau = Gia;
                                                ls.id_sanpham = proId;
                                                ls.id_nguoidung = Login.nguoidung().id;
                                                ls.ngaydaugia = DateTime.Now;
                                                ls.tinhtrang = 0;
                                                daugia.lichsudaus.Add(ls);
                                                if (model.tang10phut == 1)
                                                {
                                                    if ((DateTime.Now - model.ngayketthuc.Value).TotalMinutes <= 5 && model.solantang10phut == 0)
                                                    {
                                                        model.ngayketthuc = model.ngayketthuc.Value.AddMinutes(10);
                                                        model.solantang10phut = 1;
                                                    }
                                                }
                                                TempData["Message"] = "Chúc mừng bạn đã ra giá thành công cho sản phẩm";
                                            }
                                            else
                                            {

                                                TempData["Error"] = "Có giá cao nhất + Bước giá cáo hơn giá hiện tại";
                                                if (model.tang10phut == 1)
                                                {
                                                    if ((DateTime.Now - model.ngayketthuc.Value).TotalMinutes <= 5 && model.solantang10phut == 0)
                                                    {
                                                        model.ngayketthuc = model.ngayketthuc.Value.AddMinutes(10);
                                                        model.solantang10phut = 1;
                                                    }
                                                }
                                                model.giahientai = Gia;
                                                model.luotragia++;
                                            }
                                        }
                                        else
                                        {
                                            TempData["Error"] = "Giá của bạn đặt ra thấp hơn giá hiện tại của sản phẩm";
                                        }
                                    }
                                    else
                                    {
                                        TempData["Error"] = "Xin lỗi. Tài khoản của bạn không đủ để đặt giá cho sản phẩm này";
                                    }
                                }
                                else
                                {
                                    TempData["Error"] = "Tài khoản điểm của bạn không đủ để đấu giá";
                                }
                            }

                            else
                            {
                                TempData["Error"] = "Bạn là người giữ sản phẩm nên bạn không có quyền đấu giá cho sản phẩm";
                            }
                        }
                        else
                        {
                            TempData["Error"] = "Tài khoản của bạn không đấu giá cho sản phẩm này. Rất tiếc";
                        }
                    }
                }
                else
                {
                    TempData["Error"] = "Hết hạn đấu giá";
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
                if (model.giamuangay != null)
                {
                    if (model.ngayketthuc >= DateTime.Now)
                    {
                        if (model.tinhtrang == 1)
                        {
                            var nguoidungt = daugia.nguoidungs.Where(nd => nd.id == model.id_nguoidunghientai).FirstOrDefault();
                            int n = Login.nguoidung().id;
                            var knd = daugia.kichnguoidungs.Where(k => k.id_nguoidung == n && k.id_sanpham == proId).FirstOrDefault();
                            if (knd == null)
                            {
                                var ktndql = daugia.sanphams.Where(sp => sp.id_nguoidung == n && sp.id == proId).FirstOrDefault();
                                if (ktndql == null)
                                {
                                    var nguoidunght = daugia.nguoidungs.Where(nd => nd.id == n).FirstOrDefault();
                                    if (nguoidunght.diem >= 80)
                                    {
                                        if (nguoidunght.taikhoan >= model.giamuangay)
                                        {
                                            if (nguoidungt != null)
                                            {
                                                nguoidungt.taikhoan = nguoidungt.taikhoan + model.giacaonhat;
                                            }
                                            model.giahientai = model.giamuangay;
                                            model.giacaonhat = model.giamuangay;
                                            model.id_nguoidunghientai = Login.nguoidung().id;
                                            nguoidunght.taikhoan = nguoidunght.taikhoan - model.giamuangay;
                                            model.tinhtrang = 2;

                                            Helpers.sendMail.send(proId.Value, nguoidunght.id, "Chúc mừng. Bạn đã mua thành công sản phẩm");
                                            Helpers.thongbao.create_with_id("Bạn đã mua thành công sản phẩm " + model.ten + " với giá "+ model.giahientai, nguoidunght.id);

                                            var ndql = daugia.nguoidungs.Where(nd => nd.id == model.id_nguoidung).FirstOrDefault();
                                            Helpers.sendMail.send(proId.Value, ndql.id, "Sản phẩm của bạn đã có người mua ngay");
                                            Helpers.thongbao.create_with_id("Sản phẩm " + model.ten + " của bạn đã có người mua ngay ", ndql.id);


                                            lichsudau ls = new lichsudau();
                                            ls.tiendadau = model.giamuangay;
                                            ls.id_sanpham = proId;
                                            ls.id_nguoidung = Login.nguoidung().id;
                                            ls.ngaydaugia = DateTime.Now;
                                            ls.tinhtrang = 0;
                                            daugia.lichsudaus.Add(ls);
                                        }
                                        else
                                        {
                                            TempData["Error"] = "Rất tiếc. Tài khoản của bạn không đủ tiền để tham gia đấu giá";
                                            return RedirectToAction("ChiTiet", "Product", new { id = proId });
                                        }
                                    }
                                    else
                                    {
                                        TempData["Error"] = "Tài khoản của bạn không đủ điểm đấu giá";
                                        return RedirectToAction("ChiTiet", "Product", new { id = proId });
                                    }
                                }
                                else
                                {
                                    TempData["Error"] = "Bạn là người hiện đang giữ sản phẩm nên bạn không có quyền đấu giá cho sản phẩm";
                                    return RedirectToAction("ChiTiet", "Product", new { id = proId });
                                }
                            }
                            else
                            {
                                TempData["Error"] = "Rất tiếc. Tài khoản ủa bạn không có quyền ra giá cho sản phẩm này";
                                return RedirectToAction("ChiTiet", "Product", new { id = proId });
                            }
                        }
                    }
                    else
                    {
                        TempData["Error"] = "Sản phẩm đã hết thời hạn đấu giá";
                        return RedirectToAction("ChiTiet", "Product", new { id = proId });
                    }
                }
                else
                {
                    TempData["Error"] = "Sản phẩm không được mua ngay";
                    return RedirectToAction("ChiTiet", "Product", new { id = proId });
                }
                TempData["Message"] = "Bạn đã đặt thành công cho sản phẩm này";
                daugia.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
        }


        //Cua tao
        
        public ActionResult searchlist(string name)
        {
            using (var data = new Models.daugiaEntities())
            {
                
                var prolist = data.sanphams.Where(sp => sp.ten.ToLower().Contains(name) && sp.tinhtrang==1 && sp.ngayketthuc>=DateTime.Now).ToList();
                return Json(prolist, JsonRequestBehavior.AllowGet);
            }
        }
        [Filters.LoginUser]
        public ActionResult QuanLySanPham(int page=1)
        {
            using (var daugia = new daugiaEntities())
            {
                int nd = Login.nguoidung().id;
                var n = daugia.sanphams.Where(s => s.id_nguoidung == nd && s.tinhtrang==1 && s.ngayketthuc >= DateTime.Now).Count();
                int recordsPerPage = 4;
                int nPage = n / recordsPerPage;
                int m = n % recordsPerPage;
                if (m > 0)
                {
                    nPage++;
                }
                ViewBag.Pages = nPage;
                ViewBag.CurPage = page;
                var list = daugia.sanphams.Where(s => s.id_nguoidung == nd && s.tinhtrang == 1 && s.ngayketthuc >= DateTime.Now).OrderBy(s => s.id).Skip((page - 1) * recordsPerPage).Take(recordsPerPage).ToList();
                return View(list);
            }
        }
        [Filters.LoginUser]
        public ActionResult SapxepGiatangdan()
        {
            using (var daugia = new daugiaEntities())
            {
                int n = Login.nguoidung().id;
                var list = daugia.sanphams.OrderByDescending(p => p.giahientai).ToList();
                return View(list);
            }
        }

        //
        //Quan ki san pham
        [Filters.LoginUser]
        public ActionResult Manage()
        {

            using (var data = new Models.daugiaEntities())
            {
                var idnguoidung = Helpers.Login.nguoidung().id;
                var datenow = DateTime.Now;
                var listsp = data.sanphams.Where(sp => sp.id_nguoidung == idnguoidung && sp.tinhtrang == 1 && sp.ngayketthuc > datenow).OrderByDescending(sp => sp.ngaybatdau).ToList();
                ViewBag.pageTotal = (listsp.Count % 4) == 0 ? (listsp.Count / 4) : (listsp.Count / 4) + 1;
                listsp = listsp.Skip(0).Take(4).ToList();
                return View(listsp);
            }


        }
        public ActionResult ManageAjax(int page=1)
        {

            using (var data = new Models.daugiaEntities())
            {
                var idnguoidung = Helpers.Login.nguoidung().id;
                var datenow = DateTime.Now;
                var listsp = data.sanphams.Where(sp => sp.id_nguoidung == idnguoidung && sp.tinhtrang == 1 && sp.ngayketthuc > datenow).OrderByDescending(sp => sp.ngaybatdau).ToList();
                ViewBag.pageTotal = (listsp.Count % 4) == 0 ? (listsp.Count / 4) : (listsp.Count / 4) + 1;
                listsp = listsp.Skip((page-1)*4).Take(4).ToList();
                return Json(listsp,JsonRequestBehavior.AllowGet);
            }
        }


        [Filters.LoginUser]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, string mieutangan, string chitiet)
        {
            using (var data = new Models.daugiaEntities())
            {
                var sp = data.sanphams.Find(id);
              
                sp.mieutangan = mieutangan;
                sp.chitiet = chitiet;

                
                data.Entry(sp).State = System.Data.Entity.EntityState.Modified;

                var chitietsp = new Models.chinhsuachitietsp()
                {
                    id_sanpham = id,
                    thoigian = DateTime.Now,
                    noidungchinhsua = chitiet
                };
                data.chinhsuachitietsps.Add(chitietsp);
                data.SaveChanges();

                ViewBag.note = 1;
                return RedirectToAction("manage","product");
            }

        }

        [Filters.LoginUser]
        [HttpPost]
        public ActionResult Delete(int id)
        {
            using (var data = new Models.daugiaEntities())
            {
                var sp = data.sanphams.Find(id);
                if (sp.ngayketthuc >= DateTime.Now && sp.tinhtrang == 1)
                {
                    var nddg = data.nguoidungs.Where(nd=>nd.id==sp.id_nguoidunghientai).FirstOrDefault();
                    if (nddg != null)
                    {
                        nddg.taikhoan = sp.giacaonhat + nddg.taikhoan;
                    }
                    sp.tinhtrang = -1;
                    data.Entry(sp).State = System.Data.Entity.EntityState.Modified;
                    data.SaveChanges();
                }
                return Json(1, JsonRequestBehavior.DenyGet);
            }
        }

        //29/6
        [Filters.LoginUser]
        public ActionResult list_dau(int page=1)//danh sach san phan dang tham gia dau gia
        {
            using (var data=new Models.daugiaEntities())
            {
                var id_nguoidung = Helpers.Login.nguoidung().id; 
                var list_sanpham = data.sanphams.Where(sp => sp.tinhtrang == 1 && sp.id_nguoidunghientai==id_nguoidung).ToList();// danh sách sản phẩm còn han đấu giá ma nguoi dung dang giứ giá
                ViewBag.page = page;
                ViewBag.pageTotal = list_sanpham.Count % 4 == 0 ? (list_sanpham.Count / 4) : (list_sanpham.Count / 4)+1;

                return View(list_sanpham.Skip((page-1)*4).Take(4).ToList()); 
            }
            
        }

        [Filters.LoginUser]
        public ActionResult list_win(int page=1)//danh sach san phan dang thang
        {
            using (var data = new Models.daugiaEntities())
            {
                var id_nguoidung = Helpers.Login.nguoidung().id;
                var list_sanpham = data.sanphams.Where(sp => sp.tinhtrang == 2 && sp.id_nguoidunghientai == id_nguoidung).OrderByDescending(sp=>sp.ngayketthuc).ToList();// danh sách sản phẩm kết thúc đấu giá và người dùng chiến thắng
                ViewBag.page = page;
                ViewBag.pageTotal = list_sanpham.Count % 4 == 0 ? (list_sanpham.Count / 4) : (list_sanpham.Count / 4) + 1;

                return View(list_sanpham.Skip((page - 1) * 4).Take(4).ToList());
            }
        }

        [Filters.LoginUser]
        public ActionResult list_daduocmua(int page=1)
        {
            using (var data = new Models.daugiaEntities())
            {
                var id_nguoidung = Helpers.Login.nguoidung().id;
                var list_sanpham = data.sanphams.Where(sp => sp.tinhtrang == 2 && sp.id_nguoidung == id_nguoidung && sp.id_nguoidunghientai!=null).OrderByDescending(sp => sp.ngayketthuc).ToList();// danh sách sản phẩm đã có người mua
                ViewBag.page = page;
                ViewBag.pageTotal = list_sanpham.Count % 4 == 0 ? (list_sanpham.Count / 4) : (list_sanpham.Count / 4) + 1;

                return View(list_sanpham.Skip((page - 1) * 4).Take(4).ToList());
            }
        }

    }
}