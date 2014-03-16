/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.operator
{
	
	import minn.util.MinnUtil;
	
	import mvc.model.operator.vo.Operator;
	import mvc.view.manager.operator.event.OperatorEvent;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class OperatorProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="OPERATOR_PROXY";
		
		public function OperatorProxy(){
			super(NAME,new Object);
		}
		
		public function login(info:Object):void{
			MinnUtil.send(this,"operator.OperatorService","login",OperatorEvent.OPERATOR_LOGIN_RESULT,info);
		}
		
		public function add(info:Object):void{
//		Alert.show('OperatorProxy add');	
//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,"operator.OperatorService","add",OperatorEvent.OPERATOR_ADD_RESULT,info);
//	        this.sendNotification(
		}
		
		public function modify(info:Object):void{
			
//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,"operator.OperatorService","update",OperatorEvent.OPERATOR_MODIFY_RESULT,info);
		}
		
		public function del(info:Object):void{
//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,"operator.OperatorService","delete",OperatorEvent.OPERATOR_DEL_RESULT,info);
//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(condition:Object):void{
			MinnUtil.send(this,"operator.OperatorService","query",OperatorEvent.OPERATOR_QUERY_RESULT,condition);
		}
		
//		public function open(url:String):void{
//			this.sendNotification(OperatorEvent.OPEN_OPERATORPANEL,url);
//		}
	}
}