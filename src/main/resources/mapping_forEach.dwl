%dw 2.0
output application/json
---
// tutaj zmapować to co dostanę z requesta do takiej postaci
 
 
 payload mapObject {

	(($$): payload.productID) if ($$$ == 0),
	(('productCategoryId'): payload.productSizes.productCategoryID[0])
		if ($$$ == 2),
	(('quantity'): vars.quantity) if ($$$ == 3),
	(('sizeID'): payload.productSizes.productSizeID) if ($$$ == 4),
	(('ingredients'): payload.ingredients) if ($$$ == 5),
	(('itemPrice'): payload.price) if ($$$ == 6),
	(('name'): payload.name) if ($$$ == 7)
 	
}


