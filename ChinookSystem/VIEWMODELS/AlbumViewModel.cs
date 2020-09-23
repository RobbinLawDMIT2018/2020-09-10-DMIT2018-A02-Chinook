using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChinookSystem.VIEWMODELS
{
    public class AlbumViewModel
    {
        public int AlbumId { get; set; }
        public string AlbumTitle { get; set; }
        public int ArtistId { get; set; }
        public int AlbumReleaseYear { get; set; }
        public string AlbumReleaseLabel { get; set; }
    }
}
