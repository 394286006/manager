/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.operator.event
{
	import flash.events.Event;
	
	public class OperatorEvent extends Event
	{
//		    public static const OPERATOR_TO_MNG_MESSAGE:String="OPERATOR_TO_MNG_MESSAGE";
//			public static const OPERATOR_TO_MNG_MESSAGE_RESULT:String="OPERATOR_TO_MNG_MESSAGE_RESULT";
			
//			public static const MNG_TO_OPERATOR_MESSAGE:String="MNG_TO_OPERATOR_MESSAGE";
//			public static const MNG_TO_OPERATOR_MESSAGE_RESULT:String="MNG_TO_OPERATOR_MESSAGE_RESULT";
//		    public static const OPERATOR_MESSAGE_RESULT:String="OPERATOR_MESSAGE_RESULT";
//		    public static const OPERATOR_MESSAGE:String="OPERATOR_MESSAGE";
		
			
			public static const OPERATOR_LOGIN:String="OPERATOR_LOGIN";
			public static const OPERATOR_LOGIN_RESULT:String="OPERATOR_LOGINRESULT";
			public static const OPERATOR_LOGIN2MAIN:String="OPERATOR_LOGIN2MAIN";
			
			public static const OPERATOR_CANCEL:String="OPERATOR_CANCEL";		
			
			public static const OPERATOR_REGISTER:String="OPERATOR_REGISTER";		
			public static const OPERATOR_REGISTERRESULT:String="OPERATOR_REGISTERRESULT";
			
			public static const OPERATOR_ADD:String="OPERATOR_ADD";
			public static const OPERATOR_ADD_RESULT:String="OPERATOR_ADD_RESULT";
			
			public static const OPERATOR_MODIFY:String="OPERATOR_MODIFY";
			public static const OPERATOR_MODIFY_RESULT:String="OPERATOR_MODIFY_RESULT";
			
			public static const OPERATOR_DEL:String="OPERATOR_DEL";
			public static const OPERATOR_DEL_RESULT:String="OPERATOR_DEL_RESULT";
			
			public static const OPERATOR_QUERY:String="OPERATOR_QUERY";
			public static const OPERATOR_QUERY_RESULT:String="OPERATOR_QUERY_RESULT";
			
//			public static const OPEN_OPERATORPANEL:String="OPEN_OPERATORPANEL";
//			public static const OPEN_OPERATORPANEL_RESULT:String="OPEN_OPERATORPANEL_RESULT";
			
			private var _data:Object;
			
			public function OperatorEvent(type:String, data:Object=null,bubbles:Boolean=false, cancelable:Boolean=false)
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