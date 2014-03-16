/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.order
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.order.vo.Order;
	import mvc.view.manager.order.event.OrderEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class OrderMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "OrderMediator";
		
		public function OrderMngMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			registerEvent();
		}
		public function get userPanel():Object{
			return viewComponent;
		}
		public function set userPanel(viewComponent:Object):void{
			this.setViewComponent(viewComponent);
			registerEvent();
		}
		private function registerEvent():void{
			viewComponent.addEventListener(OrderEvent.ORDER_QUERY,onQuery);
			viewComponent.addEventListener(OrderEvent.ORDER_DEL,onInvoke);
			viewComponent.addEventListener(OrderEvent.ORDER_MODIFY,onInvoke);
			
		}
		private function onInvoke(evt:OrderEvent):void{
			sendNotification(evt.type,evt.data);
		}
		
		private function onQuery(evt:OrderEvent):void{
			sendNotification(OrderEvent.ORDER_QUERY,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[OrderEvent.ORDER_QUERY,
				OrderEvent.ORDER_QUERY_RESULT,
				OrderEvent.ORDER_DEL,
				OrderEvent.ORDER_DEL_RESULT,
				OrderEvent.ORDER_MODIFY,
				OrderEvent.ORDER_MODIFY_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case OrderEvent.ORDER_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					//										Alert.show(message.otherInfo.toString());
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var v:Order=new Order();
						ac.addItem(v);
					}
					MinnUtil.copyProperty(ac,arr);
					
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
				case OrderEvent.ORDER_MODIFY_RESULT:
					break;
				case OrderEvent.ORDER_DEL_RESULT:
					break;
			}
		}
	}
}