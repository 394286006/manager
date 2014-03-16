/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.advertise
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class AdvertiseSetMediator extends Mediator implements IMediator
	{
		
		public static const NAME:String = "AdvertiseSetMediator";
		public function AdvertiseSetMediator(viewComponent:Object=null)
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
			viewComponent.addEventListener(AdvertiseEvent.GENERATOR_ADVERTISE_MENU,onGeneratorMenu);
			viewComponent.addEventListener(AdvertiseEvent.ADVERTISE_SET_QUERY,onQuery);
			viewComponent.addEventListener(AdvertiseEvent.ADVERTISE_SET_MENU_QUERY,onMenuQuery);
		}
		
		private function onGeneratorMenu(evt:AdvertiseEvent):void{
			sendNotification(AdvertiseEvent.GENERATOR_ADVERTISE_MENU,evt.data);
		}
		private function onQuery(evt:AdvertiseEvent):void{
			sendNotification(AdvertiseEvent.ADVERTISE_SET_QUERY,evt.data);
		}
		private function onMenuQuery(evt:AdvertiseEvent):void{
			sendNotification(AdvertiseEvent.ADVERTISE_SET_MENU_QUERY,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[
				AdvertiseEvent.ADVERTIESE_QUERY,
				AdvertiseEvent.ADVERTIESE_QUERY_RESULT,
				AdvertiseEvent.GENERATOR_ADVERTISE_MENU,
				AdvertiseEvent.GENERATOR_ADVERTISE_MENU_RESULT,
				AdvertiseEvent.ADVERTISE_SET_MENU_QUERY,
				AdvertiseEvent.ADVERTISE_SET_MENU_QUERY_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
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
				case AdvertiseEvent.GENERATOR_ADVERTISE_MENU_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					break;
				case AdvertiseEvent.ADVERTISE_SET_MENU_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var ads:AdvertiseSet=new AdvertiseSet();
						ac.addItem(ads);
					}
					MinnUtil.copyProperty(ac,arr);
					userPanel.invokeMenuQuery(ac);
					break;
			}
		}
	}
}