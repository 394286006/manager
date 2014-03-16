/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.merchandise
{
	import minn.util.MinnUtil;
	
	import mvc.view.manager.merchandise.event.MerchandiseEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class MerchandiseProxy extends Proxy implements IProxy
	{
		public static const  NAME:String="MERCHANDISE_PROXY";
		private static const SERVICE_NAME:String="merchandise.MerchandiseService";
		private static const CTYPEE_SERVICE_NAME:String="ctype.CtypeService";
		private static const PHOTO_SERVICE_NAME:String="photo.PhotoService";
		public function MerchandiseProxy()
		{
			super(NAME, new Object());
		}
		public function add(info:Object):void{
			//		Alert.show('OperatorProxy add');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"add",MerchandiseEvent.MERCHANDISE_ADD_RESULT,info);
			//	        this.sendNotification(
		}
		public function modify(info:Object):void{
			
			//			this.sendNotification(OperatorEvent.OPERATOR_MODIFY_RESULT,operator);
			MinnUtil.send(this,SERVICE_NAME,"update",MerchandiseEvent.MERCHANDISE_MODIFY_RESULT,info);
		}
		
		public function del(info:Object):void{
			//					Alert.show('OperatorProxy del');	
			//			Alert.show(operator.opr_name_en);
			MinnUtil.send(this,SERVICE_NAME,"delete",MerchandiseEvent.MERCHANDISE_DEL_RESULT,info);
			//			this.sendNotification(OperatorEvent.OPERATOR_DEL_RESULT,"删除成功");
		}
		
		public function query(condition:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"query",MerchandiseEvent.MERCHANDISE_QUERY_RESULT,condition);
		}
		public function addCtype(info:Object):void{
//			MinnUtil.send(this,CTYPEE_SERVICE_NAME,"add",MerchandiseEvent.CTYPE_MERCHANDISE_ADD_RESULT,info);
		}
		public function delCtype(info:Object):void{
			MinnUtil.send(this,CTYPEE_SERVICE_NAME,"delete",MerchandiseEvent.CTYPE_TREE_MERCHANDISE_DELETE_RESULT,info);
		}
		public function queryCtypeTree(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"queryCtypeTree",MerchandiseEvent.CTYPE_TREE_MERCHANDISE_QUERY_RESULT,info);
		}
		public function addPhoto(info:Object):void{
			MinnUtil.send(this,PHOTO_SERVICE_NAME,"add",MerchandiseEvent.PHOTO_MERCHANDISE_ADD_RESULT,info);
		}
		public function modifyPhoto(info:Object):void{
			MinnUtil.send(this,PHOTO_SERVICE_NAME,"update",MerchandiseEvent.PHOTO_MERCHANDISE_MODIFY_RESULT,info);
		}
		public function delPhoto(info:Object):void{
			MinnUtil.send(this,PHOTO_SERVICE_NAME,"delete",MerchandiseEvent.PHOTO_MERCHANDISE_DELETE_RESULT,info);
		}
		public function generatorMenu(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"generatorJsonMenu",MerchandiseEvent.CTYPE_MERCHANDISE_GENERATORMENU_RESULT,info);
		}
		
		public function getFirstPageSet(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"getFirstPageSet",MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_QUERY_RESULT,info);
		}
		
		
		public function firstPageSet(info:Object):void{
			MinnUtil.send(this,SERVICE_NAME,"firstPageSet",MerchandiseEvent.PHOTO_MERCHANDISE_FIRSTPAGESET_RESULT,info);
		}
	}
}