/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.domain
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.domain.event.DomainEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class DomainProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="DomainProxy";
		private static const SERVICE_NAME:String="domain.DomainService";
		public function DomainProxy()
		{
			super(NAME, new Object());
		}
		
		public function add(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"add",DomainEvent.DOMAIN_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,SERVICE_NAME,"update",DomainEvent.DOMAIN_MODIFY_RESULT,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"delete",DomainEvent.DOMAIN_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(condition:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",DomainEvent.DOMAIN_QUERY_RESULT,condition);
		}
		public function generatorDomainMenu(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"generatorDomainMenu",DomainEvent.GENERATOR_DOMAIN_MENU_RESULT,info);
		}
	}
}