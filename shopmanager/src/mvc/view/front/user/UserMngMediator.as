/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.front.user
{
	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	
	import minn.event.MinnMessageEvent;
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.ApplicationFacade;
	import mvc.model.user.vo.User;
	import mvc.view.front.user.component.GateEffect;
	import mvc.view.front.user.event.UserEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.IVisualElement;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	import mx.messaging.channels.StreamingAMFChannel;
	import mx.utils.ArrayUtil;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	
	public class UserMngMediator  extends Mediator implements IMediator {
		public static const NAME:String = "UserMngMediator";
		
		
		
		public function UserMngMediator(viewComponent:Object)
		{
			super(NAME,viewComponent);
//			Alert.show('UserMediator');
			registerEvent();
		}
		private function registerEvent():void{
			viewComponent.addEventListener(UserEvent.USER_LOGIN,onLogin);
			viewComponent.addEventListener(UserEvent.USER_REGISTER,onAdd);
			viewComponent.addEventListener(UserEvent.USER_CANCEL,onCancel);
//			viewComponent.addEventListener(UserEvent.USER_MODIFY,onModify);
//			viewComponent.addEventListener(UserEvent.USER_DEL,onDel);
			viewComponent.addEventListener(UserEvent.USER_QUERY,onQuery);
		}
		
		private function unregisterEvent():void{
			viewComponent.removeEventListener(UserEvent.USER_LOGIN,onLogin);
			viewComponent.removeEventListener(UserEvent.USER_REGISTER,onAdd);
			viewComponent.removeEventListener(UserEvent.USER_CANCEL,onCancel);
			viewComponent.removeEventListener(UserEvent.USER_QUERY,onQuery);
		}
		public function get userPanel():Object{
			return viewComponent;
		}
		public function set userPanel(viewComponent:Object):void{
			this.setViewComponent(viewComponent);
			unregisterEvent();
			registerEvent();
		}
		private function onLogin(event:UserEvent):void{
//			Alert.show('(event.data as User).loginName');
			sendNotification(UserEvent.USER_LOGIN,event.data);
		}
		private function onAdd(event:UserEvent):void{
			//			Alert.show('d');
			sendNotification(UserEvent.USER_REGISTER,event.data);
		}
		private function onCancel(event:UserEvent):void{
			sendNotification(UserEvent.USER_CANCEL);
		}
		private function onQuery(event:UserEvent):void{
			//						Alert.show('d');
			sendNotification(UserEvent.USER_QUERY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[UserEvent.USER_LOGIN,
				UserEvent.USER_LOGIN_RESULT,
				UserEvent.USER_REGISTER,
				UserEvent.USER_REGISTERR_ESULT,
				UserEvent.USER_CANCEL,
				UserEvent.USER_QUERY,
				UserEvent.USER_QUERY_RESULT
			 ];
		}
		
		override public function handleNotification(notfi:INotification):void{
	
//			Alert.show("handleNotification:"+notfi.getName());
			var message:Message=null;
			switch(notfi.getName()){
				case UserEvent.USER_LOGIN_RESULT:
//					var d:JSON
//					var result:Boolean = new Boolean(notfi.getBody());
//					var login:LoginUser=LoginUser(notfi.getBody());
//				Alert.show("login result");
				
				
//				viewComponent.test();
					var user:User=new User();
					 message=notfi.getBody() as Message;
					if(message.messageSucess==0){
						Alert.show(message.messageBody);
						
					}else{
						new GateEffect(viewComponent);
						viewComponent.parentApplication.filp2Loe();
						
					 
//						percent=gf.openGate(percent);
						
						
						
					    MinnUtil.propertyMap(message.messageBody,user);
					
//				  Alert.show(arr[arr.length-1]);
					viewComponent.parentApplication.user=user;
//					for(var prp:String in obj){
//						if(login.hasOwnProperty(prp))
//							login[prp]=obj[prp];
//					}
//					Alert.show("login_name:"+login.userName_en);
					}
//					var arr:Array=ArrayUtil.toArray(notfi.getBody()) ;
					
//					Alert.show(notfi.getName());
//					var me:MessageEvent=new MessageEvent("__loginmessage",login);
//					var su:UserEvent=newd UserEvent(UserEvent.LOGINSUCESS,login);
//					pw.dispatchEvent(su);
//					}
//					Alert.show(login.loginName);
//					PopUpManager.removePopUp(viewComponent.parent);
//					Alert.show(result?"登录成功":"登录失败");
					break;
				case UserEvent.USER_REGISTERR_ESULT:
//					var login:User=new User();
					
					 message=MinnUtil.getMessage(notfi.getBody());
					if(message.messageSucess==0){
						Alert.show(message.messageBody);
						
					}else{
						Alert.show(message.messageBody);
					}
					viewComponent.parentApplication.filp2Loe();
					viewComponent.dispatchEvent(new CloseEvent(CloseEvent.CLOSE,true));
					break;
				case UserEvent.USER_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					//					Alert.show(arr[0].id);
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var op:User=new User();
						ac.addItem(op);
					}
					MinnUtil.copyProperty(ac,arr);
					
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
				case UserEvent.USER_CANCEL:
//					Alert.show("取消登录");
//					var me:MessageEvent=new MessageEvent("__logoutmessage");
//					var e:UserEvent=new UserEvent(UserEvent.CANCEL);
//					pw.dispatchEvent(e);
//					this.viewComponent.visible = false;
					break;
				//case ... break;
				//case ... break;
			}
		}
	}
}