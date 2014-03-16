/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.advertise
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.advertise.vo.Advertise;
	import mvc.view.manager.advertise.event.AdvertiseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class AdvertiseMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "AdvertiseMngMediator";
		public function AdvertiseMngMediator(viewComponent:Object=null)
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
			//			viewComponent.addEventListener(AreaEvent.AREA_ADD,onAdd);
			viewComponent.addEventListener(AdvertiseEvent.ADVERTIESE_QUERY,onQuery);
			viewComponent.addEventListener(AdvertiseEvent.ADVERTIESE_DEL,onDel);
	
			
		}
		
		private function onQuery(evt:AdvertiseEvent):void{
			sendNotification(AdvertiseEvent.ADVERTIESE_QUERY,evt.data);
		}
		
		private function onDel(evt:AdvertiseEvent):void{
			sendNotification(AdvertiseEvent.ADVERTIESE_DEL,evt.data);
		}
		

		override public function listNotificationInterests():Array{
			return[
				AdvertiseEvent.ADVERTIESE_DEL,
				AdvertiseEvent.ADVERTIESE_DEL_RESULT,
				AdvertiseEvent.ADVERTIESE_QUERY,
				AdvertiseEvent.ADVERTIESE_QUERY_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case AdvertiseEvent.ADVERTIESE_DEL_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
						userPanel.invokeDel();
					break;
				case AdvertiseEvent.ADVERTIESE_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var op:Advertise=new Advertise();
						ac.addItem(op);
					}
					MinnUtil.copyProperty(ac,arr);
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
				
			}
		}
	}
}