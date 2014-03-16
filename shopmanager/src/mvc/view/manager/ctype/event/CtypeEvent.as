/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.ctype.event
{
	import flash.events.Event;
	
	public class CtypeEvent extends Event
	{
		public static const CTYPE_CANCEL:String="CTYPE_CANCEL";		
		
		
		public static const CTYPE_ADD:String="CTYPE_ADD";
		public static const CTYPE_ADD_RESULT:String="CTYPE_ADD_RESULT";
		
		public static const CTYPE_MODIFY:String="CTYPE_MODIFY";
		public static const CTYPE_MODIFY_RESULT:String="CTYPE_MODIFY_RESULT";
		
		public static const CTYPE_DEL:String="CTYPE_DEL";
		public static const CTYPE_DEL_RESULT:String="CTYPE_DEL_RESULT";
		
		public static const CTYPE_QUERY:String="CTYPE_QUERY";
		public static const CTYPE_QUERY_RESULT:String="CTYPE_QUERY_RESULT";
		
		public static const CTYPE_MENU_QUERY:String="CTYPE_MENU_QUERY";
		public static const CTYPE_MENU_QUERY_RESULT:String="CTYPE_MENU_QUERY_RESULT";
		
		//			public static const OPEN_CTYPEPANEL:String="OPEN_CTYPEPANEL";
		//			public static const OPEN_CTYPEPANEL_RESULT:String="OPEN_CTYPEPANEL_RESULT";
		
		private var _data:Object;
		
		public function CtypeEvent(type:String, data:Object=null,bubbles:Boolean=false, cancelable:Boolean=false)
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