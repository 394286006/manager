/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.payway
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.payway.event.PaywayEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class PaywayProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="PaywayProxy";
		private static const SERVICE_NAME:String="payway.PaywayService";
		public function PaywayProxy()
		{
			super(NAME, new Object());
		}
		
		public function add(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"add",PaywayEvent.PAYWAY_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,SERVICE_NAME,"update",PaywayEvent.PAYWAY_MODIFY_RESULT,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"delete",PaywayEvent.PAYWAY_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query():void{
			MinnUtil.send(this,SERVICE_NAME,"query",PaywayEvent.PAYWAY_QUERY_RESULT);
		}
	}
}