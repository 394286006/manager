/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.order
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.order.event.OrderEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class OrderProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="ORDER_PROXY";
		private static const SERVICE_NAME:String="order.OrderService";
		public function OrderProxy()
		{
			super(NAME, new Object());
		}
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,SERVICE_NAME,"update",OrderEvent.ORDER_MODIFY,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"delete",OrderEvent.ORDER_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",OrderEvent.ORDER_QUERY_RESULT,info);
		}
		
	}
}