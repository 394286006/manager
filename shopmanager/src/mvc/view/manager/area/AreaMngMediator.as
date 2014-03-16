/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.area
{
	import com.adobe.serialization.json.JSON;
	
	import minn.event.MinnMessageEventManager;
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.area.vo.Province;
	import mvc.view.manager.area.event.AreaEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class AreaMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "AreaMngMediator";
		
		public function AreaMngMediator( viewComponent:Object=null)
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
			viewComponent.addEventListener(AreaEvent.AREA_QUERY,onQuery);
			viewComponent.addEventListener(AreaEvent.AREA_PROVINCE_DEL,onInvoke);
			viewComponent.addEventListener(AreaEvent.AREA_CITY_DEL,onInvoke); 
			viewComponent.addEventListener(AreaEvent.AREA_TOWN_DEL,onInvoke);
			viewComponent.addEventListener(AreaEvent.AREA_GENERATOR_MENU,onInvoke);
			
		}
		private function onInvoke(evt:AreaEvent):void{
			sendNotification(evt.type,evt.data);
		}
		
		private function onQuery(evt:AreaEvent):void{
			sendNotification(AreaEvent.AREA_QUERY,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[AreaEvent.AREA_PROVINCE_DEL,
				AreaEvent.AREA_PROVINCE_DEL_RESULT,
				AreaEvent.AREA_CITY_DEL,
				AreaEvent.AREA_CITY_DEL_RESULT,
				AreaEvent.AREA_TOWN_DEL,
				AreaEvent.AREA_TOWN_DEL_RESULT,
				AreaEvent.AREA_QUERY,
				AreaEvent.AREA_QUERY_RESULT,
				AreaEvent.AREA_GENERATOR_MENU,
				AreaEvent.AREA_GENERATOR_MENU_RESULT
				];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
			   case AreaEvent.AREA_PROVINCE_DEL_RESULT:
				   message=notfi.getBody() as Message;
				   if(message.messageSucess==0){
					   Alert.show(message.messageBody,"提示");
				   }else if(message.messageSucess==1){
					   Alert.show(message.messageBody,"提示");
					   userPanel.invokeDel(0);
				   }else
				   {
					   Alert.show("不可预知的异常，请与管理员联系","提示");
				   }
				   break;
			   case AreaEvent.AREA_CITY_DEL_RESULT:
				   message=notfi.getBody() as Message;
				   if(message.messageSucess==0){
					   Alert.show(message.messageBody,"提示");
				   }else if(message.messageSucess==1){
					   Alert.show(message.messageBody,"提示");
					   userPanel.invokeDel(1);
				   }else
				   {
					   Alert.show("不可预知的异常，请与管理员联系","提示");
				   }
				   break;
			   case AreaEvent.AREA_TOWN_DEL_RESULT:
				   message=notfi.getBody() as Message;
				   if(message.messageSucess==0){
					   Alert.show(message.messageBody,"提示");
				   }else if(message.messageSucess==1){
					   Alert.show(message.messageBody,"提示");
					   userPanel.invokeDel(2);
				   }else
				   {
					   Alert.show("不可预知的异常，请与管理员联系","提示");
				   }
				   break;
			   case AreaEvent.AREA_QUERY_RESULT:
				   message=notfi.getBody() as Message;
				   var arr:Array=JSON.decode(message.messageBody);
				   //										Alert.show(message.otherInfo.toString());
				   var ac:ArrayCollection=new ArrayCollection();
				   for(var i:int=0;i<arr.length;i++){
					   var v:Province=new Province();
					   ac.addItem(v);
				   }
				   MinnUtil.copyProperty(ac,arr);
				   
				   userPanel.invokeQuery(ac,message.otherInfo);
				   break;  
			   case AreaEvent.AREA_GENERATOR_MENU_RESULT:
				   message=notfi.getBody() as Message;
				   Alert.show(message.messageBody,"提示");
				   break;
			}
		}
	}
}