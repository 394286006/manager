/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.permission
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.view.manager.permission.event.PermissionEvent;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.utils.ArrayUtil;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class BaseProxy extends Proxy implements IProxy
	{
		[Bindable] 
		[Embed("/assets/img/page/wait.gif")] 
		private static var c:Class; 
		private static var param:String=null;
		private var l:int;
		private var returntype:String;
		public static const  NAME:String="BaseProxy";
//		private static const SERVICE_NAME:String="permission.ActionService";
		private var ro:RemoteObject;
		public function BaseProxy()
		{
			super(NAME, new Object());
		}
	   
		public function execute(service_name:String,method:String,type:String,info:*=null):void{
//			//		Alert.show('OperatorProxy add');	
//			//			Alert.show(operator.opr_name_en);
//			MinnUtil.send(this,proxy_name,method,type,info);
			returntype=type;
			ro=new RemoteObject();
			ro.destination="amfphp";
			ro.source=service_name;
			 l=CursorManager.getInstance().setCursor(c);
			CursorManager.getInstance().setBusyCursor()
			ro.addEventListener(FaultEvent.FAULT,sendFaultResult);	
			ro.addEventListener(ResultEvent.RESULT,sendResult);
			if(info!=null){
				trace("MinnUtil.send 传送的字符串参数："+JSON.encode(info.item));
				param=JSON.encode(info.item);
//								Alert.show(param);
				ro.getOperation(method).send(param);
			}else{
				ro.getOperation(method).send();
			}
//			//	        this.sendNotification(
		}
		private function sendFaultResult(evt:FaultEvent):void{
			CursorManager.getInstance().removeCursor(l);
			CursorManager.getInstance().removeBusyCursor();
			Alert.show("请求连接失败："+evt.message);
			ro.disconnect();
		}
		private function sendResult(evt:ResultEvent):void{
			CursorManager.getInstance().removeCursor(l);
			CursorManager.getInstance().removeBusyCursor();
			//				Alert.show(evt.result.toString());
			//				trace("json decoder:"+JSON.decode(evt.result.toString()));
			var m:Message=getMessage(evt.result);
			//				Alert.show(m.messageBody);
			//				if(m.messageSucess!=3)
			//					m.otherInfo=obj;
			this.sendNotification(returntype,m);
			ro.disconnect();
			ro.logout();
		}
		private  function getMessage(message:Object):Message{
			var arr:Array=ArrayUtil.toArray(message) ;
			var m:Message=null;
			if(arr.length==3){
				m=new Message(arr[0],arr[1],arr[2]);
			}else{
				m=new Message(arr[0],arr[1],arr[2],arr[3]);
			}
			return m;
		}
//		public function modify(info:Object):void{
//			
//			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
//			MinnUtil.send(this,SERVICE_NAME,"update",AdvertiseEvent.ADVERTIESE_MODIFY_RESULT,info);
//		}
//		
//		public function del(info:Object):void{
//			//					Alert.show('OperatorProxy del');	
//			//			Alert.show(operator.opr_name_en);
//			MinnUtil.send(this,SERVICE_NAME,"delete",AdvertiseEvent.ADVERTIESE_DEL_RESULT,info);
//			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
//		}
//		
//		public function query(condition:Object):void{
//			MinnUtil.send(this,SERVICE_NAME,"query",AdvertiseEvent.ADVERTIESE_QUERY_RESULT,condition);
//		}
//		public function querySet(condition:Object):void{
//			MinnUtil.send(this,SERVICE_NAME,"query",AdvertiseEvent.ADVERTISE_SET_QUERY_RESULT,condition);
//		}
//		public function getAdvertiseMenu(condition:Object):void{
//			MinnUtil.send(this,SERVICE_NAME,"getAdvertiseMenu",AdvertiseEvent.ADVERTISE_SET_MENU_QUERY_RESULT,condition);
//		}
//		public function generatorAdvertiseMenu(info:Object):void{
//			MinnUtil.send(this,SERVICE_NAME,"generatorAdvertiseMenu",AdvertiseEvent.GENERATOR_ADVERTISE_MENU_RESULT,info);
//		}
	}
}