/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.front.product.event
{
	import flash.events.Event;
	
	import mvc.view.front.product.vo.Product;
	
	public class ProductListEvent extends Event
	{
		public static const ADD_PRODUCT:String = "addProduct";
		public static const DUPLICATE_PRODUCT:String = "duplicateProduct";
		public static const REMOVE_PRODUCT:String = "removeProduct";
		public static const PRODUCT_QTY_CHANGE:String = "productQtyChange";
		
		public var product:Product;
		
		public function ProductListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}