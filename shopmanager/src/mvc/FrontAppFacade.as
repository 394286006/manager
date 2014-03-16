/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc
{
	import mvc.controller.start.FrontStartupCommand;
	import mvc.controller.user.UserCommand;
	import mvc.view.front.FrontAppCommand;
	import mvc.view.front.user.event.UserEvent;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	import mx.controls.Alert;
	
	public class FrontAppFacade extends Facade implements IFacade
	{
	
		
		public static function getInstance():FrontAppFacade{
			if(instance==null)
				instance = new FrontAppFacade;
			
			return instance as FrontAppFacade;
		}
		
		override protected function initializeController():void{
			super.initializeController();
//			Alert.show('init');
			//			registerCommand(AppCommand.OPERATOR_PANEL_STARTUP,StartupCommand);
			registerCommand(FrontAppCommand.FRONT_USER_STARTUP,FrontStartupCommand);
			
//			registerCommand(AppCommand.OPERATOR_LOGIN_PANEL_STARTUP,StartupCommand);
			
			registerCommand(UserEvent.USER_REGISTER,UserCommand);
			
//			registerCommand(OperatorEvent.OPERATOR_MODIFY,OperatorCommand);
//			registerCommand(OperatorEvent.OPERATOR_QUERY,OperatorCommand);
			registerCommand(UserEvent.USER_LOGIN,UserCommand);
			
		}
		
		public function startup(cmd:String,app:Object):void{
//						Alert.show('startup:'+cmd);
			
			sendNotification(cmd,app);
		}
	}
}