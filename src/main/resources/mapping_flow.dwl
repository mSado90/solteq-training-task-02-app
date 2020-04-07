%dw 2.0
import * from dw::core::Arrays
output application/json

---

{
	orderItems: vars.acc,
	grandTotal: vars.acc reduce (curr, acc = 0) -> 
	 acc + (curr.itemPrice * curr.quantity)	
}








