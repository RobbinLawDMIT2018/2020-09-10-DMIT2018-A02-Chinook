using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChinookSystem.VIEWMODELS
{
    public class TrackViewModel
    {
        public string TrackName { get; set; }
        public string TrackComposer { get; set; }
        public int TrackMilliseconds { get; set; }
        public int? TrackBytes { get; set; }
        public decimal TrackUnitPrice { get; set; }
    }
}
