/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.area
	
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.area.event.AreaEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class AreaProxy extends Proxy implements IProxy
	{
		public static const NAME:String="AreaProxy";
		private static const SERVICE_NAME:String="area.AreaService";
		private static const PROFINCE_SERVICE_NAME:String="area.ProvinceService";
		private static const CITY_SERVICE_NAME:String="area.CityService";
		private static const TOWN_SERVICE_NAME:String="area.TownService";
		public function AreaProxy()
		{
			super(NAME, new Object());
		}
		public function addProvince(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,PROFINCE_SERVICE_NAME,"add",AreaEvent.AREA_PROVINCE_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		
		public function modifyProvince(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,PROFINCE_SERVICE_NAME,"update",AreaEvent.AREA_PROVINCE_MODIFY_RESULT,info);
		}
		
		public function delProvince(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,PROFINCE_SERVICE_NAME,"delete",AreaEvent.AREA_PROVINCE_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		public function addCity(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,CITY_SERVICE_NAME,"add",AreaEvent.AREA_CITY_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		
		public function modifyCity(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,CITY_SERVICE_NAME,"update",AreaEvent.AREA_CITY_MODIFY_RESULT,info);
		}
		
		public function delCity(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,CITY_SERVICE_NAME,"delete",AreaEvent.AREA_CITY_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function addTown(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,TOWN_SERVICE_NAME,"add",AreaEvent.AREA_TOWN_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		
		public function modifyTown(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,TOWN_SERVICE_NAME,"update",AreaEvent.AREA_TOWN_MODIFY_RESULT,info);
		}
		
		public function delTown(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,TOWN_SERVICE_NAME,"delete",AreaEvent.AREA_TOWN_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",AreaEvent.AREA_QUERY_RESULT,info);
		}
		public function generatorMenu(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"generatorJsonMenu",AreaEvent.AREA_GENERATOR_MENU_RESULT,info);
		}
	}
}