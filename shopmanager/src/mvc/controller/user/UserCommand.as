/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.user
{
	import mvc.model.user.UserProxy;
	import mvc.model.user.vo.User;
	import mvc.view.front.FrontAppCommand;
	import mvc.view.front.user.event.UserEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class UserCommand extends SimpleCommand implements ICommand
	{
		var userProxy:UserProxy=null;
		public function UserCommand()
		{
			super();
			userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
		}
		override public function execute(notif:INotification):void
		{
			switch(notif.getName()){
				case UserEvent.USER_LOGIN:
					userProxy.login(notif.getBody());
					break;
				case UserEvent.USER_REGISTER:
					userProxy.add(notif.getBody());
					break;
				case UserEvent.USER_QUERY:
					userProxy.query(notif.getBody());
					break;
			}
		
		}
	}
}