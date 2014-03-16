/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.ctype
{
	import minn.event.MinnMessageEvent;
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.ctype.vo.Ctype;
	import mvc.model.ctype.vo.CtypeMenu;
	import mvc.view.manager.ctype.event.CtypeEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class CtypePanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "CtypePanelMediator";
		
		public function CtypePanelMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(CtypeEvent.CTYPE_MENU_QUERY,onMenuQuery);
			viewComponent.addEventListener(CtypeEvent.CTYPE_ADD,onAdd);
			viewComponent.addEventListener(CtypeEvent.CTYPE_MODIFY,onModify);
		}
		private function onMenuQuery(event:CtypeEvent):void{
			//						Alert.show('d');
			sendNotification(CtypeEvent.CTYPE_MENU_QUERY);
		}
		private function onAdd(event:CtypeEvent):void{
			//			Alert.show('OperatorMngMediator onAdd');
			sendNotification(CtypeEvent.CTYPE_ADD,event.data);
		}
		private function onModify(event:CtypeEvent):void{
			sendNotification(CtypeEvent.CTYPE_MODIFY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[CtypeEvent.CTYPE_MENU_QUERY,
				   CtypeEvent.CTYPE_MENU_QUERY_RESULT,
				   CtypeEvent.CTYPE_ADD,
				   CtypeEvent.CTYPE_ADD_RESULT,
				   CtypeEvent.CTYPE_MODIFY,
				   CtypeEvent.CTYPE_MODIFY_RESULT
			];
		}
		
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case CtypeEvent.CTYPE_MENU_QUERY_RESULT:
					message=notfi.getBody() as Message;
//					Alert.show('ctype menu:'+message.messageBody);
					userPanel.invokeCtypeMenu(XMLList(message.messageBody));
					break;
				case CtypeEvent.CTYPE_ADD_RESULT:
					message=notfi.getBody() as Message;
//					var ct:CtypeMenu=new CtypeMenu();
//					//					Alert.show(message.otherInfo.id);
//					ct.name=message.otherInfo.name;
//					ct.id=message.otherInfo.id;
//					ct.pid=message.otherInfo.pid;
//					ct.category=message.otherInfo.category;
//					var me:MinnMessageEvent=new MinnMessageEvent(MinnMessageEvent.MESSAGE+"CtypePanel",{index:index,item:ct},true);
//									MinnMessageEventManager.getInstance().dispatchEvent(me);
//					userPanel.dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
					userPanel.invokeAdd("<node name='"+message.otherInfo.name+"' id='"+message.otherInfo.id+"' pid='"+message.otherInfo.pid+"' " +
						"  category='"+message.otherInfo.category+"' descript='"+message.otherInfo.descript+"'/>");
//					Alert.show("CtypeMediator add:"+message.messageBody);
//					MinnUtil.propertyMap(message.otherInfo,ct);
//					userPanel.invokeAdd(message.otherInfo);
					break;
				case CtypeEvent.CTYPE_MODIFY_RESULT:
					message=notfi.getBody() as Message;
//					MinnUtil.propertyMap(message.otherInfo,ct);
					userPanel.invokeModify("<node name='"+message.otherInfo.name+"' id='"+message.otherInfo.id+"' pid='"+message.otherInfo.pid+"' " +
						"  category='"+message.otherInfo.category+"' descript='"+message.otherInfo.descript+"'/>");
//					userPanel.invokeUpdate(message.otherInfo);
					break;
			}
		}
	}
}