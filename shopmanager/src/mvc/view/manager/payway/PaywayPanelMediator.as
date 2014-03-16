/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.payway
{
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.payway.vo.Payway;
	import mvc.view.manager.payway.event.PaywayEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class PaywayPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "PaywayPanelMediator";
		public function PaywayPanelMediator(viewComponent:Object=null)
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
			//			viewComponent.addEventListener(AreaEvent.AREA_QUERY,onInvoke);
			viewComponent.addEventListener(PaywayEvent.PAYWAY_ADD,onAdd);
			viewComponent.addEventListener(PaywayEvent.PAYWAY_MODIFY,onModify); 
			
		}
		private function onInvoke(evt:PaywayEvent):void{
			sendNotification(evt.type,evt.data);
		}
		private function onAdd(evt:PaywayEvent):void{
			sendNotification(PaywayEvent.PAYWAY_ADD,evt.data);
		}
		private function onModify(evt:PaywayEvent):void{
			sendNotification(PaywayEvent.PAYWAY_MODIFY,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[PaywayEvent.PAYWAY_ADD,
				PaywayEvent.PAYWAY_ADD_RESULT,
				PaywayEvent.PAYWAY_MODIFY,
				PaywayEvent.PAYWAY_MODIFY_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case PaywayEvent.PAYWAY_ADD_RESULT:
					message=notfi.getBody() as Message;
					var v:Payway=new Payway();
					MinnUtil.propertyMap(message.otherInfo,v);
					if(message.messageSucess==1){
					userPanel.invokeAdd(v);
					
					}
					Alert.show(message.messageBody,"提示");
					break;
				case PaywayEvent.PAYWAY_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
					  userPanel.cancel_clickHandler();
					break;
				
			}
		}
	}
}