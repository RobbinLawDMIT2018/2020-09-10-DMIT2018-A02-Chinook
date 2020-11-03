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
        #region Track_List Query
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<TrackViewModel> Track_List()
        {
            using (var context = new ChinookSystemContext())
            {
                var results = from x in context.Tracks
                              select new TrackViewModel
                              {
                                  TrackId = x.TrackId,
                                  TrackMediaTypeId = x.MediaTypeId,
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
        #region TracksForPlaylistSelection
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<TrackList> List_TracksForPlaylistSelection(string tracksby, string arg)
        {
            using (var context = new ChinookSystemContext())
            {
                IEnumerable<TrackList> results = null;
                if (tracksby.Equals("Artist"))
                {
                    results = from x in context.Tracks
                              where x.Album.Artist.Name.Contains(arg)
                              orderby x.Album.Artist.Name, x.Name
                              select new TrackList
                              {
                                  TrackID = x.TrackId,
                                  Name = x.Name,
                                  Title = x.Album.Title,
                                  ArtistName = x.Album.Artist.Name,
                                  MediaName = x.MediaType.Name,
                                  GenreName = x.Genre.Name,
                                  Composer = x.Composer,
                                  Milliseconds = x.Milliseconds,
                                  Bytes = x.Bytes,
                                  UnitPrice = x.UnitPrice
                              };
                }
                else if (tracksby.Equals("Album"))
                {
                    results = from x in context.Tracks
                              where x.Album.Title.Contains(arg)
                              orderby x.Album.Title, x.Name
                              select new TrackList
                              {
                                  TrackID = x.TrackId,
                                  Name = x.Name,
                                  Title = x.Album.Title,
                                  ArtistName = x.Album.Artist.Name,
                                  MediaName = x.MediaType.Name,
                                  GenreName = x.Genre.Name,
                                  Composer = x.Composer,
                                  Milliseconds = x.Milliseconds,
                                  Bytes = x.Bytes,
                                  UnitPrice = x.UnitPrice
                              };
                }
                else if (tracksby.Equals("MediaType"))
                {
                    int narg = int.Parse(arg);
                    results = from x in context.Tracks
                              where x.MediaTypeId == narg
                              orderby x.MediaType.Name, x.Name
                              select new TrackList
                              {
                                  TrackID = x.TrackId,
                                  Name = x.Name,
                                  Title = x.Album.Title,
                                  ArtistName = x.Album.Artist.Name,
                                  MediaName = x.MediaType.Name,
                                  GenreName = x.Genre.Name,
                                  Composer = x.Composer,
                                  Milliseconds = x.Milliseconds,
                                  Bytes = x.Bytes,
                                  UnitPrice = x.UnitPrice
                              };
                }
                else if (tracksby.Equals("Genre"))
                {
                    int narg = int.Parse(arg);
                    results = from x in context.Tracks
                              where x.GenreId == narg
                              orderby x.Genre.Name, x.Name
                              select new TrackList
                              {
                                  TrackID = x.TrackId,
                                  Name = x.Name,
                                  Title = x.Album.Title,
                                  ArtistName = x.Album.Artist.Name,
                                  MediaName = x.MediaType.Name,
                                  GenreName = x.Genre.Name,
                                  Composer = x.Composer,
                                  Milliseconds = x.Milliseconds,
                                  Bytes = x.Bytes,
                                  UnitPrice = x.UnitPrice
                              };
                }
                if (results == null)
                {
                    return null;
                }
                else
                {
                    return results.ToList();
                }

            }
        }//eom
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
                    MediaTypeId = item.TrackMediaTypeId,
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
                    MediaTypeId = item.TrackMediaTypeId,
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
