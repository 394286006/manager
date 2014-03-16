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
	import mvc.view.manager.permission.event.PermissionEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ActionMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ActionMngMediator";
		public function ActionMngMediator( viewComponent:Object=null)
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
			
			viewComponent.addEventListener(PermissionEvent.ACTION_DEL,onDel);
			viewComponent.addEventListener(PermissionEvent.ACTION_QUERY,onQuery);
			
		}
		
		private function onDel(event:PermissionEvent):void{
			sendNotification(PermissionEvent.ACTION_DEL,event.data);
		}
		private function onQuery(event:PermissionEvent):void{
			//						Alert.show('d');
			sendNotification(PermissionEvent.ACTION_QUERY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[
				PermissionEvent.ACTION_DEL,
				PermissionEvent.ACTION_DEL_RESULT,
				PermissionEvent.ACTION_QUERY,
				PermissionEvent.ACTION_QUERY_RESULT];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case PermissionEvent.ACTION_QUERY_RESULT:
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
				case PermissionEvent.ACTION_DEL_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
						userPanel.invokeDel();
					break;
				
			}
		}
	}
}
