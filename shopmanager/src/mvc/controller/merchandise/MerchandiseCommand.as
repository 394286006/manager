/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.merchandise
{
	import mvc.model.merchandise.MerchandiseProxy;
	import mvc.view.manager.merchandise.event.MerchandiseEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class MerchandiseCommand extends SimpleCommand implements ICommand
	{
		private var merchandiseProxy:MerchandiseProxy=null;
		
		public function MerchandiseCommand()
		{
			super();
			merchandiseProxy=facade.retrieveProxy(MerchandiseProxy.NAME) as MerchandiseProxy;
		}
		
		override public function execute(notif:INotification):void
		{
			//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case MerchandiseEvent.MERCHANDISE_ADD:
					merchandiseProxy.add(notif.getBody());
					break;
				case MerchandiseEvent.MERCHANDISE_MODIFY:
					merchandiseProxy.modify(notif.getBody());
					break;
				case MerchandiseEvent.MERCHANDISE_DEL:
					merchandiseProxy.del(notif.getBody());
					break;
				case MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY:
					merchandiseProxy.queryCtypeTree(notif.getBody());
					break;
				case MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE:
					merchandiseProxy.delCtype(notif.getBody());
					break;
				case MerchandiseEvent.MERCHANDISE_QUERY:
					merchandiseProxy.query(notif.getBody());
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_ADD:
					merchandiseProxy.addPhoto(notif.getBody());
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY:
					merchandiseProxy.modifyPhoto(notif.getBody());
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_DELETE:
					merchandiseProxy.delPhoto(notif.getBody());
					break;
				case MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU:
					merchandiseProxy.generatorMenu(notif.getBody());
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET:
					merchandiseProxy.firstPageSet(notif.getBody());
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY:
					merchandiseProxy.getFirstPageSet(notif.getBody());
					break;
			}
		}
	}
}