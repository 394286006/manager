/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.ctype
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.ctype.event.CtypeEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class CtypeProxy extends Proxy implements IProxy
	{
		public static const NAME:String="CTYPE_PROXY";
		private static const SERVICE_NAME:String="ctype.CtypeService";
		public function CtypeProxy()
		{
			super(NAME, new Object());
		}
		public function add(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"add",CtypeEvent.CTYPE_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,SERVICE_NAME,"update",CtypeEvent.CTYPE_MODIFY_RESULT,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"delete",CtypeEvent.CTYPE_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(condition:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",CtypeEvent.CTYPE_QUERY_RESULT,condition);
		}
		public function queryCtypeMenu():void{
			MinnUtil.send(this,SERVICE_NAME,"queryCtypeMenu",CtypeEvent.CTYPE_MENU_QUERY_RESULT);
		}
	}
}