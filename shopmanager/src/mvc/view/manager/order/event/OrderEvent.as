/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.order.event
{
	import flash.events.Event;
	
	public class OrderEvent extends Event
	{
		public static const ORDER_CANCEL:String="ORDER_CANCEL";		
		
		
		public static const ORDER_ADD:String="ORDER_ADD";
		public static const ORDER_ADD_RESULT:String="ORDER_ADD_RESULT";
		
		public static const ORDER_MODIFY:String="ORDER_MODIFY";
		public static const ORDER_MODIFY_RESULT:String="ORDER_MODIFY_RESULT";
		
		public static const ORDER_DEL:String="ORDER_DEL";
		public static const ORDER_DEL_RESULT:String="ORDER_DEL_RESULT";
		
		public static const ORDER_QUERY:String="ORDER_QUERY";
		public static const ORDER_QUERY_RESULT:String="ORDER_QUERY_RESULT";
		
		//			public static const OPEN_ORDERPANEL:String="OPEN_ORDERPANEL";
		//			public static const OPEN_ORDERPANEL_RESULT:String="OPEN_ORDERPANEL_RESULT";
		
		private var _data:Object;
		
		public function OrderEvent(type:String, data:Object=null,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._data=data;
		}
		
		public function get data():Object{
			return this._data;
		}
		
		public function set data(v:Object):void{
			this._data=v;
		}
	}
}