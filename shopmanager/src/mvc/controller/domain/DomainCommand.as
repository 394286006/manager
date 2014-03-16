/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.domain
{
	import mvc.model.domain.DomainProxy;
	import mvc.view.manager.domain.event.DomainEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DomainCommand extends SimpleCommand implements ICommand
	{
		private var domainProxy:DomainProxy=null;
		public function DomainCommand()
		{
			super();
			domainProxy=facade.retrieveProxy(DomainProxy.NAME) as DomainProxy;
		}
		
		override public function execute(notif:INotification):void
		{
			//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case DomainEvent.DOMAIN_ADD:
					domainProxy.add(notif.getBody());
					break;
				case DomainEvent.DOMAIN_MODIFY:
					domainProxy.modify(notif.getBody());
					break;
				case DomainEvent.DOMAIN_DEL:
					domainProxy.del(notif.getBody());
					break;
				case DomainEvent.DOMAIN_QUERY:
					domainProxy.query(notif.getBody());
					break;
				case DomainEvent.GENERATOR_DOMAIN_MENU:
					domainProxy.generatorDomainMenu(notif.getBody());
					break;
				
			}
		}
	}
}