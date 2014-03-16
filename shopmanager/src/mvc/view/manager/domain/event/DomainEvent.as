/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.domain.event
{
	import flash.events.Event;
	
	public class DomainEvent extends Event
	{
		public static const DOMAIN_ADD:String="DOMAIN_ADD";
		public static const DOMAIN_ADD_RESULT:String="DOMAIN_ADD_RESULT";
		
		public static const DOMAIN_MODIFY:String="DOMAIN_MODIFY";
		public static const DOMAIN_MODIFY_RESULT:String="DOMAIN_MODIFY_RESULT";
		
		public static const DOMAIN_DEL:String="DOMAIN_DEL";
		public static const DOMAIN_DEL_RESULT:String="DOMAIN_DEL_RESULT";
		
		public static const DOMAIN_QUERY:String="DOMAIN_QUERY";
		public static const DOMAIN_QUERY_RESULT:String="DOMAIN_QUERY_RESULT";
		
		public static const GENERATOR_DOMAIN_MENU:String="GENERATOR_DOMAIN_MENU";
		public static const GENERATOR_DOMAIN_MENU_RESULT:String="GENERATOR_DOMAIN_MENU_RESULT";
		
		private var _data:Object;
		public function DomainEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
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