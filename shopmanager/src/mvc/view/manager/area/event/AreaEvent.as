/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.area.event
{
	import flash.events.Event;
	
	public class AreaEvent extends Event
	{
		public static const AREA_PROVINCE_ADD:String="AREA_PROVINCE_ADD";
		public static const AREA_PROVINCE_ADD_RESULT:String="AREA_PROVINCE_ADD_RESULT";
		
		public static const AREA_PROVINCE_MODIFY:String="AREA_PROVINCE_MODIFY";
		public static const AREA_PROVINCE_MODIFY_RESULT:String="AREA_PROVINCE_MODIFY_RESULT";
		
		public static const AREA_PROVINCE_DEL:String="AREA_PROVINCE_DEL";
		public static const AREA_PROVINCE_DEL_RESULT:String="AREA_PROVINCE_DEL_RESULT";
		
		public static const AREA_CITY_ADD:String="AREA_CITY_ADD";
		public static const AREA_CITY_ADD_RESULT:String="AREA_CITY_ADD_RESULT";
		
		public static const AREA_CITY_MODIFY:String="AREA_CITY_MODIFY";
		public static const AREA_CITY_MODIFY_RESULT:String="AREA_CITY_MODIFY_RESULT";
		
		public static const AREA_CITY_DEL:String="AREA_CITY_DEL";
		public static const AREA_CITY_DEL_RESULT:String="AREA_CITY_DEL_RESULT";
		
		
		public static const AREA_TOWN_ADD:String="AREA_TOWN_ADD";
		public static const AREA_TOWN_ADD_RESULT:String="AREA_TOWN_ADD_RESULT";
		
		public static const AREA_TOWN_MODIFY:String="AREA_TOWN_MODIFY";
		public static const AREA_TOWN_MODIFY_RESULT:String="AREA_TOWN_MODIFY_RESULT";
		
		public static const AREA_TOWN_DEL:String="AREA_TOWN_DEL";
		public static const AREA_TOWN_DEL_RESULT:String="AREA_TOWN_DEL_RESULT";
		
		public static const AREA_QUERY:String="AREA_QUERY";
		public static const AREA_QUERY_RESULT:String="AREA_DEL_RESULT";
		
		public static const AREA_GENERATOR_MENU:String="AREA_GENERATOR_MENU";
		public static const AREA_GENERATOR_MENU_RESULT:String="AREA_GENERATOR_MENU_RESULT";
		
		private var _data:Object;
		
		public function AreaEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
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