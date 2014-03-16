/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.controller.area
{
	import mvc.model.area.AreaProxy;
	import mvc.view.manager.area.event.AreaEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AreaCommand extends SimpleCommand implements ICommand
	{
		private var areaProxy:AreaProxy=null;
		public function AreaCommand()
		{
			super();
			areaProxy=facade.retrieveProxy(AreaProxy.NAME) as AreaProxy;
		}
		override public function execute(notif:INotification):void
		{
			//			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			//			Alert.show("UserCommand:"+notif.getName());
			switch(notif.getName()){
				case AreaEvent.AREA_PROVINCE_ADD:
					areaProxy.addProvince(notif.getBody());
					break;
				case AreaEvent.AREA_PROVINCE_MODIFY:
					areaProxy.modifyProvince(notif.getBody());
					break;
				case AreaEvent.AREA_PROVINCE_DEL:
					areaProxy.delProvince(notif.getBody());
					break;
				case AreaEvent.AREA_CITY_ADD:
					areaProxy.addCity(notif.getBody());
					break;
				case AreaEvent.AREA_CITY_MODIFY:
					areaProxy.modifyCity(notif.getBody());
					break;
				case AreaEvent.AREA_CITY_DEL:
					areaProxy.delCity(notif.getBody());
					break;
				case AreaEvent.AREA_TOWN_ADD:
					areaProxy.addTown(notif.getBody());
					break;
				case AreaEvent.AREA_TOWN_MODIFY:
					areaProxy.modifyTown(notif.getBody());
					break;
				case AreaEvent.AREA_TOWN_DEL:
					areaProxy.delTown(notif.getBody());
					break;
				case AreaEvent.AREA_QUERY:
					areaProxy.query(notif.getBody());
					break;
				case AreaEvent.AREA_GENERATOR_MENU:
					areaProxy.generatorMenu(notif.getBody());
					break;
			}
		}
	}
}