/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.advertise
{
	import mvc.model.advertise.AdvertiseProxy;
	import mvc.view.manager.advertise.event.AdvertiseEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AdvertiseCommand extends SimpleCommand implements ICommand
	{
		private var adProxy:AdvertiseProxy=null;
		public function AdvertiseCommand()
		{
			super();
			adProxy=facade.retrieveProxy(AdvertiseProxy.NAME) as AdvertiseProxy;
		}
		
		override public function execute(notif:INotification):void
		{
			//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case AdvertiseEvent.ADVERTIESE_ADD:
					adProxy.add(notif.getBody());
					break;
				case AdvertiseEvent.ADVERTIESE_MODIFY:
					adProxy.modify(notif.getBody());
					break;
				case AdvertiseEvent.ADVERTIESE_DEL:
					adProxy.del(notif.getBody());
					break;
				case AdvertiseEvent.ADVERTIESE_QUERY:
					adProxy.query(notif.getBody());
					break;
				case AdvertiseEvent.GENERATOR_ADVERTISE_MENU:
					adProxy.generatorAdvertiseMenu(notif.getBody());
					break;
				case AdvertiseEvent.ADVERTISE_SET_QUERY:
					adProxy.querySet(notif.getBody());
					break;
				case AdvertiseEvent.ADVERTISE_SET_MENU_QUERY:
					adProxy.getAdvertiseMenu(notif.getBody());
					break;
				
			}
		}
	}
}