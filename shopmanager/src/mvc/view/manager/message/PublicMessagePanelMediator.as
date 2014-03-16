/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.message
{
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.message.vo.PublicMessge;
	import mvc.view.manager.message.event.PublicMessageEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class PublicMessagePanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "PublicMessagePanelMediator";
		public function PublicMessagePanelMediator(viewComponent:Object=null)
		{
			super(NAME,viewComponent);
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
			viewComponent.addEventListener(PublicMessageEvent.PUBLICMESSAGE_ADD,onAdd);
			viewComponent.addEventListener(PublicMessageEvent.PUBLICMESSAGE_MODIRY,onModify);
		}
		private function onAdd(event:PublicMessageEvent):void{
//									Alert.show('PublicMessageEvent.PUBLICMESSAGE_ADD');
			sendNotification(PublicMessageEvent.PUBLICMESSAGE_ADD,event.data);
		}
		private function onModify(event:PublicMessageEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(PublicMessageEvent.PUBLICMESSAGE_MODIRY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[PublicMessageEvent.PUBLICMESSAGE_ADD,
				PublicMessageEvent.PUBLICMESSAGE_ADD_RESULT,
				PublicMessageEvent.PUBLICMESSAGE_MODIRY,
				PublicMessageEvent.PUBLICMESSAGE_MODIRY_RESULT
			];
		}
		
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case PublicMessageEvent.PUBLICMESSAGE_ADD_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1){
						var mer:PublicMessge=new PublicMessge();
						MinnUtil.propertyMap(message.otherInfo,mer);
						userPanel.invokeAdd(mer);
					}
					break;
				case PublicMessageEvent.PUBLICMESSAGE_MODIRY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
					userPanel.cancel_clickHandler();
					//					userPanel.invokeUpdate(message.otherInfo);
					break;
			}
		}
	}
}