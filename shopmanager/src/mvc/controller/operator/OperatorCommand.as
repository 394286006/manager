/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.operator
{
	
	import mvc.ApplicationFacade;
	import mvc.model.operator.OperatorProxy;
	import mvc.model.operator.vo.Operator;
	import mvc.model.user.UserProxy;
	import mvc.model.user.vo.User;
	import mvc.view.manager.operator.event.OperatorEvent;
	import mvc.view.front.user.UserMngMediator;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class OperatorCommand extends SimpleCommand implements ICommand
	{
		private var userProxy:UserProxy = null;
		private var operatorProxy:OperatorProxy=null;

		public function OperatorCommand()
		{
			 super();
			 //			userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			 operatorProxy=facade.retrieveProxy(OperatorProxy.NAME) as OperatorProxy;
			 
		}
		override public function execute(notif:INotification):void
		{

//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case OperatorEvent.OPERATOR_LOGIN:
					operatorProxy.login(notif.getBody());
					break;
				case OperatorEvent.OPERATOR_ADD:
//					Alert.show('UserCommand: OperatorEvent.OPERATORADD');
					operatorProxy.add(notif.getBody());
//					this.sendNotification(OperatorEvent.OPEN_OPERATORPANEL_RESULT,notif.getBody());
					break;
//				case OperatorEvent.MNG_TO_OPERATOR_MESSAGE:
//					Alert.show('UserCommand: OperatorEvent.MNG_TO_OPERATOR_MESSAGE');
//					this.sendNotification(OperatorEvent.MNG_TO_OPERATOR_MESSAGE_RESULT,notif.getBody());
//					operatorProxy.open(notif.getBody() as String);
//					break;
				case OperatorEvent.OPERATOR_MODIFY:
//					Alert.show('UserCommand:OperatorEvent.OPEN_OPERATORPANEL_RESULT');
					operatorProxy.modify(notif.getBody());
//					this.sendNotification(OperatorEvent.MNG_TO_OPERATOR_MESSAGE_RESULT,notif.getBody() as Operator);
					break;
				case OperatorEvent.OPERATOR_DEL:
					operatorProxy.del(notif.getBody());
					break;
				case OperatorEvent.OPERATOR_QUERY:
					operatorProxy.query(notif.getBody());
					break;
			}
			
		
		}

	}
}