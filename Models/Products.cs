using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GroupProject4_Finalproject.Models
{
    public class Products
    {
        public string ProductId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Quantity { get; set; }
        public decimal Price { get; set; }
        public string ImageFile { get; set; }
    }
}