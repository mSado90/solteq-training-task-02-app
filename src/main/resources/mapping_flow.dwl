%dw 2.0
import * from dw::core::Arrays
output application/json

---

//gdy to samo productID, niech quantity będzie równe sumie, a jedno z nich będzie
//zakryte za pomocą distinctBy

{
//	orderItems_quantity: vars.acc distinctBy $.productID map(it,ind) -> {
//		quantity: if (vars.acc.productID[ind] == vars.acc.productID[ind + 1])
//							vars.acc.quantity[ind] + vars.acc.quantity[ind + 1]
//					else 	it.quantity
//	},

	orderItems: vars.acc map{
		quantity: if (vars.acc.productID -- [$.productID] contains ($.productID)) 
			$.quantity + vars.acc.quantity[vars.acc.quantity indexWhere(item) ->
				item.productID == $.productID]
					else $.quantity
	},
	
	grandTotal: vars.acc reduce (curr, acc = 0) -> 
	 acc + (curr.itemPrice * curr.quantity)
		
}








