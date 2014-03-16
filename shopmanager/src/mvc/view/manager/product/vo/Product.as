/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.front.product.vo
{
	[Bindable]
	public class Product
	{
		public var productId:int;
		public var name:String;
		public var description:String;
		public var price:Number;
//		public var image:String;
		public var series:String;
		public var triband:Boolean;
		public var camera:Boolean;
		public var video:Boolean;
		public var highlight1:String;
		public var highlight2:String;
		public var qty:int;
		public var imglevel1:Object;
		public var imglevel2:Object;
		
		public function Product()
		{
		}
		
		public function fill(obj:Object):void
		{
			for (var i:String in obj)
			{
				this[i] = obj[i];
			}
		}
	}
}