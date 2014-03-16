/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.permission
{
	import mvc.model.permission.BaseProxy;
	import mvc.view.manager.permission.PermissionMngMediator;
	import mvc.view.manager.permission.event.PermissionEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class PermissionCommand extends SimpleCommand implements ICommand
	{
		private var baseProxy:BaseProxy=null;
		private  static const ACTION_SERVICE_NAME:String="permission.ActionService";
		private static const GROUP_SERVICE_NAME:String="permission.GroupService";
		public function PermissionCommand()
		{
			super();
			baseProxy=facade.retrieveProxy(BaseProxy.NAME) as BaseProxy;
		}
		override public function execute(notif:INotification):void
		{
			
			//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case PermissionEvent.ACTION_ADD:
					baseProxy.execute(ACTION_SERVICE_NAME,"add",PermissionEvent.ACTION_ADD_RESULT,notif.getBody());
					break;
			    case PermissionEvent.ACTION_QUERY:
					baseProxy.execute(ACTION_SERVICE_NAME,"query",PermissionEvent.ACTION_QUERY_RESULT,notif.getBody());
					break;
				case PermissionEvent.ACTION_MODIFY:
					baseProxy.execute(ACTION_SERVICE_NAME,"update",PermissionEvent.ACTION_MODIFY_RESULT,notif.getBody());
					break;
				case PermissionEvent.ACTION_DEL:
					baseProxy.execute(ACTION_SERVICE_NAME,"delete",PermissionEvent.ACTION_DEL_RESULT,notif.getBody());
					break;
				case PermissionEvent.GROUP_ACTION_QUERY:
					baseProxy.execute(ACTION_SERVICE_NAME,"query",PermissionEvent.GROUP_ACTION_QUERY_RESULT,notif.getBody());
					break;
				//角色
				case PermissionEvent.GROUP_ADD:
					baseProxy.execute(GROUP_SERVICE_NAME,"add",PermissionEvent.GROUP_ADD_RESULT,notif.getBody());
					break;
				case PermissionEvent.GROUP_QUERY:
					baseProxy.execute(GROUP_SERVICE_NAME,"query",PermissionEvent.GROUP_QUERY_RESULT,notif.getBody());
					break;
				case PermissionEvent.GROUP_MODIFY:
					baseProxy.execute(GROUP_SERVICE_NAME,"update",PermissionEvent.GROUP_MODIFY_RESULT,notif.getBody());
					break;
				case PermissionEvent.GROUP_DEL:
					baseProxy.execute(GROUP_SERVICE_NAME,"delete",PermissionEvent.GROUP_DEL_RESULT,notif.getBody());
					break;
				case PermissionEvent.GROUP_ACTION_SET:
					baseProxy.execute(GROUP_SERVICE_NAME,"groupActionSet",PermissionEvent.GROUP_ACTION_SET_RESULT,notif.getBody());
					break;
			}
		}
	}
}