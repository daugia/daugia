﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1460353.Helpers
{
    public class sanphamhp
    {
        public static bool getTimein(DateTime date)//xet thoi gian san pham moi dang trong 1 h dong ho
        {
            var datenow = DateTime.Now;
            var q = datenow - date;
            return q.TotalMinutes <= 60 ? true : false;
        }
    }
}