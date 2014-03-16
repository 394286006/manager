/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.domain
{
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.domain.vo.Domain;
	import mvc.view.manager.domain.event.DomainEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class DomainMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "DomainMediator";
		public function DomainMediator(viewComponent:Object=null)
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
			//			viewComponent.addEventListener(CtypeEvent.OPERATOR_LOGIN,onLogin);
			//			viewComponent.addEventListener(AreaEvent.AREA_ADD,onAdd);
			viewComponent.addEventListener(DomainEvent.DOMAIN_ADD,onAdd);
			viewComponent.addEventListener(DomainEvent.DOMAIN_MODIFY,onModify); 
			
		}
		
		private function onAdd(evt:DomainEvent):void{
			sendNotification(DomainEvent.DOMAIN_ADD,evt.data);
		}
		
		private function onModify(evt:DomainEvent):void{
			sendNotification(DomainEvent.DOMAIN_MODIFY,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[DomainEvent.DOMAIN_MODIFY,
				DomainEvent.DOMAIN_MODIFY_RESULT,
				DomainEvent.DOMAIN_ADD,
				DomainEvent.DOMAIN_ADD_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case DomainEvent.DOMAIN_ADD_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1){
						var mer:Domain=new Domain();
						MinnUtil.propertyMap(message.otherInfo,mer);
						userPanel.invokeAdd(mer);
					}
					break;
				case DomainEvent.DOMAIN_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
						userPanel.cancel_clickHandler();
					break;
			}
		}
		
		
	}
}