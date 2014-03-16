/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.message.event
{
	import flash.events.Event;
	
	public class PublicMessageEvent extends Event
	{
		
		private var _data:Object;
		
		public static const PUBLICMESSAGE_ADD:String="PUBLICMESSAGE_ADD";	
		public static const PUBLICMESSAGE_ADD_RESULT:String="PUBLICMESSAGE_ADD_RESULT";	
		
		public static const PUBLICMESSAGE_MODIRY:String="PUBLICMESSAGE_MODIRY";		
		public static const PUBLICMESSAGE_MODIRY_RESULT:String="PUBLICMESSAGE_MODIRY_RESULT";	
		
		public static const PUBLICMESSAGE_DEL:String="PUBLICMESSAGE_DEL";		
		public static const PUBLICMESSAGE_DEL_RESULT:String="PUBLICMESSAGE_DEL_RESULT";	
		
		public static const PUBLICMESSAGE_QUERY:String="PUBLICMESSAGE_QUERY";	
		public static const PUBLICMESSAGE_QUERY_RESULT:String="PUBLICMESSAGE_QUERY_RESULT";
		
		public static const GENERATOR_PUBLICMESSAGE:String="GENERATOR_PUBLICMESSAGE";	
		public static const GENERATOR_PUBLICMESSAGE_RESULT:String="GENERATOR_PUBLICMESSAGE_RESULT";
		
		public function PublicMessageEvent(type:String, data:Object=null,bubbles:Boolean=false, cancelable:Boolean=false)
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