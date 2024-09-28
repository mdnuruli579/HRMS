using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        static string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        public ActionResult MainDashboard()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Employee_Overview()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SPEMPLOYEE_OVERVIEW", con);
            cmd.CommandType=CommandType.StoredProcedure;
            SqlDataAdapter sda=new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            string result = JsonConvert.SerializeObject(dt);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}