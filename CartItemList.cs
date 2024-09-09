using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GroupProject4_Finalproject
{
    public class CartItemList : IEnumerable<CartItem>
    {
        private List<CartItem> cartItems = new List<CartItem>(); 

        public IEnumerator<CartItem> GetEnumerator()
        {
            return cartItems.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        public int Count
        {
            get { return cartItems.Count; }
        }

        public CartItem this[int index]
        {
            get { return cartItems[index]; }
            set { cartItems[index] = value; }
        }

        public static CartItemList GetCart()
        {
            CartItemList cart;
            if (HttpContext.Current.Session["Cart"] == null)
            {
                cart = new CartItemList();
                HttpContext.Current.Session["Cart"] = cart;
            }
            else
            {
                cart = (CartItemList)HttpContext.Current.Session["Cart"];
            }
            return cart;
        }

        public void AddItem(CartItem item)
        {
            cartItems.Add(item);
        }

        public void RemoveAt(int index)
        {
            cartItems.RemoveAt(index);
        }

        public void Clear()
        {
            cartItems.Clear();
        }
    }
}
