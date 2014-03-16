/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.order
{
	import mvc.model.order.OrderProxy;
	import mvc.view.manager.order.event.OrderEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class OrderCommand extends SimpleCommand implements ICommand
	{
		private var orderProxy:OrderProxy=null;
		public function OrderCommand()
		{
			super();
			orderProxy=facade.retrieveProxy(OrderProxy.NAME) as OrderProxy;
		}
		override public function execute(notif:INotification):void
		{
			
			switch(notif.getName()){
				case OrderEvent.ORDER_QUERY:
					orderProxy.query(notif.getBody());
					break;
				case OrderEvent.ORDER_MODIFY:
					orderProxy.modify(notif.getBody());
					break;
				case OrderEvent.ORDER_DEL:
					orderProxy.del(notif.getBody());
					break;
			}
	   }
	}
}