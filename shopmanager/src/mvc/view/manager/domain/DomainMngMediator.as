/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.domain
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.domain.vo.Domain;
	import mvc.view.manager.domain.event.DomainEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class DomainMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "DomainMngMediator";
		public function DomainMngMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(DomainEvent.DOMAIN_QUERY,onQuery);
			viewComponent.addEventListener(DomainEvent.DOMAIN_DEL,onDel);
			viewComponent.addEventListener(DomainEvent.GENERATOR_DOMAIN_MENU,onGeneratorMenu);
			
		}
		
		private function onQuery(evt:DomainEvent):void{
			sendNotification(DomainEvent.DOMAIN_QUERY,evt.data);
		}
		
		private function onDel(evt:DomainEvent):void{
			sendNotification(DomainEvent.DOMAIN_DEL,evt.data);
		}
		
		private function onGeneratorMenu(evt:DomainEvent):void{
			sendNotification(DomainEvent.GENERATOR_DOMAIN_MENU,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[DomainEvent.DOMAIN_QUERY,
				DomainEvent.DOMAIN_QUERY_RESULT,
				DomainEvent.DOMAIN_DEL,
				DomainEvent.DOMAIN_DEL_RESULT,
				DomainEvent.GENERATOR_DOMAIN_MENU,
				DomainEvent.GENERATOR_DOMAIN_MENU_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case DomainEvent.DOMAIN_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var op:Domain=new Domain();
						ac.addItem(op);
					}
					MinnUtil.copyProperty(ac,arr);
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
				case DomainEvent.DOMAIN_DEL_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
						userPanel.invokeDel();
					break;
				case DomainEvent.GENERATOR_DOMAIN_MENU_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					break;
			}
		}
		
	}
}