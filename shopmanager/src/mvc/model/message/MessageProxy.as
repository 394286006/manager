/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.message
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.message.event.PublicMessageEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class MessageProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="MessageProxy";
		private static const SERVICE_NAME:String="message.PublicMessageService";
		
		public function MessageProxy()
		{
			super(NAME, new Object());
		}
		
		public function add(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"add",PublicMessageEvent.PUBLICMESSAGE_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,SERVICE_NAME,"update",PublicMessageEvent.PUBLICMESSAGE_MODIRY_RESULT,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"delete",PublicMessageEvent.PUBLICMESSAGE_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(condition:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",PublicMessageEvent.PUBLICMESSAGE_QUERY_RESULT,condition);
		}
		public function generatorPublicMessae(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"generatorPublicMessae",PublicMessageEvent.GENERATOR_PUBLICMESSAGE_RESULT,info);
		}
		
	}
}