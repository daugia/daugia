using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Net;
using System.Net.Mail;
namespace _1460353.Helpers
{
    public class sendMail
    {

        private static string body(string tensanpham, string noidung, string link)
        {
            string str =
                        "<!DOCTYPE html>" +
                        "<html lang='en'>" +

                        "<head>" +
                        "	<title>Nhóm 4</title>" +
                        "	<meta charset='utf-8'>" +
                        "<style>" +
                        "		.pager {" +
                        "			border: 1em solid red;" +
                        "			margin: 20px 10%;" +
                        "			text-align: center;" +
                        "			list-style: none;" +
                        "			background-color: paleturquoise;" +
                        "		}" +

                        "		img {" +
                        "			width: 200px;" +
                        "			height: 200px;" +
                        "			margin: 0;" +
                        "		}" +

                        "		.btn {" +
                        "			display: inline-block;" +
                        "			padding: 6px 12px;" +
                        "			margin-bottom: 0;" +
                        "			font-size: 14px;" +
                        "			font-weight: normal;" +
                        "			line-height: 1.42857143;" +
                        "			text-align: center;" +
                        "			white-space: nowrap;" +
                        "			vertical-align: middle;" +
                        "			-ms-touch-action: manipulation;" +
                        "			touch-action: manipulation;" +
                        "			cursor: pointer;" +
                        "			-webkit-user-select: none;" +
                        "			-moz-user-select: none;" +
                        "			-ms-user-select: none;" +
                        "			user-select: none;" +
                        "			background-image: none;" +
                        "			border: 1px solid transparent;" +
                        "			border-radius: 4px;" +
                        "			text-decoration: none;" +
                        "		}" +

                        "		.btn:hover {" +
                        "			color: #333;" +
                        "			text-decoration: none;" +
                        "		}" +

                        "		.btn-primary {" +
                        "			color: #fff;" +
                        "			background-color: #337ab7;" +
                        "			border-color: #2e6da4;" +
                        "		}" +
                        "	</style>" +


                        "</head>" +

                        "<body>" +
                        "	<div class='pager'>" +
                        "		<h1 style='color:forestgreen'> Thông báo của Admin trang đấu giá 4</h1>" +
                        "			<h2>"+tensanpham+"</h2>" +
                        "				<img src='hinhanh' /><br/>" +
                        "				<a class='btn btn-primary' href='#linksanpham'>Link chi tiết >></a>" +
                        "				<p>" +
                        					noidung+
                        "				</p>" +
                        "	</div>" +
                        "</body>" +

                        "</html>";

            return str;
        }

        public static void send(int id_sp, int id_nguoidung, string noidung)
        {
            using (var data = new Models.daugiaEntities())
            {
                var nguoidung = data.nguoidungs.Find(id_nguoidung);

                var tMailMessage = new MailMessage();
                tMailMessage.From = new MailAddress("nguyenthithanhlap1971@gmail.com");
                tMailMessage.To.Add(new MailAddress(nguoidung.email));
                tMailMessage.Subject = "Thông báo đấu giá";
                tMailMessage.Body = body(data.sanphams.Find(id_sp).ten,noidung,null);
                tMailMessage.IsBodyHtml = true;
                tMailMessage.BodyEncoding = System.Text.Encoding.UTF8;
                tMailMessage.SubjectEncoding = System.Text.Encoding.UTF8;
                tMailMessage.Priority = MailPriority.Normal;

                var client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Credentials = new NetworkCredential("", "");
                client.Send(tMailMessage);
            }
        }

    }
}