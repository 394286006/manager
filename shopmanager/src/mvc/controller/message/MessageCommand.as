/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.message
{
	import mvc.model.message.MessageProxy;
	import mvc.view.manager.message.event.PublicMessageEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class MessageCommand extends SimpleCommand implements ICommand
	{
		
		private var messageProxy:MessageProxy=null;
		
		public function MessageCommand()
		{
			super();
			messageProxy=facade.retrieveProxy(MessageProxy.NAME) as MessageProxy;
		}
		
		override public function execute(notif:INotification):void
		{
			//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case PublicMessageEvent.PUBLICMESSAGE_ADD:
					messageProxy.add(notif.getBody());
					break;
				case PublicMessageEvent.PUBLICMESSAGE_MODIRY:
					messageProxy.modify(notif.getBody());
					break;
				case PublicMessageEvent.PUBLICMESSAGE_DEL:
					messageProxy.del(notif.getBody());
					break;
				case PublicMessageEvent.PUBLICMESSAGE_QUERY:
					messageProxy.query(notif.getBody());
					break;
				case PublicMessageEvent.GENERATOR_PUBLICMESSAGE:
					messageProxy.generatorPublicMessae(notif.getBody());
					break;
				
			}
		}
	}
}