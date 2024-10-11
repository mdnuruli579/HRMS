using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace HRMS
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapPageRoute(
                "RegisterRoute",
                "User/UserRegister",
                "~/Views/User/UserRegister.aspx"
            );
            routes.MapPageRoute(
                "LoginRoute",
                "",
                "~/Views/User/UserLogin.aspx"
            );

            routes.MapPageRoute(
                "UrlLoginRoute",
                "User/UserLogin",
                "~/Views/User/UserLogin.aspx"
            );



            routes.MapRoute(
                name: "Dashboard",
                url: "Dashboard/dashboard",
                defaults: new { controller = "Dashboard", action = "MainDashboard", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "SubmitLogin",
                url: "User/SubmitLogin",
                defaults: new { controller = "User", action = "SubmitLogin" }
            );

            routes.MapRoute(
                name: "SubmitUser",
                url: "User/SubmitUser",
                defaults: new { controller = "User", action = "SubmitUser" }
            );
            routes.MapRoute(
                name: "DashboardEmpRev",
                url: "Dashboard/Employee_Overview",
                defaults: new { controller = "Dashboard", action = "Employee_Overview" }
            );
            routes.MapRoute(
                name: "GetEmployee",
                url: "Employee/GetEmployee",
                defaults: new { controller = "Employee", action = "GetEmployee" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "{controller}", action = "{action}", id = UrlParameter.Optional }
            );
        }
    }
}
