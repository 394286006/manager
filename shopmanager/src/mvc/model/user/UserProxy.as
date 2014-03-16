/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.user
{
	import com.adobe.crypto.MD5;
	import com.adobe.crypto.MD5Stream;
	import com.adobe.serialization.json.JSON;
	
	import flash.utils.ByteArray;
	
	import flashx.textLayout.utils.CharacterUtil;
	
	import minn.util.MinnUtil;
	
	import mvc.ApplicationFacade;
	import mvc.model.user.vo.User;
	import mvc.view.front.user.event.UserEvent;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.utils.Base64Decoder;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class UserProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="USER_PROXY";
		
		public function UserProxy(){
			super(NAME,new Object);
		}
		
		public function login(info:Object):void{
//			Alert.show('login:'+info.item.userName_en);
			MinnUtil.send(this,"user.UserService","login",UserEvent.USER_LOGIN_RESULT,info);
//			this.sendNotification(UserEvent.USER_LOGIN_RESULT,"登陆成功");
		}
		
		public function add(info:Object):void{
//					Alert.show('user add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,"user.UserService","add",UserEvent.USER_REGISTERR_ESULT,info);
//				        this.sendNotification(UserEvent.USER_REGISTERR_ESULT,"添加成功");
		}
		
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,"operator.OperatorService","update",UserEvent.USER_LOGIN_RESULT,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,"operator.OperatorService","delete",UserEvent.USER_LOGIN_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(condition:Object):void{
			MinnUtil.send(this,"user.UserService","query",UserEvent.USER_QUERY_RESULT,condition);
		}
	}
}