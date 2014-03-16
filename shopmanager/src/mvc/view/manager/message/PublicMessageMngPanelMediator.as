/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.message
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.message.vo.PublicMessge;
	import mvc.view.manager.message.event.PublicMessageEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class PublicMessageMngPanelMediator extends Mediator implements IMediator
	{
		
		public static const NAME:String = "PublicMessageMngPanelMediator";
		public function PublicMessageMngPanelMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(PublicMessageEvent.PUBLICMESSAGE_DEL,onDel);
			viewComponent.addEventListener(PublicMessageEvent.PUBLICMESSAGE_QUERY,onQuery);
			viewComponent.addEventListener(PublicMessageEvent.GENERATOR_PUBLICMESSAGE,onGenerator);
		}
		private function onDel(event:PublicMessageEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(PublicMessageEvent.PUBLICMESSAGE_DEL,event.data);
		}
		private function onQuery(event:PublicMessageEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(PublicMessageEvent.PUBLICMESSAGE_QUERY,event.data);
		}
		
		private function onGenerator(evt:PublicMessageEvent):void{
			sendNotification(PublicMessageEvent.GENERATOR_PUBLICMESSAGE,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[PublicMessageEvent.PUBLICMESSAGE_DEL,
				PublicMessageEvent.PUBLICMESSAGE_DEL_RESULT,
				PublicMessageEvent.PUBLICMESSAGE_QUERY,
				PublicMessageEvent.PUBLICMESSAGE_QUERY_RESULT,
				PublicMessageEvent.GENERATOR_PUBLICMESSAGE,
				PublicMessageEvent.GENERATOR_PUBLICMESSAGE_RESULT
			];
		}
		
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case PublicMessageEvent.PUBLICMESSAGE_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var op:PublicMessge=new PublicMessge();
						ac.addItem(op);
					}
					MinnUtil.copyProperty(ac,arr);
					userPanel.invokeQuery(ac,message.otherInfo);
					if(message.messageSucess==0)
					Alert.show(message.messageBody,"提示");
					break;
				case PublicMessageEvent.PUBLICMESSAGE_DEL_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
					    userPanel.invokeDel();
					//					userPanel.invokeCategoryDelHandler();
					break;
				case PublicMessageEvent.GENERATOR_PUBLICMESSAGE_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					break;
				
			}
		}
	}
}