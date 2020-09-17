using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Additional Namespaces
using System.ComponentModel;
using ChinookSystem.DAL;
using ChinookSystem.VIEWMODELS;

namespace ChinookSystem.BLL
{
    [DataObject]
    public class TrackController
    {
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
    }
}
