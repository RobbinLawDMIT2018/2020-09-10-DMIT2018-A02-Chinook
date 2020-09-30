using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Additional Namespaces
using System.ComponentModel;
using ChinookSystem.DAL;
using ChinookSystem.VIEWMODELS;
using ChinookSystem.ENTITIES;

namespace ChinookSystem.BLL
{
    [DataObject]
    public class AlbumController
    {
        #region Queries
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<AlbumViewModel> Albums_List()
        {
            using (var context = new ChinookSystemContext())
            {
                var results = from x in context.Albums
                              select new AlbumViewModel
                              {
                                  AlbumId = x.AlbumId,
                                  AlbumTitle = x.Title,
                                  ArtistId = x.ArtistId,
                                  AlbumReleaseYear = x.ReleaseYear,
                                  AlbumReleaseLabel = x.ReleaseLabel,
                                  ReleaseLabelAndYear = x.ReleaseLabel + ", " + x.ReleaseYear
    };
                return results.ToList();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<AlbumViewModel> AlbumsByArtist(int artistid)
        {
            using (var context = new ChinookSystemContext())
            {
                var results = from x in context.Albums
                              where x.ArtistId == artistid
                              select new AlbumViewModel
                              {
                                  AlbumId = x.AlbumId,
                                  AlbumTitle = x.Title,
                                  ArtistId = x.ArtistId,
                                  AlbumReleaseYear = x.ReleaseYear,
                                  AlbumReleaseLabel = x.ReleaseLabel
                              };
                return results.ToList();
            }
        }
        #endregion

        #region Insert,Update,Delete

        //REMEMBER to add the DataKeyNames="AlbumId" 
        //attribute to your ListView so that Delete will work

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Albums_Insert(AlbumViewModel item)
        {
            DataValidation(item);
            using (var context = new ChinookSystemContext())
            {
                Album info = new Album()
                {
                    Title = item.AlbumTitle,
                    ArtistId = item.ArtistId,
                    ReleaseYear = item.AlbumReleaseYear,
                    ReleaseLabel = item.AlbumReleaseLabel
                };
                context.Albums.Add(info);
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Albums_Update(AlbumViewModel item)
        {
            DataValidation(item);
            using (var context = new ChinookSystemContext())
            {
                Album info = new Album()
                {
                    AlbumId = item.AlbumId,
                    Title = item.AlbumTitle,
                    ArtistId = item.ArtistId,
                    ReleaseYear = item.AlbumReleaseYear,
                    ReleaseLabel = item.AlbumReleaseLabel
                };
                context.Entry(info).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void Albums_Delete(AlbumViewModel item)
        {
            using (var context = new ChinookSystemContext())
            {
                Albums_Delete(item.AlbumId);
            }
        }

        public void Albums_Delete(int albumid)
        {
            using (var context = new ChinookSystemContext())
            {
                var existing = context.Albums.Find(albumid);
                context.Albums.Remove(existing);
                context.SaveChanges();
            }
        }
        #endregion

        #region BLL Data Validation
        private void DataValidation(AlbumViewModel item)
        {
            if (string.IsNullOrEmpty(item.AlbumTitle))
                throw new Exception("(BLL) Album Title is required.");
            else if (item.AlbumTitle.Length >= 160)
                throw new Exception("(BLL) Album Title is over 160 chars.");
            else if (item.AlbumReleaseYear < 1950 || item.AlbumReleaseYear > DateTime.Today.Year)
                throw new Exception(string.Format("(BLL) Year {0} is invalid. Make between 1950 and {1}.",
                    item.AlbumReleaseYear, DateTime.Today.Year));
        }
        #endregion
    }
}
