/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.permission
{
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.permission.vo.ActionTb;
	import mvc.view.manager.permission.event.PermissionEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ActionPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ActionPanelMediator";
		public function ActionPanelMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(PermissionEvent.ACTION_ADD,onAdd);
			viewComponent.addEventListener(PermissionEvent.ACTION_MODIFY,onModify); 
			
		}
		private function onAdd(evt:PermissionEvent):void{
			sendNotification(PermissionEvent.ACTION_ADD,evt.data);
		}
		private function onModify(evt:PermissionEvent):void{
			sendNotification(PermissionEvent.ACTION_MODIFY,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[PermissionEvent.ACTION_ADD,
				PermissionEvent.ACTION_ADD_RESULT,
				PermissionEvent.ACTION_MODIFY,
				PermissionEvent.ACTION_MODIFY_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case PermissionEvent.ACTION_ADD_RESULT:
					message=notfi.getBody() as Message;
					var v:ActionTb=new ActionTb();
					MinnUtil.propertyMap(message.otherInfo,v);
					if(message.messageSucess==1){
						userPanel.invokeAdd(v);
					}
					Alert.show(message.messageBody,"提示");
					break;
				case PermissionEvent.ACTION_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
						userPanel.cancel_clickHandler();
					break;
				
			}
		}

	}
}