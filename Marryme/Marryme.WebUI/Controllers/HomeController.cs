﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.WebUI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //if (Request.QueryString["EmailConfirmed"] != null)
            //{
            //    bool isEmailConfirmed = Convert.ToBoolean(Request.QueryString["EmailConfirmed"]);
            //    ViewBag.EmailConfimation = isEmailConfirmed;
            //}
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}