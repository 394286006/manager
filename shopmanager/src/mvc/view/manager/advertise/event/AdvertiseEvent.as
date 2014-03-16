/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.advertise.event
{
	import flash.events.Event;
	
	public class AdvertiseEvent extends Event
	{

		public static const ADVERTIESE_ADD:String="ADVERTIESE_ADD";
		public static const ADVERTIESE_ADD_RESULT:String="ADVERTIESE_ADD_RESULT";
		
		public static const ADVERTIESE_MODIFY:String="ADVERTIESE_MODIFY";
		public static const ADVERTIESE_MODIFY_RESULT:String="ADVERTIESE_MODIFY_RESULT";
		
		public static const ADVERTIESE_DEL:String="ADVERTIESE_DEL";
		public static const ADVERTIESE_DEL_RESULT:String="ADVERTIESE_DEL_RESULT";
		
		public static const ADVERTIESE_QUERY:String="ADVERTIESE_QUERY";
		public static const ADVERTIESE_QUERY_RESULT:String="ADVERTIESE_QUERY_RESULT";
		
		public static const ADVERTISE_SET_QUERY:String="ADVERTISE_SET_QUERY";
		public static const ADVERTISE_SET_QUERY_RESULT:String="ADVERTISE_SET_QUERY_RESULT";
		
		public static const ADVERTISE_SET_MENU_QUERY:String="ADVERTISE_SET_MENU_QUERY";
		public static const ADVERTISE_SET_MENU_QUERY_RESULT:String="ADVERTISE_SET_MENU_QUERY_RESULT";
		
		public static const GENERATOR_ADVERTISE_MENU:String="GENERATOR_ADVERTISE_MENU";
		public static const GENERATOR_ADVERTISE_MENU_RESULT:String="GENERATOR_ADVERTISE_MENU_RESULT";
		
		private var _data:Object;
		public function AdvertiseEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
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