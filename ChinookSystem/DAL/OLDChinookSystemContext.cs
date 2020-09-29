using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Additional Namespaces
using System.Data.Entity;
using ChinookSystem.ENTITIES;

namespace ChinookSystem.DAL
{
    internal class OLDChinookSystemContext : DbContext
    {
        public OLDChinookSystemContext() : base("name=ChinookDB")
        {

        }

        public DbSet<OLDArtist> Artists { get; set; }
        public DbSet<OLDAlbum> Albums { get; set; }
        public DbSet<OLDTrack> Tracks { get; set; }
    }
}
