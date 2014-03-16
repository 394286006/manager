/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.ctype
{
	import mvc.model.ctype.CtypeProxy;
	import mvc.view.manager.ctype.event.CtypeEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CtypeCommand extends SimpleCommand implements ICommand
	{
		private var ctypeProxy:CtypeProxy=null;
		
		public function CtypeCommand()
		{
			super();
			ctypeProxy=facade.retrieveProxy(CtypeProxy.NAME) as CtypeProxy;
		}
		 
		override public function execute(notif:INotification):void
		{
			//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case CtypeEvent.CTYPE_ADD:
					    ctypeProxy.add(notif.getBody());
					break;
				case CtypeEvent.CTYPE_QUERY:
					ctypeProxy.query(notif.getBody());
					break;
				case CtypeEvent.CTYPE_MODIFY:
					ctypeProxy.modify(notif.getBody());
					break;
				case CtypeEvent.CTYPE_MENU_QUERY://已经取消该方法
//					ctypeProxy.queryCtypeMenu();
					break;
			}
		}
	}
}