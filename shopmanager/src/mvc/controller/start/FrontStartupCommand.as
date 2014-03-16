/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.start
{
	import mvc.model.user.UserProxy;
	import mvc.view.front.FrontAppCommand;
	import mvc.view.front.user.UserMngMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import mx.controls.Alert;
	
	public class FrontStartupCommand extends SimpleCommand implements ICommand
	{
		public function FrontStartupCommand()
		{
			super();
		}
		
		override public function execute(notif:INotification):void
		{
			
			if(!facade.hasProxy(UserProxy.NAME))
				facade.registerProxy(new UserProxy());
//			Alert.show("FrontStartupCommand:"+notif.getName());
			if(notif.getName()==FrontAppCommand.FRONT_USER_STARTUP){
				if(facade.hasMediator(UserMngMediator.NAME)){
					(facade.retrieveMediator(UserMngMediator.NAME) as UserMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
				}else{
					
					facade.registerMediator(new UserMngMediator(notif.getBody()));
				}
			}
		}
	}
}