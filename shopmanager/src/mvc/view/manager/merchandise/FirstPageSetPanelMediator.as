/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.merchandise
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.merchandise.vo.Merchandise;
	import mvc.model.merchandise.vo.Photo;
	import mvc.view.manager.merchandise.event.MerchandiseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class FirstPageSetPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "FirstPageSetPanelMediator";
		
		public function FirstPageSetPanelMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET,onModify);
			viewComponent.addEventListener(MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY,onQuery);
		}
		private function onModify(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET,event.data);
		}
		private function onQuery(event:MerchandiseEvent):void{
			//						Alert.show('MerchandiseEvent onQueryCtype');
			sendNotification(MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY,event.data);
		}
		override public function listNotificationInterests():Array{
			return[MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET,
				MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_RESULT,
				MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY,
				MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY_RESULT
				];
		}
		override public function handleNotification(notfi:INotification):void{
				
				var message:Message=null;
				switch(notfi.getName()){
					case MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_RESULT:
						message=notfi.getBody() as Message;
						Alert.show(message.messageBody,"提示");
						userPanel.cancel_clickHandler();
						break;
					case MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY_RESULT:
						message=notfi.getBody() as Message;
//						Alert.show(message.messageSucess+'');
						var arr:Array=JSON.decode(message.messageBody);
					
//																Alert.show(message.otherInfo.toString());
						var ac:ArrayCollection=new ArrayCollection();
						for(var i:int=0;i<arr.length;i++){
							var v:Photo=new Photo();
							ac.addItem(v);
						}
						MinnUtil.copyProperty(ac,arr);
						
						userPanel.invokeQuery(ac);
						break;
				}
		}
	}
}