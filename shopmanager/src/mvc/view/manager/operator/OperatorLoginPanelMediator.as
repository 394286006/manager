/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.operator
{
	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	
	import minn.event.MinnMessageEvent;
	import minn.event.MinnMessageEventManager;
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.ApplicationFacade;
	import mvc.model.operator.vo.Operator;
	import mvc.view.manager.operator.event.OperatorEvent;
	
	import mx.controls.Alert;
	import mx.core.IVisualElement;
	import mx.events.CloseEvent;
	import mx.events.ModuleEvent;
	import mx.managers.PopUpManager;
	import mx.messaging.channels.StreamingAMFChannel;
	import mx.modules.IModuleInfo;
	import mx.modules.Module;
	import mx.utils.ArrayUtil;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class OperatorLoginPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "OperatorLoginPanelMediator";
		
		
		
		public function OperatorLoginPanelMediator(viewComponent:Object)
		{
			super(NAME,viewComponent);
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
			viewComponent.addEventListener(OperatorEvent.OPERATOR_LOGIN,onLogin);
//			viewComponent.addEventListener(OperatorEvent.OPERATOR_CANCEL,onCancel);
		
		}
		
		private function onLogin(event:OperatorEvent):void{
			//			Alert.show((event.data as User).loginName);
			sendNotification(OperatorEvent.OPERATOR_LOGIN,event.data);
		}
		private function onMessage(event:OperatorEvent):void{
			//			Alert.show((event.data as User).loginName);
//			sendNotification(OperatorEvent.MNG_TO_OPERATOR_MESSAGE_RESULT,event.data);
		}
		private function onModify(event:OperatorEvent):void{
			//						Alert.show('d');
			sendNotification(OperatorEvent.OPERATOR_MODIFY,event.data);
		}
	
		private function onCancel(event:OperatorEvent):void{
			sendNotification(OperatorEvent.OPERATOR_CANCEL);
		}
		
		override public function listNotificationInterests():Array{
			 return[OperatorEvent.OPERATOR_LOGIN_RESULT,
					OperatorEvent.OPERATOR_CANCEL];
		}
		
		override public function handleNotification(notfi:INotification):void{
			
			//			Alert.show("handleNotification:"+notfi.getName());
			var message:Message=null;
			switch(notfi.getName()){
				case OperatorEvent.OPERATOR_LOGIN_RESULT:
//					Alert.show('OperatorEvent.OPERATOR_LOGIN_RESULT');
					
					var operator:Operator=new Operator();
					message=notfi.getBody() as Message;
					if(message.messageSucess==0){
						Alert.show(message.messageBody);
						
					}else{
						MinnUtil.propertyMap(message.messageBody,operator);
//						var me:MessageEvent=new MessageEvent("shopmanager"+MessageEvent.MESSAGE,operator,true);
//						MessageEventManager.getInstance().dispatchEvent(me);
						userPanel.parentDocument.operator=operator;
						MinnMessageEventManager.getInstance().dispatchEvent(new OperatorEvent(OperatorEvent.OPERATOR_LOGIN2MAIN,null,true));
						userPanel.dispatchEvent(new CloseEvent(CloseEvent.CLOSE,true));
						
                        Alert.show('登录成功！','提示');
					}
					break;
				case OperatorEvent.OPERATOR_CANCEL:
					//					Alert.show("取消登录");
					break;
			}
		}
	}
}