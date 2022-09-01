using Ririn.Data;
using Ririn.Models.Master;
using Microsoft.AspNetCore.Identity;
using System.Security.Cryptography;

namespace Ririn.Data
{
    public static class AutoAddUser
    {
        
        public static void PreAddUser(IApplicationBuilder app)
        {
            using( var serviceScope = app.ApplicationServices.CreateScope())
            {
                SeedData(serviceScope.ServiceProvider.GetService<AppDbContext>()!);
            }
        }
        
        private async static void SeedData(AppDbContext context)
        {
            List<User> users = new List<User>();
            users.Add(new User
            {
                Nama = "Admin",
                NPP = "80001",
                UserName = "80001",
                UnitId = 1
            });

            foreach(var item in users)
            {
                var result = context.Users.Where(x => x.UserName == item.UserName).Count();
                if(result > 0)
                {
                    continue;
                }
                else
                {
                    var pwd = "BNI" + item.NPP;
                    item.PasswordHash = HashPassword(pwd);
                    context.User.Add(item);
                    context.SaveChanges();
                }
            }
        }

        public static string HashPassword(string password)
        {
            byte[] salt;
            byte[] buffer2;
            if (password == null)
            {
                throw new ArgumentNullException("password");
            }
            using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(password, 0x10, 0x3e8))
            {
                salt = bytes.Salt;
                buffer2 = bytes.GetBytes(0x20);
            }
            byte[] dst = new byte[0x31];
            Buffer.BlockCopy(salt, 0, dst, 1, 0x10);
            Buffer.BlockCopy(buffer2, 0, dst, 0x11, 0x20);
            return Convert.ToBase64String(dst);
        }
    }

}
