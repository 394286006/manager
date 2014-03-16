/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.merchandise
{
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.ctype.vo.Ctype;
	import mvc.model.ctype.vo.CtypeMenu;
	import mvc.model.merchandise.vo.Merchandise;
	import mvc.view.manager.merchandise.event.MerchandiseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MerchandiseMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "MerchandiseMngMediator";
		
		public function MerchandiseMngMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY,onQueryCtype);
			viewComponent.addEventListener(MerchandiseEvent.MERCHANDISE_QUERY,onQuery);
			viewComponent.addEventListener(MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE,onDelCtype);
			viewComponent.addEventListener(MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU,onGeneratorMenu);
			viewComponent.addEventListener(MerchandiseEvent.MERCHANDISE_DEL,onDel);
		}
		private function onQueryCtype(event:MerchandiseEvent):void{
//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY,event.data);
		}
		private function onQuery(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.MERCHANDISE_QUERY,event.data);
		}
		
		private function onAddCtype(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
//			sendNotification(MerchandiseEvent.CTYPE_TREE_MERCHANDISE_ADD,event.data);
		}
		private function onDelCtype(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE,event.data);
		}
		private function onGeneratorMenu(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU,event.data);
		}
		private function onDel(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.MERCHANDISE_DEL,event.data);
		}
		override public function listNotificationInterests():Array{
			return[
				MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY,
				MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY_RESULT,
				MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE,
				MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE_RESULT,
				MerchandiseEvent.MERCHANDISE_QUERY,
				MerchandiseEvent.MERCHANDISE_QUERY_RESULT,
				MerchandiseEvent.MERCHANDISE_DEL,
				MerchandiseEvent.MERCHANDISE_DEL_RESULT,
				MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU,
				MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY_RESULT:
					message=notfi.getBody() as Message;
//					if(message.messageBody!="")
					userPanel.invokeCtypeTree(XMLList(message.messageBody));
//					Alert.show(message.messageBody);
//					var arr:Array=JSON.decode(message.messageBody);
					//					Alert.show(arr[0].id);
//					var ac:ArrayCollection=new ArrayCollection();
//					for(var i:int=0;i<arr.length;i++){
//						var op:CtypeMenu=new CtypeMenu();
//						ac.addItem(op);
//					}
//					MinnUtil.copyProperty(ac,arr);
//					userPanel.invokeCtypeTree(new ArrayCollection(arr));
//					else
//						userPanel.invokeCtypeTree(null);
		 			
//					Alert.show(XMLList(message.messageBody).toString());
					break;
				case MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE_RESULT:
					message=notfi.getBody() as Message;
//					Alert.show(message.messageBody);
					userPanel.invokeCategoryDelHandler();
					break;
				case MerchandiseEvent.MERCHANDISE_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					//										Alert.show(message.otherInfo.toString());
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var v:Merchandise=new Merchandise();
						ac.addItem(v);
					}
					MinnUtil.copyProperty(ac,arr);
					
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
				case MerchandiseEvent.MERCHANDISE_DEL_RESULT:
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
				case MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					break;

			}
		}
	}
}