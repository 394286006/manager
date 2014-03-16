/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.payway
{
	import mvc.model.payway.PaywayProxy;
	import mvc.view.manager.payway.event.PaywayEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class PaywayCommand extends SimpleCommand implements ICommand
	{
		private var pawayProxy:PaywayProxy=null;
		public function PaywayCommand()
		{
			super();
			pawayProxy=facade.retrieveProxy(PaywayProxy.NAME) as PaywayProxy;
		}
		override public function execute(notif:INotification):void
		{
			switch(notif.getName()){
				case PaywayEvent.PAYWAY_ADD:
					pawayProxy.add(notif.getBody());
					break;
				case PaywayEvent.PAYWAY_MODIFY:
					pawayProxy.modify(notif.getBody());
					break;
				case PaywayEvent.PAYWAY_DEL:
					pawayProxy.del(notif.getBody());
					break;
				case PaywayEvent.PAYWAY_QUERY:
					pawayProxy.query();
					break;
			}
		}
	}
}