using Microsoft.Owin;
using Owin;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using WebThuVienV2.Models;


[assembly: OwinStartupAttribute(typeof(WebThuVienV2.Startup))]
namespace WebThuVienV2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            //CreateRoleandUser(); //Đã gọi tạo nên ẩn
        }
        //Hàm tạo 2 tài khoản để test
        private void CreateRoleandUser()
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            if (!roleManager.RoleExists("Admin"))
            {
                var role = new IdentityRole();
                role.Name = "Admin";
                roleManager.Create(role);
                role = new IdentityRole();
                role.Name = "Member";
                roleManager.Create(role);


                //Tao cac user
                //Admin
                var user = new ApplicationUser();
                user.UserName = "admin@thuvien.com";
                user.Email = "admin@thuvien.com";
                var check = userManager.Create(user, "123456");
                if (check.Succeeded)
                    userManager.AddToRole(user.Id, "Admin");

                //Khachhang
                user = new ApplicationUser();
                user.UserName = "khachhang1@thuvien.com";
                user.Email = "khachhang1@thuvien.com";
                check = userManager.Create(user, "123456");
                if (check.Succeeded)
                    userManager.AddToRole(user.Id, "Member");

                user = new ApplicationUser();
                user.UserName = "khachhang2@thuvien.com";
                user.Email = "khachhang2@thuvien.com";
                check = userManager.Create(user, "123456");
                if (check.Succeeded)
                    userManager.AddToRole(user.Id, "Member");
            }
        }
        
    }
}
