using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
namespace DevTest.Controllers
{
    public class DevController : Controller
    {
        private TestDBEntities db = new TestDBEntities();

        // GET: Dev
        public ActionResult Index()
        {
            return View(db.DevTests.ToList());
        }

        // GET: Dev/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevTest devTest = db.DevTests.Find(id);
            if (devTest == null)
            {
                return HttpNotFound();
            }
            return View(devTest);
        }

        // GET: Dev/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Dev/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,CampaignName,Date,Clicks,Conversions,Impressions,AffiliateName")] DevTest devTest)
        {
            if (ModelState.IsValid)
            {
                db.DevTests.Add(devTest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(devTest);
        }

        // GET: Dev/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevTest devTest = db.DevTests.Find(id);
            if (devTest == null)
            {
                return HttpNotFound();
            }
            return View(devTest);
        }

        // POST: Dev/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,CampaignName,Date,Clicks,Conversions,Impressions,AffiliateName")] DevTest devTest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(devTest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(devTest);
        }

        // GET: Dev/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevTest devTest = db.DevTests.Find(id);
            if (devTest == null)
            {
                return HttpNotFound();
            }
            return View(devTest);
        }

        // POST: Dev/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DevTest devTest = db.DevTests.Find(id);
            db.DevTests.Remove(devTest);
            db.SaveChanges();
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
