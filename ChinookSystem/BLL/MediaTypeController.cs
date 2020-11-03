using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using ChinookSystem.DAL;
using ChinookSystem.VIEWMODELS;
using ChinookSystem.ENTITIES;
#endregion

namespace ChinookSystem.BLL
{
    [DataObject]
    public class MediaTypeController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<SelectionList> List_MediaTypeNames()
        {
            using (var context = new ChinookSystemContext())
            {
                var results = from x in context.MediaTypes
                              orderby x.Name
                              select new SelectionList
                              {
                                  IDValueField = x.MediaTypeId,
                                  DisplayText = x.Name
                              };
                return results.ToList();
            }
        }
    }
}
