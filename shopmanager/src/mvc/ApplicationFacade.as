/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc
{
	
	import mvc.controller.advertise.AdvertiseCommand;
	import mvc.controller.area.AreaCommand;
	import mvc.controller.ctype.CtypeCommand;
	import mvc.controller.domain.DomainCommand;
	import mvc.controller.merchandise.MerchandiseCommand;
	import mvc.controller.message.MessageCommand;
	import mvc.controller.operator.OperatorCommand;
	import mvc.controller.order.OrderCommand;
	import mvc.controller.payway.PaywayCommand;
	import mvc.controller.start.StartupCommand;
	import mvc.controller.user.UserCommand;
	import mvc.model.area.AreaProxy;
	import mvc.model.order.OrderProxy;
	import mvc.model.payway.PaywayProxy;
	import mvc.view.front.user.event.UserEvent;
	import mvc.view.manager.AppCommand;
	import mvc.view.manager.advertise.event.AdvertiseEvent;
	import mvc.view.manager.area.event.AreaEvent;
	import mvc.view.manager.ctype.event.CtypeEvent;
	import mvc.view.manager.domain.event.DomainEvent;
	import mvc.view.manager.merchandise.event.MerchandiseEvent;
	import mvc.view.manager.message.component.MessageMngPanel;
	import mvc.view.manager.message.event.PublicMessageEvent;
	import mvc.view.manager.operator.event.OperatorEvent;
	import mvc.view.manager.order.event.OrderEvent;
	import mvc.view.manager.payway.event.PaywayEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class ApplicationFacade extends  Facade implements IFacade
	{
		//Notification name constants
		
		public static function getInstance():ApplicationFacade{
			if(instance==null)
				instance = new ApplicationFacade;
							
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void{
			super.initializeController();
//			registerCommand(AppCommand.OPERATOR_PANEL_STARTUP,StartupCommand);
				
			registerCommand(AppCommand.OPERATOR_MNG_STARTUP,StartupCommand);//管理员管理
			registerCommand(AppCommand.OPERATOR_LOGIN_PANEL_STARTUP,StartupCommand);
			
			registerCommand(OperatorEvent.OPERATOR_QUERY,OperatorCommand);
			registerCommand(OperatorEvent.OPERATOR_DEL,OperatorCommand);
			registerCommand(OperatorEvent.OPERATOR_LOGIN,OperatorCommand);
			
			registerCommand(AppCommand.OPERATOR_PANEL_STARTUP,StartupCommand);//管理员管理
			registerCommand(OperatorEvent.OPERATOR_ADD,OperatorCommand);
			registerCommand(OperatorEvent.OPERATOR_MODIFY,OperatorCommand);
			
			registerCommand(AppCommand.USER_MNG_STARTUP,StartupCommand);
			registerCommand(UserEvent.USER_QUERY,UserCommand);
			
			registerCommand(AppCommand.CTYPE_MNG_STARTUP,StartupCommand);//商品类别管理
			registerCommand(CtypeEvent.CTYPE_QUERY,CtypeCommand);
		
			
			registerCommand(AppCommand.CTYPE_PANEL_STARTUP,StartupCommand);
			registerCommand(CtypeEvent.CTYPE_ADD,CtypeCommand);
			registerCommand(CtypeEvent.CTYPE_MODIFY,CtypeCommand);
//			registerCommand(CtypeEvent.CTYPE_MENU_QUERY,CtypeCommand);
			
			registerCommand(AppCommand.MERCHANDISE_MNG_STARTUP,StartupCommand);//商品管理
			registerCommand(MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY,MerchandiseCommand);
			registerCommand(MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE,MerchandiseCommand);
			registerCommand(MerchandiseEvent.MERCHANDISE_QUERY,MerchandiseCommand);
			registerCommand(MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU,MerchandiseCommand);
			registerCommand(MerchandiseEvent.MERCHANDISE_DEL,MerchandiseCommand);
			
			registerCommand(AppCommand.MERCHANDISE_FIRSTPAGESET_PANEL_STARTUP,StartupCommand);
			registerCommand(MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET,MerchandiseCommand);
			registerCommand(MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY,MerchandiseCommand);
			
			registerCommand(AppCommand.MERCHANDISE_PANEL_STARTUP,StartupCommand);
			registerCommand(MerchandiseEvent.MERCHANDISE_ADD,MerchandiseCommand);
			registerCommand(MerchandiseEvent.MERCHANDISE_MODIFY,MerchandiseCommand);
			registerCommand(MerchandiseEvent.PHOTO_MERCHANDISE_ADD,MerchandiseCommand);
			registerCommand(MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY,MerchandiseCommand);
			registerCommand(MerchandiseEvent.PHOTO_MERCHANDISE_DELETE,MerchandiseCommand);
			
			registerCommand(AppCommand.AREA_MNG_STARTUP,StartupCommand);//区域管理
			registerCommand(AreaEvent.AREA_QUERY,AreaCommand);
			registerCommand(AreaEvent.AREA_GENERATOR_MENU,AreaCommand);
			registerCommand(AreaEvent.AREA_PROVINCE_DEL,AreaCommand);
			registerCommand(AreaEvent.AREA_CITY_DEL,AreaCommand);
			registerCommand(AreaEvent.AREA_TOWN_DEL,AreaCommand);
			
			registerCommand(AppCommand.AREA_PANEL_STARTUP,StartupCommand);
			registerCommand(AreaEvent.AREA_PROVINCE_ADD,AreaCommand);
			registerCommand(AreaEvent.AREA_PROVINCE_MODIFY,AreaCommand);
			registerCommand(AreaEvent.AREA_CITY_ADD,AreaCommand);
			registerCommand(AreaEvent.AREA_CITY_MODIFY,AreaCommand);
			registerCommand(AreaEvent.AREA_TOWN_ADD,AreaCommand);
			registerCommand(AreaEvent.AREA_TOWN_MODIFY,AreaCommand);
			
			
			registerCommand(AppCommand.PAYWAY_MNG_STARTUP,StartupCommand);//付款方式管理
			registerCommand(PaywayEvent.PAYWAY_QUERY,PaywayCommand);
			registerCommand(PaywayEvent.PAYWAY_DEL,PaywayCommand);
			
			registerCommand(AppCommand.PAYWAY_PANEL_STARTUP,StartupCommand);
			registerCommand(PaywayEvent.PAYWAY_ADD,PaywayCommand);
			registerCommand(PaywayEvent.PAYWAY_MODIFY,PaywayCommand);

			registerCommand(AppCommand.ORDER_MNG_STARTUP,StartupCommand);//订单管理
			registerCommand(OrderEvent.ORDER_QUERY,OrderCommand);
			registerCommand(OrderEvent.ORDER_MODIFY,OrderCommand);
			registerCommand(OrderEvent.ORDER_DEL,OrderCommand);
			
			registerCommand(AppCommand.MESSAGE_MNG_PANEL_STARTUP,StartupCommand);//消息管理
			registerCommand(PublicMessageEvent.PUBLICMESSAGE_QUERY,MessageCommand);
			registerCommand(PublicMessageEvent.PUBLICMESSAGE_DEL,MessageCommand);
			registerCommand(PublicMessageEvent.GENERATOR_PUBLICMESSAGE,MessageCommand);
			
			registerCommand(AppCommand.MESSAGE_PANEL_STARTUP,StartupCommand);
			registerCommand(PublicMessageEvent.PUBLICMESSAGE_ADD,MessageCommand);
			registerCommand(PublicMessageEvent.PUBLICMESSAGE_MODIRY,MessageCommand);
			
			
			
			
			registerCommand(AppCommand.DOMAIN_MNG_PANEL_STARTUP,StartupCommand);//域名管理
			registerCommand(DomainEvent.DOMAIN_QUERY,DomainCommand);
			registerCommand(DomainEvent.DOMAIN_DEL,DomainCommand);
			registerCommand(DomainEvent.GENERATOR_DOMAIN_MENU,DomainCommand);
			
			registerCommand(AppCommand.DOMAIN_PANEL_STARTUP,StartupCommand);
			registerCommand(DomainEvent.DOMAIN_ADD,DomainCommand);
			registerCommand(DomainEvent.DOMAIN_MODIFY,DomainCommand);
			
			registerCommand(AppCommand.ADVERTISE_MNG_PANEL_STARTUP,StartupCommand);//广告管理
			registerCommand(AdvertiseEvent.ADVERTIESE_DEL,AdvertiseCommand);
			registerCommand(AdvertiseEvent.ADVERTIESE_QUERY,AdvertiseCommand);
			registerCommand(AdvertiseEvent.GENERATOR_ADVERTISE_MENU,AdvertiseCommand);
			
			registerCommand(AppCommand.ADVERTISE_PANEL_STARTUP,StartupCommand);
			registerCommand(AdvertiseEvent.ADVERTIESE_ADD,AdvertiseCommand);
			registerCommand(AdvertiseEvent.ADVERTIESE_MODIFY,AdvertiseCommand);
			
//			registerCommand(AppCommand.ADVERTISE_SET_PANEL_STARTUP,StartupCommand);
			registerCommand(AdvertiseEvent.ADVERTISE_SET_QUERY,AdvertiseCommand);
			registerCommand(AdvertiseEvent.ADVERTISE_SET_MENU_QUERY,AdvertiseCommand);
		}

		public function startup(cmd:String,app:Object):void{
			
			sendNotification(cmd,app);
		}
		
		
	}
}