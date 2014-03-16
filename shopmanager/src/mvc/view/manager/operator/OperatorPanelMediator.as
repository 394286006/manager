/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.operator
{
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.operator.vo.Operator;
	import mvc.view.manager.operator.event.OperatorEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class OperatorPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "OperatorPanelMediator";
		public function OperatorPanelMediator(viewComponent:Object=null)
		{
			
			super(NAME, viewComponent);
			registerEvent();
		}
		public function get userPanel():Object{
			return viewComponent;
		}
		public function set userPanel(viewComponent:Object):void{
			this.setViewComponent(viewComponent);
			registerEvent();
		}
		private function registerEvent():void{
			viewComponent.addEventListener(OperatorEvent.OPERATOR_ADD,onAdd);
			viewComponent.addEventListener(OperatorEvent.OPERATOR_MODIFY,onModify);
		}
		private function onAdd(event:OperatorEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(OperatorEvent.OPERATOR_ADD,event.data);
		}
		private function onModify(event:OperatorEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(OperatorEvent.OPERATOR_MODIFY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[OperatorEvent.OPERATOR_ADD,
				OperatorEvent.OPERATOR_ADD_RESULT,
				OperatorEvent.OPERATOR_MODIFY,
				OperatorEvent.OPERATOR_MODIFY_RESULT
				];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case OperatorEvent.OPERATOR_ADD_RESULT:
					//					Alert.show('OperatorMngMediator:OperatorEvent.OPERATOR_ADD_RESULT');
					message=notfi.getBody() as Message;
					var oper:Operator=new Operator();
					//					Alert.show(message.otherInfo.id);
					MinnUtil.propertyMap(message.otherInfo,oper);
					
					Alert.show(message.messageBody,"提示");
					userPanel.invokeAdd(oper);
					//					operator.color=1;
					break;
				case OperatorEvent.OPERATOR_MODIFY_RESULT:
					//					Alert.show('OperatorMngMediator:OPERATOR_MODIFY_RESULT');
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					userPanel.cancel_clickHandler();
					break;
			}
		}
	}
}