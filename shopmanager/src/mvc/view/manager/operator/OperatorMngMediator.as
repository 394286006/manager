/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.operator
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.proxy.WindowProxy;
	import minn.util.MinnUtil;
	
	import mvc.model.operator.vo.Operator;
	import mvc.view.manager.AppCommand;
	import mvc.view.manager.operator.event.OperatorEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.IVisualElement;
	import mx.events.ModuleEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import spark.components.TitleWindow;

	public class OperatorMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "OperatorMngMediator";
		
		
		
		public function OperatorMngMediator(viewComponent:Object)
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
//			viewComponent.addEventListener(OperatorEvent.OPERATOR_LOGIN,onLogin);
			viewComponent.addEventListener(OperatorEvent.OPERATOR_CANCEL,onCancel);
			viewComponent.addEventListener(OperatorEvent.OPERATOR_DEL,onDel);
			viewComponent.addEventListener(OperatorEvent.OPERATOR_QUERY,onQuery);
		}
		
		private function onLogin(event:OperatorEvent):void{
			//			Alert.show((event.data as User).loginName);
			sendNotification(OperatorEvent.OPERATOR_LOGIN,event.data);
		}
//		private function onAdd(event:OperatorEvent):void{
////			Alert.show('OperatorMngMediator onAdd');
//			sendNotification(OperatorEvent.OPERATOR_ADD,event.data);
//		}
		private function onCancel(event:OperatorEvent):void{
			sendNotification(OperatorEvent.OPERATOR_CANCEL);
		}
//		private function onModify(event:OperatorEvent):void{
//			sendNotification(OperatorEvent.OPERATOR_MODIFY,event.data);
//		}
		private function onDel(event:OperatorEvent):void{
			sendNotification(OperatorEvent.OPERATOR_DEL,event.data);
		}
		private function onQuery(event:OperatorEvent):void{
			//						Alert.show('d');
			sendNotification(OperatorEvent.OPERATOR_QUERY,event.data);
		}
		override public function listNotificationInterests():Array{
		 return[OperatorEvent.OPERATOR_LOGIN_RESULT,
				OperatorEvent.OPERATOR_CANCEL,
//				OperatorEvent.OPERATOR_ADD,
//				OperatorEvent.OPERATOR_ADD_RESULT,
//				OperatorEvent.MNG_TO_OPERATOR_MESSAGE,
//				OperatorEvent.OPERATOR_TO_MNG_MESSAGE,
//				OperatorEvent.OPERATOR_MODIFY,
//				OperatorEvent.OPERATOR_MODIFY_RESULT,
				OperatorEvent.OPERATOR_DEL,
				OperatorEvent.OPERATOR_DEL_RESULT,
				OperatorEvent.OPERATOR_QUERY,
				OperatorEvent.OPERATOR_QUERY_RESULT];
		}
		
		override public function handleNotification(notfi:INotification):void{
			
			//			Alert.show("handleNotification:"+notfi.getName());
			var message:Message=null;
			switch(notfi.getName()){
				case OperatorEvent.OPERATOR_LOGIN_RESULT:
					//					var d:JSON
					//					var result:Boolean = new Boolean(notfi.getBody());
					//					var login:LoginUser=LoginUser(notfi.getBody());
					var login:Operatort=new Operator();
					message=MinnUtil.getMessage(notfi.getBody());
					if(message.messageSucess==0){
						Alert.show(message.messageBody);
						
					}else{
						MinnUtil.propertyMap(message.messageBody,login);
						var su:OperatorEvent=new OperatorEvent(OperatorEvent.OPERATOR_LOGIN_RESULT,login);
//						pw.dispatchEvent(su);
						viewComponent.dispatchEvent(su);
					}
					//					Alert.show(login.loginName);
					//					PopUpManager.removePopUp(viewComponent.parent);
					//					Alert.show(result?"登录成功":"登录失败");
					break;
				case OperatorEvent.OPERATOR_QUERY_RESULT:
//					Alert.show(notfi.getBody().toString());
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
//					Alert.show(arr[0].id);
					var ac:ArrayCollection=new ArrayCollection();
					 for(var i:int=0;i<arr.length;i++){
						 var op:Operator=new Operator();
						 ac.addItem(op);
					 }
					 MinnUtil.copyProperty(ac,arr);
					
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
				case OperatorEvent.OPERATOR_DEL_RESULT:
//					Alert.show(notfi.getBody().toString());
//					message=MinnUtil.getMessage(notfi.getBody());
				
					message=notfi.getBody() as Message;
					if(message.messageSucess==0){
						Alert.show(message.messageBody,"提示");
					}else if(message.messageSucess==1){
						Alert.show(message.messageBody,"提示");
						userPanel.invokeDel();
					}else
					{
						Alert.show("不可预知的异常，请与管理员联系","提示");
					}
					break;
				case OperatorEvent.OPERATOR_CANCEL:
					//					Alert.show("取消登录");
					//					var me:MessageEvent=new MessageEvent("__logoutmessage");
					//					var e:OperatorEvent=new OperatorEvent(OperatorEvent.CANCEL);
					//					pw.dispatchEvent(e);
					//					this.viewComponent.visible = false;
					break;
				//case ... break;
				//case ... break;
			}
		}
	}
}