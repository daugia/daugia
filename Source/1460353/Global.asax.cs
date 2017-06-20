using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

using System.Timers;
namespace _1460353
{
    public class MvcApplication : System.Web.HttpApplication
    {
        private static Timer eTimer;
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            setTimer();
        }
        private static void setTimer()
        {
            eTimer = new Timer(1000);
            eTimer.Elapsed += TimerHandle;
            eTimer.AutoReset = true;
            eTimer.Enabled = true;
            eTimer.Start();
            
        }
        private static void TimerHandle(Object obj,ElapsedEventArgs e)
        {
            //send mail auto
            using (var data = new Models.daugiaEntities())
            {
                var list_sanpham_hethandaugia = data.sanphams.Where(sp => sp.ngayketthuc < DateTime.Now && sp.tinhtrang == 1 && sp.guimail_==0).ToList();
                foreach(var sp in list_sanpham_hethandaugia){
                    if(sp.giahientai==sp.giakhoidiem)//gui mail cho chu san pham khi khong co ai dau gia
                    {
                        Helpers.sendMail.send(sp.id,(int)sp.id_nguoidung, "Xin lỗi sản phẩm của bạn không có ai tham giá đấu giá!");
                    }
                    else //san phan co nguoi thang cuoc
                    {
                        Helpers.sendMail.send(sp.id, (int)sp.id_nguoidung, "Chúc mừng bạn sản phẩm đã cõ người đấu giá thành công!");
                        Helpers.sendMail.send(sp.id, (int)sp.id_nguoidunghientai, "Chúc mừng bạn đã đấu giá thành công sản phẩm này!");
                    }
                    sp.guimail_ = 1;
                    sp.tinhtrang = 2;
                    data.Entry(sp).State = System.Data.Entity.EntityState.Modified;
                    data.SaveChanges();
                }
            }
            //check han yeu cau

            using(var data=new Models.daugiaEntities()){
                var list_yeucau = data.yeucaus.Where(yc => yc.ngayketthuc < DateTime.Now && yc.tinhtrang==1).ToList();///tinh trang =1 dang yeu cau hoat hoat dong ,0 het han hoac bi xoa
                                                                                                                      ///
                foreach(var yc in list_yeucau){
                    yc.tinhtrang = 0;
                    var nguoidung_yeucau = data.nguoidungs.Find(yc.id_nguoidung);//huy bo cap phep cua nguoi dung khi het han
                    nguoidung_yeucau.capphep = 0;
                    data.Entry(nguoidung_yeucau).State = System.Data.Entity.EntityState.Modified;
                    data.Entry(yc).State = System.Data.Entity.EntityState.Modified;
                    data.SaveChanges();
                }
            }
        }
               
    }
}
