using HRMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    public class EmployeeController : Controller
    {
        HRMSEntities hrms=new HRMSEntities();
        public ActionResult Employee()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetEmployee()
        {
            var res = hrms.SP_GET_EMPLOYEE().ToList();
            return Json(res, JsonRequestBehavior.AllowGet); ;
        }



    }
}