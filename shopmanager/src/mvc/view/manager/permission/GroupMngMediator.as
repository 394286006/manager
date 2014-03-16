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
	
	public class GroupMngMediator extends Mediator implements IMediator
	{
		     public static const NAME:String = "GroupMngMediator";
		    public function GroupMngMediator(viewComponent:Object=null)
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
				
				viewComponent.addEventListener(PermissionEvent.GROUP_DEL,onDel);
				viewComponent.addEventListener(PermissionEvent.GROUP_ACTION_QUERY,onGroupActionQuery);
				viewComponent.addEventListener(PermissionEvent.GROUP_QUERY,onGroupQuery);
				viewComponent.addEventListener(PermissionEvent.GROUP_ACTION_SET,onGroupActionSet);
			}
		
			private function onDel(event:PermissionEvent):void{
				sendNotification(PermissionEvent.GROUP_DEL,event.data);
			}
			private function onGroupActionQuery(event:PermissionEvent):void{
				//						Alert.show('d');
				sendNotification(PermissionEvent.GROUP_ACTION_QUERY,event.data);
			}
			private function onGroupQuery(event:PermissionEvent):void{
				//						Alert.show('d');
				sendNotification(PermissionEvent.GROUP_QUERY,event.data);
			}
			private function onGroupActionSet(event:PermissionEvent):void{
				//						Alert.show('d');
				sendNotification(PermissionEvent.GROUP_ACTION_SET,event.data);
			}
			override public function listNotificationInterests():Array{
				return[
					PermissionEvent.GROUP_DEL,
					PermissionEvent.GROUP_DEL_RESULT,
					PermissionEvent.GROUP_ACTION_QUERY,
					PermissionEvent.GROUP_ACTION_QUERY_RESULT,
					PermissionEvent.GROUP_QUERY,
					PermissionEvent.GROUP_QUERY_RESULT,
					PermissionEvent.GROUP_ACTION_SET,
					PermissionEvent.GROUP_ACTION_SET_RESULT];
			}
			override public function handleNotification(notfi:INotification):void{
				
				var message:Message=null;
				switch(notfi.getName()){
					case PermissionEvent.GROUP_ACTION_QUERY_RESULT:
						message=notfi.getBody() as Message;
						var arr:Array=JSON.decode(message.messageBody);
						//										Alert.show(message.otherInfo.toString());
						var ac:ArrayCollection=new ArrayCollection();
						for(var i:int=0;i<arr.length;i++){
							var op:ActionTb=new ActionTb();
							ac.addItem(op);
						}
						MinnUtil.copyProperty(ac,arr);
						
						userPanel.invokeActionQuery(ac,message.otherInfo);
						break;
					case PermissionEvent.GROUP_QUERY_RESULT:
						message=notfi.getBody() as Message;
						var arr:Array=JSON.decode(message.messageBody);
						//										Alert.show(message.otherInfo.toString());
						var ac:ArrayCollection=new ArrayCollection();
						for(var i:int=0;i<arr.length;i++){
							var gp:GroupTb=new GroupTb();
							ac.addItem(gp);
						}
						MinnUtil.copyProperty(ac,arr);
						
						userPanel.invokeGroupQuery(ac,message.otherInfo);
						break;
					case PermissionEvent.GROUP_DEL_RESULT:
						message=notfi.getBody() as Message;
						Alert.show(message.messageBody,"提示");
						if(message.messageSucess==1)
							userPanel.invokeDel();
						break;
					case PermissionEvent.GROUP_ACTION_SET_RESULT:
						message=notfi.getBody() as Message;
						Alert.show(message.messageBody,"提示");
						
						break;
				}
			}
	}
}