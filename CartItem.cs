using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GroupProject4_Finalproject
{
    public class CartItem
    {


        public string Name { get; set; }
      
        public decimal Price { get; set; }
        public int Buy_Items { get; set; }

        public CartItem(string name,  decimal price, int buy_items)
        {
            Name = name;
         
            Price = price;
            Buy_Items = buy_items;
        }

        public decimal TotalPrice()
        {
            return Price * Buy_Items;
        }

        public string Display()
        {
            return $"{Name}  - ${Price} - Buy_Items: {Buy_Items} - Total: ${TotalPrice()}";
        }
    }
}
    