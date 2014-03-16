/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.ctype
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.ctype.vo.Ctype;
	import mvc.view.manager.ctype.event.CtypeEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class CtypeMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "CtypeMngMediator";
		
		public function CtypeMngMediator(viewComponent:Object=null)
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
			//			viewComponent.addEventListener(CtypeEvent.OPERATOR_LOGIN,onLogin);
			
			viewComponent.addEventListener(CtypeEvent.CTYPE_CANCEL,onCancel);
		
			viewComponent.addEventListener(CtypeEvent.CTYPE_DEL,onDel);
			viewComponent.addEventListener(CtypeEvent.CTYPE_QUERY,onQuery);
			
		}
		private function onLogin(event:CtypeEvent):void{
			//			Alert.show((event.data as User).loginName);
//			sendNotification(CtypeEvent.OPERATOR_LOGIN,event.data);
		}
	
		private function onCancel(event:CtypeEvent):void{
			sendNotification(CtypeEvent.CTYPE_CANCEL);
		}
	
		private function onDel(event:CtypeEvent):void{
			sendNotification(CtypeEvent.CTYPE_DEL,event.data);
		}
		private function onQuery(event:CtypeEvent):void{
			//						Alert.show('d');
			sendNotification(CtypeEvent.CTYPE_QUERY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[
				CtypeEvent.CTYPE_CANCEL,
				//				CtypeEvent.MNG_TO_OPERATOR_MESSAGE,
				//				CtypeEvent.OPERATOR_TO_MNG_MESSAGE,
				
				CtypeEvent.CTYPE_DEL,
				CtypeEvent.CTYPE_DEL_RESULT,
				CtypeEvent.CTYPE_QUERY,
				CtypeEvent.CTYPE_QUERY_RESULT,
				CtypeEvent.CTYPE_MENU_QUERY,
				CtypeEvent.CTYPE_MENU_QUERY_RESULT];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case CtypeEvent.CTYPE_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
//										Alert.show(message.otherInfo.toString());
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var op:Ctype=new Ctype();
						ac.addItem(op);
					}
					MinnUtil.copyProperty(ac,arr);
					
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
			
			}
		}
	}
}