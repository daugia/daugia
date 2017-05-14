using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.IO;

namespace _1460353
{
    public class mahoa
    {
        static string hash = "anhludepzai";
        public static string Encrypt(string txt)
        {
            byte[] data = UTF8Encoding.UTF8.GetBytes(txt);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = key, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateEncryptor();
                    byte[] resuft = transform.TransformFinalBlock(data, 0, data.Length);
                    return Convert.ToBase64String(resuft, 0, resuft.Length);
                }
            }
        }
        public static string Decrypt(string txt)
        {
            byte[] data = Convert.FromBase64String(txt);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = key, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateDecryptor();
                    byte[] resuft = transform.TransformFinalBlock(data, 0, data.Length);
                    return UTF8Encoding.UTF8.GetString(resuft);
                }
            }
        }
    }
}
