/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.permission
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.permission.vo.ActionTb;
	import mvc.model.permission.vo.GroupTb;
	import mvc.view.manager.permission.event.PermissionEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class GroupPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "GroupPanelMediator";
		
			public function GroupPanelMediator( viewComponent:Object=null)
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
				//				viewComponent.addEventListener(PermissionEvent.CTYPE_CANCEL,onCancel);
				
				viewComponent.addEventListener(PermissionEvent.GROUP_ADD,onAdd);
				viewComponent.addEventListener(PermissionEvent.GROUP_MODIFY,onModify); 
				
			}
			
			private function onAdd(event:PermissionEvent):void{
				sendNotification(PermissionEvent.GROUP_ADD,event.data);
			}
			private function onModify(event:PermissionEvent):void{
				//						Alert.show('d');
				sendNotification(PermissionEvent.GROUP_MODIFY,event.data);
			}
			override public function listNotificationInterests():Array{
				return[
					PermissionEvent.GROUP_ADD,
					PermissionEvent.GROUP_ADD_RESULT,
					PermissionEvent.GROUP_MODIFY,
					PermissionEvent.GROUP_MODIFY_RESULT];
			}
			override public function handleNotification(notfi:INotification):void{
				
				var message:Message=null;
				switch(notfi.getName()){
					case PermissionEvent.GROUP_ADD_RESULT:
						message=notfi.getBody() as Message;
						var v:GroupTb=new GroupTb();
						MinnUtil.propertyMap(message.otherInfo,v);
						if(message.messageSucess==1){
							userPanel.invokeAdd(v);
						}
						Alert.show(message.messageBody,"提示");
						break;
					case PermissionEvent.GROUP_MODIFY_RESULT:
						message=notfi.getBody() as Message;
						Alert.show(message.messageBody,"提示");
						if(message.messageSucess==1)
							userPanel.cancel_clickHandler();
						break;
					
				}
			}
	}
}