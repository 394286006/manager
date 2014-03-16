/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.start
{
	
	
	import flexmdi.containers.MDIWindow;
	
	import mvc.model.advertise.AdvertiseProxy;
	import mvc.model.area.AreaProxy;
	import mvc.model.ctype.CtypeProxy;
	import mvc.model.domain.DomainProxy;
	import mvc.model.merchandise.MerchandiseProxy;
	import mvc.model.message.MessageProxy;
	import mvc.model.operator.OperatorProxy;
	import mvc.model.order.OrderProxy;
	import mvc.model.payway.PaywayProxy;
	import mvc.model.user.UserProxy;
	import mvc.view.front.user.UserMngMediator;
	import mvc.view.front.user.component.UserForm;
	import mvc.view.manager.AppCommand;
	import mvc.view.manager.advertise.component.AdvertiseMngPanel;
	import mvc.view.manager.advertise.AdvertiseMediator;
	import mvc.view.manager.advertise.AdvertiseMngMediator;
	import mvc.view.manager.area.AreaMngMediator;
	import mvc.view.manager.area.AreaPanelMediator;
	import mvc.view.manager.area.component.AreaPanel;
	import mvc.view.manager.ctype.CtypeMngMediator;
	import mvc.view.manager.ctype.CtypePanelMediator;
	import mvc.view.manager.domain.DomainMediator;
	import mvc.view.manager.domain.DomainMngMediator;
	import mvc.view.manager.merchandise.FirstPageSetPanelMediator;
	import mvc.view.manager.merchandise.MerchandiseMngMediator;
	import mvc.view.manager.merchandise.MerchandisePanelMediator;
	import mvc.view.manager.message.PublicMessageMngPanelMediator;
	import mvc.view.manager.message.PublicMessagePanelMediator;
	import mvc.view.manager.message.component.MessageMngPanel;
	import mvc.view.manager.message.component.MessagePanel;
	import mvc.view.manager.operator.OperatorLoginPanelMediator;
	import mvc.view.manager.operator.OperatorMngMediator;
	import mvc.view.manager.operator.OperatorPanelMediator;
	import mvc.view.manager.operator.component.LoginPanel;
	import mvc.view.manager.order.OrderMngMediator;
	import mvc.view.manager.payway.PaywayMngMediator;
	import mvc.view.manager.payway.PaywayPanelMediator;
	
	import mx.containers.TitleWindow;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import spark.components.TitleWindow;

	public class StartupCommand extends SimpleCommand implements ICommand
	{

		override public function execute(notif:INotification):void
		{
			// 初始化LoginPanel对应的Mediator
//			Alert.show("StartupCommand:"+notif.getName());
//			Alert.show("StartupCommand:"+notif.getBody());
//			Alert.show("StartupCommand:"+notif.getType());
//			var app:*=null;
//				if( notif.getBody() is spark.components.TitleWindow){
//					 app=notif.getBody() as spark.components.TitleWindow;
//					
//			   }
//				if( notif.getBody() is mx.containers.TitleWindow){
//					app=notif.getBody() as mx.containers.TitleWindow;
//				}
//				if( notif.getBody() is MDIWindow){
//					app=notif.getBody() as MDIWindow;
//				}
				
//				if(notif.getName()==''&&!facade.hasProxy(UserProxy.NAME))
//					facade.registerProxy(new UserProxy());
//				if(!facade.hasMediator(UserMediator.NAME))
//					facade.registerMediator(new UserMediator(app.getElementAt(0)));
			if(!facade.hasProxy(UserProxy.NAME))
				facade.registerProxy(new UserProxy());
			if(!facade.hasProxy(OperatorProxy.NAME))
//				facade.removeProxy(OperatorProxy.NAME);
				facade.registerProxy(new OperatorProxy());
			if(!facade.hasProxy(CtypeProxy.NAME))
				facade.registerProxy(new CtypeProxy());
			if(!facade.hasProxy(MerchandiseProxy.NAME))
				facade.registerProxy(new MerchandiseProxy());
			if(!facade.hasProxy(AreaProxy.NAME))
				facade.registerProxy(new AreaProxy());
			if(!facade.hasProxy(PaywayProxy.NAME))
				facade.registerProxy(new PaywayProxy());
			if(!facade.hasProxy(OrderProxy.NAME))
				facade.registerProxy(new OrderProxy());
			if(!facade.hasProxy(MessageProxy.NAME))
				facade.registerProxy(new MessageProxy());
			if(!facade.hasProxy(AdvertiseProxy.NAME))
				facade.registerProxy(new AdvertiseProxy());
			if(!facade.hasProxy(DomainProxy.NAME))
				facade.registerProxy(new DomainProxy());
//				if(notif.getName()==AppCommand.OPERATORPANEL_STARTUP){
//					if(facade.hasMediator(OperatorPanelMediator.NAME)){
//						 (facade.retrieveMediator(OperatorPanelMediator.NAME) as OperatorPanelMediator).userPanel=app.getElementAt(0);
////						facade.removeMediator(OperatorPanelMediator.NAME);
////						 facade.notifyObservers(notif);
//					}else
//					facade.registerMediator(new OperatorPanelMediator(app.getElementAt(0)));
//					
//				}
				
				if(notif.getName()==AppCommand.OPERATOR_MNG_STARTUP){
					if(facade.hasMediator(OperatorMngMediator.NAME)){
						(facade.retrieveMediator(OperatorMngMediator.NAME) as OperatorMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else
					facade.registerMediator(new OperatorMngMediator(notif.getBody()));
				}
				if(notif.getName()==AppCommand.OPERATOR_LOGIN_PANEL_STARTUP){
					if(facade.hasMediator(OperatorLoginPanelMediator.NAME)){
						(facade.retrieveMediator(OperatorLoginPanelMediator.NAME) as OperatorLoginPanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else
						facade.registerMediator(new OperatorLoginPanelMediator(notif.getBody()));
				}
				if(notif.getName()==AppCommand.OPERATOR_PANEL_STARTUP){
					if(facade.hasMediator(OperatorPanelMediator.NAME)){
						(facade.retrieveMediator(OperatorPanelMediator.NAME) as OperatorPanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else
						facade.registerMediator(new OperatorPanelMediator(notif.getBody()));
				}
				if(notif.getName()==AppCommand.USER_MNG_STARTUP){
					if(facade.hasMediator(UserMngMediator.NAME)){
						(facade.retrieveMediator(UserMngMediator.NAME) as UserMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						
						facade.registerMediator(new UserMngMediator(notif.getBody()));
					}
				}
				if(notif.getName()==AppCommand.CTYPE_MNG_STARTUP){
					if(facade.hasMediator(CtypeMngMediator.NAME)){
						(facade.retrieveMediator(CtypeMngMediator.NAME) as CtypeMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new CtypeMngMediator(notif.getBody()));
					}
				}
				if(notif.getName()==AppCommand.CTYPE_PANEL_STARTUP){
					if(facade.hasMediator(CtypePanelMediator.NAME)){
						(facade.retrieveMediator(CtypePanelMediator.NAME) as CtypePanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new CtypePanelMediator(notif.getBody()));
					}
				}
				if(notif.getName()==AppCommand.MERCHANDISE_MNG_STARTUP){
					if(facade.hasMediator(MerchandiseMngMediator.NAME)){
						(facade.retrieveMediator(MerchandiseMngMediator.NAME) as MerchandiseMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new MerchandiseMngMediator(notif.getBody()));
					}
				}
				if(notif.getName()==AppCommand.MERCHANDISE_PANEL_STARTUP){
					if(facade.hasMediator(MerchandisePanelMediator.NAME)){
						(facade.retrieveMediator(MerchandisePanelMediator.NAME) as MerchandisePanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new MerchandisePanelMediator(notif.getBody()));
					}
				}
				if(notif.getName()==AppCommand.MERCHANDISE_FIRSTPAGESET_PANEL_STARTUP){
					if(facade.hasMediator(FirstPageSetPanelMediator.NAME)){
						(facade.retrieveMediator(FirstPageSetPanelMediator.NAME) as FirstPageSetPanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new FirstPageSetPanelMediator(notif.getBody()));
					}
				}
				if(notif.getName()==AppCommand.AREA_MNG_STARTUP){
					if(facade.hasMediator(AreaMngMediator.NAME)){
						(facade.retrieveMediator(AreaMngMediator.NAME) as AreaMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new AreaMngMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.AREA_PANEL_STARTUP){
					if(facade.hasMediator(AreaPanelMediator.NAME)){
						(facade.retrieveMediator(AreaPanelMediator.NAME) as AreaPanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new AreaPanelMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.PAYWAY_MNG_STARTUP){
					if(facade.hasMediator(PaywayMngMediator.NAME)){
						(facade.retrieveMediator(PaywayMngMediator.NAME) as PaywayMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new PaywayMngMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.PAYWAY_PANEL_STARTUP){
					if(facade.hasMediator(PaywayPanelMediator.NAME)){
						(facade.retrieveMediator(PaywayPanelMediator.NAME) as PaywayPanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new PaywayPanelMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.ORDER_MNG_STARTUP){
					if(facade.hasMediator(OrderMngMediator.NAME)){
						(facade.retrieveMediator(OrderMngMediator.NAME) as OrderMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new OrderMngMediator(notif.getBody()));
					}
				}
				
				
				if(notif.getName()==AppCommand.MESSAGE_MNG_PANEL_STARTUP){
					if(facade.hasMediator(PublicMessageMngPanelMediator.NAME)){
						(facade.retrieveMediator(PublicMessageMngPanelMediator.NAME) as PublicMessageMngPanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new PublicMessageMngPanelMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.MESSAGE_PANEL_STARTUP){
					if(facade.hasMediator(PublicMessagePanelMediator.NAME)){
						(facade.retrieveMediator(PublicMessagePanelMediator.NAME) as PublicMessagePanelMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new PublicMessagePanelMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.ADVERTISE_MNG_PANEL_STARTUP){
					if(facade.hasMediator(AdvertiseMngMediator.NAME)){
						(facade.retrieveMediator(AdvertiseMngMediator.NAME) as AdvertiseMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new AdvertiseMngMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.ADVERTISE_PANEL_STARTUP){
					if(facade.hasMediator(AdvertiseMediator.NAME)){
						(facade.retrieveMediator(AdvertiseMediator.NAME) as AdvertiseMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new AdvertiseMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.DOMAIN_MNG_PANEL_STARTUP){
					if(facade.hasMediator(DomainMngMediator.NAME)){
						(facade.retrieveMediator(DomainMngMediator.NAME) as DomainMngMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new DomainMngMediator(notif.getBody()));
					}
				}
				
				if(notif.getName()==AppCommand.DOMAIN_PANEL_STARTUP){
					if(facade.hasMediator(DomainMediator.NAME)){
						(facade.retrieveMediator(DomainMediator.NAME) as DomainMediator).userPanel=notif.getBody();//app.getElementAt(0);
					}else{
						facade.registerMediator(new DomainMediator(notif.getBody()));
					}
				}
				
		}
	}
}