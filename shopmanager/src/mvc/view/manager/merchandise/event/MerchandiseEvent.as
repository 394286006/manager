/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.merchandise.event
{
	import flash.events.Event;
	
	public class MerchandiseEvent extends Event
	{
		
		public static const MERCHANDISE_CANCEL:String="MERCHANDISE_CANCEL";		
		
		
		public static const MERCHANDISE_ADD:String="MERCHANDISE_ADD";
		public static const MERCHANDISE_ADD_RESULT:String="MERCHANDISE_ADD_RESULT";
		
		public static const MERCHANDISE_MODIFY:String="MERCHANDISE_MODIFY";
		public static const MERCHANDISE_MODIFY_RESULT:String="MERCHANDISE_MODIFY_RESULT";
		
		public static const MERCHANDISE_DEL:String="MERCHANDISE_DEL";
		public static const MERCHANDISE_DEL_RESULT:String="MERCHANDISE_DEL_RESULT";
		
		public static const MERCHANDISE_QUERY:String="MERCHANDISE_QUERY";
		public static const MERCHANDISE_QUERY_RESULT:String="MERCHANDISE_QUERY_RESULT";
		
		public static const CTYPE_TREE_MERCHANDISE_QUERY:String="CTYPE_TREE_MERCHANDISE_QUERY";
		public static const CTYPE_TREE_MERCHANDISE_QUERY_RESULT:String="CTYPE_TREE_MERCHANDISE_QUERY_RESULT";
		
//		public static const CTYPE_MERCHANDISE_ADD:String="CTYPE_MERCHANDISE_ADD";
//		public static const CTYPE_MERCHANDISE_ADD_RESULT:String="CTYPE_MERCHANDISE_ADD_RESULT";
		
//		public static const CTYPE_MERCHANDISE_MODIFY:String="CTYPE_MERCHANDISE_MODIFY";
//		public static const CTYPE_MERCHANDISE_MODIFY_RESULT:String="CTYPE_MERCHANDISE_MODIFY_RESULT";
		
		public static const CTYPE_TREE_MERCHANDISE_DELETE:String="CTYPE_TREE_MERCHANDISE_DELETE";
		public static const CTYPE_TREE_MERCHANDISE_DELETE_RESULT:String="CTYPE_TREE_MERCHANDISE_DELETE_RESULT";
		
		public static const PHOTO_MERCHANDISE_ADD:String="PHOTO_MERCHANDISE_ADD";
		public static const PHOTO_MERCHANDISE_ADD_RESULT:String="PHOTO_MERCHANDISE_ADD_RESULT";
		
		public static const PHOTO_MERCHANDISE_MODIFY:String="PHOTO_MERCHANDISE_MODIFY";
		public static const PHOTO_MERCHANDISE_MODIFY_RESULT:String="PHOTO_MERCHANDISE_MODIFY_RESULT";
		
		public static const PHOTO_MERCHANDISE_DELETE:String="PHOTO_MERCHANDISE_DELETE";
		public static const PHOTO_MERCHANDISE_DELETE_RESULT:String="PHOTO_MERCHANDISE_DELETE_RESULT";
		
		public static const CTYPE_MERCHANDISE_GENERATORMENU:String="CTYPE_MERCHANDISE_GENERATORMENU";
		public static const CTYPE_MERCHANDISE_GENERATORMENU_RESULT:String="CTYPE_MERCHANDISE_GENERATORMENU_RESULT";
		
		
		public static const PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY:String="PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY";
		public static const PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY_RESULT:String="PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY_RESULT";
		
		public static const PHOTO_MERCHANDISE_FIRSTPAGESET:String="PHOTO_MERCHANDISE_FIRSTPAGESET";
		public static const PHOTO_MERCHANDISE_FIRSTPAGESET_RESULT:String="PHOTO_MERCHANDISE_FIRSTPAGESET_RESULT";
		
		
		//			public static const OPEN_MERCHANDISEPANEL:String="OPEN_MERCHANDISEPANEL";
		//			public static const OPEN_MERCHANDISEPANEL_RESULT:String="OPEN_MERCHANDISEPANEL_RESULT";
		
		private var _data:Object;
		
		public function MerchandiseEvent(type:String, data:Object=null,bubbles:Boolean=false, cancelable:Boolean=false)
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