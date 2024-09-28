using HRMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace HRMS.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        static string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        SqlConnection con=new SqlConnection(cs);
        private bool IsEmailExsist(string email)
        {
            con.Open();
            string query = "select * from TB_USER where email='" + email + "'";
            SqlCommand cmd=new SqlCommand(query, con);
            SqlDataAdapter sda=new SqlDataAdapter(cmd);
            con.Close();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }
        [HttpPost]
        public JsonResult SubmitUser(UserModel register)
        {
            if (IsEmailExsist(register.email))
            {
                return Json(new { success = false, message = "Email Already Exsist" });
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_up_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@first_name", register.firstName);
            cmd.Parameters.AddWithValue("@last_name", register.lastName);
            cmd.Parameters.AddWithValue("@dob", register.dob);
            cmd.Parameters.AddWithValue("@gender", register.gender);
            cmd.Parameters.AddWithValue("@email", register.email);
            cmd.Parameters.AddWithValue("@phone", register.phone);
            cmd.Parameters.AddWithValue("@password", register.password);
            cmd.Parameters.AddWithValue("@action", "INSERT");
            cmd.ExecuteNonQuery();
            con.Close();
            return Json(new { success = true, message = "Account Created" });

        }
        
        [HttpPost]
        public JsonResult SubmitLogin(UserModel register)
        {
            con.Open();
            string query = "select * from TB_USER where email='" + register.email + "' and password='"+ register.password + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda=new SqlDataAdapter(cmd); 
            DataTable dt=new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                return Json(new { success = true, message = "Login Success" });
            }
            return Json(new { success = false, message = "Invalid Username or Password" });


        }
    }
}