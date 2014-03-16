/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.permission.event
{
	import flash.events.Event;
	
	public class PermissionEvent extends Event
	{
		
		public static const ACTION_ADD:String="ACTION_ADD";
		public static const ACTION_ADD_RESULT:String="ACTION_ADD_RESULT";
		
		public static const ACTION_MODIFY:String="ACTION_MODIFY";
		public static const ACTION_MODIFY_RESULT:String="ACTION_MODIFY_RESULT";
		
		public static const ACTION_DEL:String="ACTION_DEL";
		public static const ACTION_DEL_RESULT:String="ACTION_DEL_RESULT";
		
		public static const ACTION_QUERY:String="ACTION_QUERY";
		public static const ACTION_QUERY_RESULT:String="ACTION_QUERY_RESULT";
		
		public static const ACTION_CANCEL:String="ACTION_CANCEL";
		
		
		
		public static const GROUP_ADD:String="GROUP_ADD";
		public static const GROUP_ADD_RESULT:String="GROUP_ADD_RESULT";
		
		public static const GROUP_MODIFY:String="GROUP_MODIFY";
		public static const GROUP_MODIFY_RESULT:String="GROUP_MODIFY_RESULT";
		
		public static const GROUP_DEL:String="GROUP_DEL";
		public static const GROUP_DEL_RESULT:String="GROUP_DEL_RESULT";
		
		public static const GROUP_QUERY:String="GROUP_QUERY";
		public static const GROUP_QUERY_RESULT:String="GROUP_QUERY_RESULT";
		
		public static const GROUP_ACTION_QUERY:String="GROUP_ACTION_QUERY";
		public static const GROUP_ACTION_QUERY_RESULT:String="GROUP_ACTION_QUERY_RESULT";
		
		public static const GROUP_CANCEL:String="GROUP_CANCEL";
		
		
		public static const GROUP_ACTION_SET:String="GROUP_ACTION_SET";
		public static const GROUP_ACTION_SET_RESULT:String="GROUP_ACTION_SET_RESULT";		
		

		
		
		private var _data:Object;
		
		public function PermissionEvent(type:String,data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
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