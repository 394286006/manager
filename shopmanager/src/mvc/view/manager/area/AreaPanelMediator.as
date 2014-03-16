/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.area
{
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.area.vo.City;
	import mvc.model.area.vo.Province;
	import mvc.model.area.vo.Town;
	import mvc.view.manager.area.event.AreaEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class AreaPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "AreaPanelMediator";
		public function AreaPanelMediator( viewComponent:Object=null)
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
			viewComponent.addEventListener(AreaEvent.AREA_PROVINCE_ADD,oninVoke);
			viewComponent.addEventListener(AreaEvent.AREA_PROVINCE_MODIFY,oninVoke);
			viewComponent.addEventListener(AreaEvent.AREA_CITY_ADD,oninVoke);
			viewComponent.addEventListener(AreaEvent.AREA_CITY_MODIFY,oninVoke);
			viewComponent.addEventListener(AreaEvent.AREA_TOWN_ADD,oninVoke);
			viewComponent.addEventListener(AreaEvent.AREA_TOWN_MODIFY,oninVoke);
		}
		
		private function oninVoke(evt:AreaEvent):void{
			sendNotification(evt.type,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[AreaEvent.AREA_PROVINCE_ADD,
				AreaEvent.AREA_PROVINCE_ADD_RESULT,
				AreaEvent.AREA_PROVINCE_MODIFY,
				AreaEvent.AREA_PROVINCE_MODIFY_RESULT,
				AreaEvent.AREA_CITY_ADD,
				AreaEvent.AREA_CITY_ADD_RESULT,
				AreaEvent.AREA_CITY_MODIFY,
				AreaEvent.AREA_CITY_MODIFY_RESULT,
				AreaEvent.AREA_TOWN_ADD,
				AreaEvent.AREA_TOWN_ADD_RESULT,
				AreaEvent.AREA_TOWN_MODIFY,
				AreaEvent.AREA_TOWN_MODIFY_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case AreaEvent.AREA_PROVINCE_ADD_RESULT:
					message=notfi.getBody() as Message;
					var v:Province=new Province();
					MinnUtil.propertyMap(message.otherInfo,v);
					if(message.messageSucess==1){
						userPanel.invokeAdd(v);
					}
					Alert.show(message.messageBody,"提示");
					break;
				case AreaEvent.AREA_PROVINCE_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
					userPanel.cancel_clickHandler();
					break;
				case AreaEvent.AREA_CITY_ADD_RESULT:
					message=notfi.getBody() as Message;
					var c:City=new City();
					MinnUtil.propertyMap(message.otherInfo,c);
					if(message.messageSucess==1){
						userPanel.invokeAdd(c);
					}
					Alert.show(message.messageBody,"提示");
					break;
				case AreaEvent.AREA_CITY_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1)
						userPanel.invokeUpdate();
//						userPanel.cancel_clickHandler();
					break;
				case AreaEvent.AREA_TOWN_ADD_RESULT:
					message=notfi.getBody() as Message;
					var t:Town=new Town();
					MinnUtil.propertyMap(message.otherInfo,t);
					if(message.messageSucess==1){
						
						userPanel.invokeAdd(t);
					}
					Alert.show(message.messageBody,"提示");
					break;
				case AreaEvent.AREA_TOWN_MODIFY_RESULT:
					message=notfi.getBody() as Message;
					Alert.show(message.messageBody,"提示");
					if(message.messageSucess==1){
						userPanel.invokeUpdate();
					}
					break;
			}
		}
	}
}