/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.merchandise
{
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.ctype.vo.Ctype;
	import mvc.model.merchandise.vo.Merchandise;
	import mvc.view.manager.merchandise.event.MerchandiseEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MerchandisePanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "MerchandisePanelMediator";
		
		public function MerchandisePanelMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(MerchandiseEvent.MERCHANDISE_ADD,onAdd);
			viewComponent.addEventListener(MerchandiseEvent.MERCHANDISE_MODIFY,onModify);
			viewComponent.addEventListener(MerchandiseEvent.PHOTO_MERCHANDISE_ADD,onPhotoAdd);
			viewComponent.addEventListener(MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY,onPhotoModify);
			viewComponent.addEventListener(MerchandiseEvent.PHOTO_MERCHANDISE_DELETE,onPhotoDel);
		}
		private function onMenuQuery(event:MerchandiseEvent):void{
			//						Alert.show('d');
//			sendNotification(MerchandiseEvent.CTYPE_MENU_QUERY);
		}
		private function onPhotoAdd(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.PHOTO_MERCHANDISE_ADD,event.data);
		}
		private function onPhotoModify(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY,event.data);
		}
		private function onPhotoDel(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.PHOTO_MERCHANDISE_DELETE,event.data);
		}
		private function onAdd(event:MerchandiseEvent):void{
			//			Alert.show('OperatorMngMediator onAdd');
			sendNotification(MerchandiseEvent.MERCHANDISE_ADD,event.data);
		}
		private function onModify(event:MerchandiseEvent):void{
			sendNotification(MerchandiseEvent.MERCHANDISE_MODIFY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[MerchandiseEvent.MERCHANDISE_ADD,
				   MerchandiseEvent.MERCHANDISE_ADD_RESULT,
				   MerchandiseEvent.MERCHANDISE_MODIFY,
				   MerchandiseEvent.MERCHANDISE_MODIFY_RESULT,
				   MerchandiseEvent.PHOTO_MERCHANDISE_ADD,
				   MerchandiseEvent.PHOTO_MERCHANDISE_ADD_RESULT,
				   MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY,
				   MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY_RESULT,
				   MerchandiseEvent.PHOTO_MERCHANDISE_DELETE,
				   MerchandiseEvent.PHOTO_MERCHANDISE_DELETE_RESULT
			];
		}
		
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case MerchandiseEvent.MERCHANDISE_ADD_RESULT:
					message=notfi.getBody() as Message;
					var mer:Merchandise=new Merchandise();
					var ct:Ctype=new Ctype();
					//					Alert.show(message.otherInfo.id);
					MinnUtil.propertyMap(message.otherInfo,mer);
					MinnUtil.propertyMap(mer._ctype,ct);
					mer._ctype=ct;
					Alert.show(message.messageBody,"提示");
//					Alert.show(mer._ctype.name);
//					Alert.show(mer.name);
					//					var me:MinnMessageEvent=new MinnMessageEvent(MinnMessageEvent.MESSAGE+"CtypePanel",{index:index,item:ct},true);
					//									MinnMessageEventManager.getInstance().dispatchEvent(me);
					//					userPanel.dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
					userPanel.invokeAdd(mer);
					//					Alert.show("CtypeMediator add:"+message.messageBody);
					break;
				case MerchandiseEvent.MERCHANDISE_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					userPanel.cancel_clickHandler();
					//					userPanel.invokeUpdate(message.otherInfo);
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_ADD_RESULT:
					message=notfi.getBody() as Message;
					userPanel.invokeAddPhoto(mer);
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					userPanel.invokeModifyPhoto(mer);
					break;
				case MerchandiseEvent.PHOTO_MERCHANDISE_DELETE_RESULT:
					message=notfi.getBody() as Message;
					userPanel.invokeDelPhoto(mer);
					break;
			}
		}
	}
}