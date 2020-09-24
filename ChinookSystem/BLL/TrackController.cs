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
    public class TrackController
    {
        #region Queries
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<TrackViewModel> Track_List()
        {
            using (var context = new ChinookSystemContext())
            {
                var results = from x in context.Tracks
                              select new TrackViewModel
                              {
                                  TrackName = x.Name,
                                  TrackComposer = x.Composer,
                                  TrackMilliseconds = x.Milliseconds,
                                  TrackBytes = x.Bytes,
                                  TrackUnitPrice = x.UnitPrice
                              };
                return results.ToList();
            }
        }
        #endregion

        #region Insert,Update,Delete

        //REMEMBER to add the DataKeyNames="AlbumId" 
        //attribute to your ListView so that Delete will work

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Tracks_Insert(TrackViewModel item)
        {
            using (var context = new ChinookSystemContext())
            {
                Track info = new Track()
                {
                    Name = item.TrackName,
                    Composer = item.TrackComposer,
                    Milliseconds = item.TrackMilliseconds,
                    Bytes = item.TrackBytes,
                    UnitPrice = item.TrackUnitPrice
                };
                context.Tracks.Add(info);
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Tracks_Update(TrackViewModel item)
        {
            using (var context = new ChinookSystemContext())
            {
                Track info = new Track()
                {
                    TrackId = item.TrackId,
                    Name = item.TrackName,
                    Composer = item.TrackComposer,
                    Milliseconds = item.TrackMilliseconds,
                    Bytes = item.TrackBytes,
                    UnitPrice = item.TrackUnitPrice
                };
                context.Entry(info).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void Tracks_Delete(TrackViewModel item)
        {
            using (var context = new ChinookSystemContext())
            {
                Tracks_Delete(item.TrackId);
            }
        }

        public void Tracks_Delete(int trackid)
        {
            using (var context = new ChinookSystemContext())
            {
                var existing = context.Tracks.Find(trackid);
                context.Tracks.Remove(existing);
                context.SaveChanges();
            }
        }
        #endregion
    }
}
