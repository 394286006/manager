/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.front.user
{
	import mvc.view.front.user.event.UserEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class LoginOrRegisterMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "LoginOrRegisterPanelMediator";
		public function LoginOrRegisterMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
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
		viewComponent.addEventListener(UserEvent.USER_LOGIN,onLogin);
		//			viewComponent.addEventListener(OperatorEvent.OPERATOR_CANCEL,onCancel);
		
	}
	private function onLogin(event:UserEvent):void{
		//			Alert.show((event.data as User).loginName);
		sendNotification(UserEvent.USER_LOGIN,event.data);
	}
	
	
	override public function listNotificationInterests():Array{
		return[UserEvent.USER_LOGIN_RESULT,
			[UserEvent.USER_CANCEL];
	}
	override public function handleNotification(notfi:INotification):void{
		
		//			Alert.show("handleNotification:"+notfi.getName());
		var message:Message=null;
		switch(notfi.getName()){
			case UserEvent.USER_LOGIN_RESULT:
				break;
		}
	}
	}
}