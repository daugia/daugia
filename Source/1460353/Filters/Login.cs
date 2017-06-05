using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _1460353.Filters
{
    public class LoginAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (!Helpers.Login.IsLogin())//new chua dang nhap khong cho vao 
            {
                filterContext.Result = new RedirectResult("~/User/login");
            }
            
                base.OnActionExecuting(filterContext);
           
        }
    }
    public class LoginUserAttribute: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (!Helpers.Login.IsLogin())//new chua dang nhap khong cho vao 
            {
                filterContext.Result = new RedirectResult("~/User/login");
            }
            if (Helpers.Login.nguoidung().quyen == 0)
            {
                base.OnActionExecuting(filterContext);
            }
            else
            {
                filterContext.Result = new RedirectResult("~/Home/Index");
            }
        }
    }
    public class LoginAdminAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (!Helpers.Login.IsLogin())//new chua dang nhap khong cho vao 
            {
                filterContext.Result = new RedirectResult("~/User/login");
            }
            if(Helpers.Login.nguoidung().quyen==1){
                base.OnActionExecuting(filterContext);
            }
            else
            {
                filterContext.Result = new RedirectResult("~/Home/Index");
            }
        }
    }
    public class LogoutAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Helpers.Login.IsLogin())//new chua dang nhap khong cho vao 
            {
                filterContext.Result = new RedirectResult("~/Home/Index");
            }
            base.OnActionExecuting(filterContext);
        }
    }
}