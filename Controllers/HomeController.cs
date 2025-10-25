using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webmvc.Models;
using System.Data.SqlClient;

namespace webmvc.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        DO_AN_GIOVANNIEntities DATA = new DO_AN_GIOVANNIEntities();
        public ActionResult Index()
        {
            List<SANPHAM> DSSP = DATA.SANPHAMs.ToList();
            return View(DSSP);
        }
        public ActionResult MENU_chude()
        {
            List<DANHMUC> dm = DATA.DANHMUCs.ToList();
            return View(dm);
        }
    }
}
