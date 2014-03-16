/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.payway.event
{
	import flash.events.Event;
	
	public class PaywayEvent extends Event
	{
		
		public static const PAYWAY_CANCEL:String="PAYWAY_CANCEL";		
		
		
		public static const PAYWAY_ADD:String="PAYWAY_ADD";
		public static const PAYWAY_ADD_RESULT:String="PAYWAY_ADD_RESULT";
		
		public static const PAYWAY_MODIFY:String="PAYWAY_MODIFY";
		public static const PAYWAY_MODIFY_RESULT:String="PAYWAY_MODIFY_RESULT";
		
		public static const PAYWAY_DEL:String="PAYWAY_DEL";
		public static const PAYWAY_DEL_RESULT:String="PAYWAY_DEL_RESULT";
		
		public static const PAYWAY_QUERY:String="PAYWAY_QUERY";
		public static const PAYWAY_QUERY_RESULT:String="PAYWAY_QUERY_RESULT";
		
		//			public static const OPEN_PAYWAYPANEL:String="OPEN_PAYWAYPANEL";
		//			public static const OPEN_PAYWAYPANEL_RESULT:String="OPEN_PAYWAYPANEL_RESULT";
		
		private var _data:Object;
		
		public function PaywayEvent(type:String, data:Object=null,bubbles:Boolean=false, cancelable:Boolean=false)
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