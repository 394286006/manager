/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.advertise
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.advertise.event.AdvertiseEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class AdvertiseProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="AdvertiseProxy";
		private static const SERVICE_NAME:String="advertise.AdvertiseService";
		public function AdvertiseProxy()
		{
			super(NAME, new Object());
		}
		
		public function add(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"add",AdvertiseEvent.ADVERTIESE_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,SERVICE_NAME,"update",AdvertiseEvent.ADVERTIESE_MODIFY_RESULT,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"delete",AdvertiseEvent.ADVERTIESE_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(condition:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",AdvertiseEvent.ADVERTIESE_QUERY_RESULT,condition);
		}
		public function querySet(condition:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",AdvertiseEvent.ADVERTISE_SET_QUERY_RESULT,condition);
		}
		public function getAdvertiseMenu(condition:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"getAdvertiseMenu",AdvertiseEvent.ADVERTISE_SET_MENU_QUERY_RESULT,condition);
		}
		public function generatorAdvertiseMenu(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"generatorAdvertiseMenu",AdvertiseEvent.GENERATOR_ADVERTISE_MENU_RESULT,info);
		}
	}
}