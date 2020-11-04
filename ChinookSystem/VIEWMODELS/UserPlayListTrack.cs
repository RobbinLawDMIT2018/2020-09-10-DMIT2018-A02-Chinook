using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChinookSystem.VIEWMODELS
{
    public class UserPlayListTrack
    {
        public int TrackID { get; set; }
        public int TrackNumber { get; set; }
        public string TrackName { get; set; }
        public int Milliseconds { get; set; }
        public decimal UnitPrice { get; set; }
    }
}
