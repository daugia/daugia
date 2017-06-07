using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using BotDetect.Web.Mvc;
using System.IO;

namespace _1460353.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        public ActionResult Index()
        {
            return View();
        }
        [Filters.Logout]
        public ActionResult login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult login(string username, string pass, bool remember)
        {
            using (var data = new Models.daugiaEntities())
            {

                var q = data.nguoidungs.Where(n => n.username == username && n.tinhtrang == 1).FirstOrDefault();

                if (q != null)
                {
                    var txtpass = mahoa.Encrypt(pass + q.id.ToString());
                    q = data.nguoidungs.Where(n => n.username == username && n.pass == txtpass).FirstOrDefault();
                    if (q != null)
                    {

                        Session["slogin"] = "1";
                        Session["slogin_id"] = q.id;
                        if (remember)
                        {
                            Response.Cookies["clogin"].Value = "1";
                            Response.Cookies["clogin"].Expires = DateTime.Now.AddDays(7);
                            Response.Cookies["clogin_id"].Value = q.id.ToString();
                            Response.Cookies["clogin_id"].Expires = DateTime.Now.AddDays(7);
                        }
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ViewBag.q = "0";
                        return View();
                    }
                }
                else
                {
                    ViewBag.q = "0";
                    return View();
                }
            }

        }
        [Filters.Logout]
        public ActionResult signup()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [CaptchaValidation("CaptchaCode", "ExampleCaptcha", "ERROR: CAPTCHA không đúng!")]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult SignUp(Models.nguoidung u)
        {
            using (var data = new Models.daugiaEntities())
            {
                if (ModelState.IsValid)
                {
                    var q = data.nguoidungs.Where(n => n.username == u.username || n.email == u.email).FirstOrDefault();

                    if (q == null)
                    {
                        u.id = 0;
                        u.pass = mahoa.Encrypt(u.pass);
                        u.ngaytao = DateTime.Now;
                        u.quyen = 0;
                        u.diem = 5;
                        u.taikhoan = (decimal)1000000;
                        u.anhdaidien = "/Source/Images/Users/default/default.jpg";
                        u.tinhtrang = 1;
                        data.nguoidungs.Add(u);
                        data.SaveChanges();
                        u = data.nguoidungs.Find(u.id);
                        u.pass = mahoa.Encrypt(mahoa.Decrypt(u.pass) + u.id.ToString());
                        data.SaveChanges();
                        ViewBag.q = "1";
                        //tao thu muc chua anh dai dien
                        var mapPath = Server.MapPath("~/Source/Images/Users");
                        var dirPath = Path.Combine(mapPath, u.id.ToString());
                        Directory.CreateDirectory(dirPath);
                        Session["slogin"] = "1";
                        Session["slogin_id"] = u.id;
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ViewBag.q = "2";
                        return View();
                    }

                }
                ViewBag.q = "0";
                return View();
            }

        }
        [Filters.Login]
        public ActionResult Logout()
        {
            _1460353.Helpers.Login.Destroy();
            return RedirectToAction("Login", "User");
        }

        [Filters.Login]
        public ActionResult Profile()//xem thong tin
        {
            using (var data = new Models.daugiaEntities())
            {
                return View(data.nguoidungs.Find(Session["slogin_id"]));
            }
        }
        [Filters.Login]
        public ActionResult Danhsachspyeuthich()
        {
            using (var data = new Models.daugiaEntities())
            {
                var nguoidung = data.nguoidungs.Find(Session["slogin_id"]);
                var list = data.yeuthiches.Where(p => p.id_nguoidung == nguoidung.id);
                return View(list);
            }
        }
        [Filters.Login]
        public ActionResult Danhsachspdangdaugia()
        {
            using (var data = new Models.daugiaEntities())
            {
                var nguoidung = data.nguoidungs.Find(Session["slogin_id"]);
                var list = data.sanphams.Where(p => p.id_nguoidunghientai == nguoidung.id && p.tinhtrang == 1);
                return View(list);
            }
        }
        [Filters.Login]
        public ActionResult Danhsachspthang()
        {
            using (var data = new Models.daugiaEntities())
            {
                var nguoidung = data.nguoidungs.Find(Session["slogin_id"]);
                var list = data.sanphams.Where(p => p.id_nguoidunghientai == nguoidung.id && p.tinhtrang == 2);
                return View(list);
            }
        }


        [Filters.Login]
        public ActionResult Edit()//xem thong tin
        {
            using (var data = new Models.daugiaEntities())
            {
                return View(data.nguoidungs.Find(Session["slogin_id"]));
            }
        }
        [HttpPost]
        [AllowAnonymous]
        [CaptchaValidation("CaptchaCode", "ExampleCaptcha", "ERROR: CAPTCHA không đúng!")]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(_1460353.Models.nguoidung u, HttpPostedFileBase file)//Sửa thong tin
        {
            using (var data = new Models.daugiaEntities())
            {
                if (ModelState.IsValid)
                {
                    var nguoidung = data.nguoidungs.Find(u.id);
                    nguoidung.ten = u.ten;
                    nguoidung.gioitinh = u.gioitinh;
                    nguoidung.diachi = u.diachi;
                    nguoidung.sodienthoai = u.sodienthoai;
                    nguoidung.ngaycapnhat = DateTime.Now;
                    nguoidung.ngaysinh = u.ngaysinh;



                    //copy ảnh đại diện
                    if (file != null)
                    {
                        var mapPath = Server.MapPath("~/Source/Images/Users");
                        var dirPath = Path.Combine(mapPath, u.id.ToString());
                        var path = Path.Combine(dirPath, "default" + Path.GetExtension(file.FileName));
                        file.SaveAs(path);
                        nguoidung.anhdaidien = "/Source/Images/Users/" + u.id.ToString() + "/default" + Path.GetExtension(file.FileName);
                    }

                    data.Entry(nguoidung).State = System.Data.Entity.EntityState.Modified;
                    data.SaveChanges();
                    ViewBag.q = "1";

                    return View(nguoidung);
                }
                else
                {
                    ViewBag.q = "0";
                    return View(data.nguoidungs.Find(u.id));
                }

            }
        }


        //
        [Filters.Login]
        public ActionResult EditPass()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EditPass(string passo, string pass)//doi mat khau
        {
            if (ModelState.IsValid)
            {
                using (var data = new Models.daugiaEntities())
                {
                    
                     var   q = data.nguoidungs.Find(Session["slogin_id"]);
                   
                    var txtpasso = mahoa.Encrypt(passo + q.id.ToString());//pass cu
                    if (txtpasso == q.pass)
                    {
                        q.pass = mahoa.Encrypt(pass + q.id.ToString());
                        data.Entry(q).State = System.Data.Entity.EntityState.Modified;
                        data.SaveChanges();
                        ViewBag.q = "1";
                        return View();
                    }
                    else
                    {
                        ViewBag.q = "0";
                        return View();
                    }

                }
            }
            ViewBag.q = "0";
            return View();
        }
    }
}