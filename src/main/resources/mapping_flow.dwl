%dw 2.0
output application/json

---

{
	orderItems: vars.acc,
	grandTotal: vars.acc reduce (curr, item = 0) -> 
	 item + (curr.itemPrice * curr.quantity)	
}








