using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using webmvc.Models;

namespace webmvc.Controllers
{
    public class ProductManagementController : Controller
    {
        private DO_AN_GIOVANNIEntities db = new DO_AN_GIOVANNIEntities();

        // GET: ProductManagement - Hiển thị danh sách sản phẩm
        public ActionResult Index(string searchString, string categoryFilter, string brandFilter)
        {
            var sanphams = db.SANPHAMs.Include(s => s.DANHMUC).Include(s => s.THUONGHIEU);

            // Tìm kiếm theo tên sản phẩm
            if (!String.IsNullOrEmpty(searchString))
            {
                sanphams = sanphams.Where(s => s.TenSP.Contains(searchString) || s.MaSP.Contains(searchString));
            }

            // Lọc theo danh mục
            if (!String.IsNullOrEmpty(categoryFilter))
            {
                sanphams = sanphams.Where(s => s.MaDM == categoryFilter);
            }

            // Lọc theo thương hiệu
            if (!String.IsNullOrEmpty(brandFilter))
            {
                sanphams = sanphams.Where(s => s.MaTH == brandFilter);
            }

            // Truyền dữ liệu cho dropdown filter
            ViewBag.CategoryFilter = new SelectList(db.DANHMUCs, "MaDM", "TenDM");
            ViewBag.BrandFilter = new SelectList(db.THUONGHIEUx, "MaTH", "TenTH");
            ViewBag.CurrentFilter = searchString;

            return View(sanphams.ToList());
        }

        // GET: ProductManagement/Details/5 - Xem chi tiết sản phẩm
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sanpham = db.SANPHAMs.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            return View(sanpham);
        }

        // GET: ProductManagement/Create - Hiển thị form thêm sản phẩm
        public ActionResult Create()
        {
            ViewBag.MaDM = new SelectList(db.DANHMUCs, "MaDM", "TenDM");
            ViewBag.MaTH = new SelectList(db.THUONGHIEUx, "MaTH", "TenTH");
            return View();
        }

        // POST: ProductManagement/Create - Xử lý thêm sản phẩm mới
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,TenSP,GiaGoc,GiaGiam,MaTH,MaDM,MoTa,AnhBia")] SANPHAM sanpham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // Kiểm tra mã sản phẩm đã tồn tại chưa
                    var existingProduct = db.SANPHAMs.Find(sanpham.MaSP);
                    if (existingProduct != null)
                    {
                        ModelState.AddModelError("MaSP", "Mã sản phẩm đã tồn tại!");
                        ViewBag.MaDM = new SelectList(db.DANHMUCs, "MaDM", "TenDM", sanpham.MaDM);
                        ViewBag.MaTH = new SelectList(db.THUONGHIEUx, "MaTH", "TenTH", sanpham.MaTH);
                        return View(sanpham);
                    }

                    db.SANPHAMs.Add(sanpham);
                    db.SaveChanges();
                    TempData["SuccessMessage"] = "Thêm sản phẩm thành công!";
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Có lỗi xảy ra: " + ex.Message);
            }

            ViewBag.MaDM = new SelectList(db.DANHMUCs, "MaDM", "TenDM", sanpham.MaDM);
            ViewBag.MaTH = new SelectList(db.THUONGHIEUx, "MaTH", "TenTH", sanpham.MaTH);
            return View(sanpham);
        }

        // GET: ProductManagement/Edit/5 - Hiển thị form chỉnh sửa
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sanpham = db.SANPHAMs.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDM = new SelectList(db.DANHMUCs, "MaDM", "TenDM", sanpham.MaDM);
            ViewBag.MaTH = new SelectList(db.THUONGHIEUx, "MaTH", "TenTH", sanpham.MaTH);
            return View(sanpham);
        }

        // POST: ProductManagement/Edit/5 - Xử lý cập nhật sản phẩm
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP,GiaGoc,GiaGiam,MaTH,MaDM,MoTa,AnhBia")] SANPHAM sanpham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(sanpham).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Có lỗi xảy ra: " + ex.Message);
            }

            ViewBag.MaDM = new SelectList(db.DANHMUCs, "MaDM", "TenDM", sanpham.MaDM);
            ViewBag.MaTH = new SelectList(db.THUONGHIEUx, "MaTH", "TenTH", sanpham.MaTH);
            return View(sanpham);
        }

        // GET: ProductManagement/Delete/5 - Hiển thị xác nhận xóa
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sanpham = db.SANPHAMs.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            return View(sanpham);
        }

        // POST: ProductManagement/Delete/5 - Xử lý xóa sản phẩm
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            try
            {
                SANPHAM sanpham = db.SANPHAMs.Find(id);
                db.SANPHAMs.Remove(sanpham);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Xóa sản phẩm thành công!";
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Không thể xóa sản phẩm: " + ex.Message;
            }
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}