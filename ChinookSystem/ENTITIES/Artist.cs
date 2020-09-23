using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// Additional Namespaces
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ChinookSystem.ENTITIES
{
    [Table("Artists")]

    //Using internal to add another layer of security to our code.
    //This internal will restrict access to this class to within
    //the SystemDB project.
    //Because of this we now need VIEWMODELS.
    internal class Artist
    {
        // anotations:
        // [Key] is defualt primary identity field on database
        // [Key, DatabaseGenerated(DatabaseGeneratedOption.xxxx)]
        //    where xxx is Computed, Identity, or None
        // [Key, Column(Order=n)]
        //     where n is  1, 2, 3, etc depending on how many parts to your
        //       compound primary key

        [Key]
        public int ArtistId { get; set; }

        //validation anotation
        [Required(ErrorMessage = "Artist Name is required")]
        [StringLength(120, ErrorMessage = "Artist name is limited to 120 characters")]
        public string Name { get; set; }

        //navigational properties
        //part of a relationship to table Albums
        //it is the parent part of the relationship
        //this means that an artist has MANY albums *****
        public virtual ICollection<Album> Albums { get; set; }
    }

}
