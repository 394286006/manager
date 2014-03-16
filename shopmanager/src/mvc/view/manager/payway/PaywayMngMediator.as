/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.manager.payway
{
	import com.adobe.serialization.json.JSON;
	
	import minn.message.Message;
	import minn.util.MinnUtil;
	
	import mvc.model.payway.vo.Payway;
	import mvc.view.manager.payway.event.PaywayEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class PaywayMngMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "PaywayMngMediator";
		public function PaywayMngMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			registerEvent();
		}
		public function get userPanel():Object{
			return viewComponent;
		}
		public function set userPanel(viewComponent:Object):void{
			this.setViewComponent(viewComponent);
			registerEvent();
		}
		private function registerEvent():void{
			viewComponent.addEventListener(PaywayEvent.PAYWAY_QUERY,onInvoke);
			viewComponent.addEventListener(PaywayEvent.PAYWAY_DEL,onInvoke);
			
		}
		private function onInvoke(evt:PaywayEvent):void{
			sendNotification(evt.type,evt.data);
		}
		override public function listNotificationInterests():Array{
			return[PaywayEvent.PAYWAY_QUERY,
				PaywayEvent.PAYWAY_QUERY_RESULT,
				PaywayEvent.PAYWAY_DEL,
				PaywayEvent.PAYWAY_DEL_RESULT
			];
		}
		override public function handleNotification(notfi:INotification):void{
			
			var message:Message=null;
			switch(notfi.getName()){
				case PaywayEvent.PAYWAY_QUERY_RESULT:
					message=notfi.getBody() as Message;
					var arr:Array=JSON.decode(message.messageBody);
					//										Alert.show(message.otherInfo.toString());
					var ac:ArrayCollection=new ArrayCollection();
					for(var i:int=0;i<arr.length;i++){
						var v:Payway=new Payway();
						ac.addItem(v);
					}
					MinnUtil.copyProperty(ac,arr);
					
					userPanel.invokeQuery(ac,message.otherInfo);
					break;
				case PaywayEvent.PAYWAY_DEL_RESULT:
					message=notfi.getBody() as Message;
					
					if(message.messageSucess==0){
						Alert.show(message.messageBody,"提示");
					}else if(message.messageSucess==1){
						Alert.show(message.messageBody,"提示");
						userPanel.invokeDel();
					}else
					{
						Alert.show("不可预知的异常，请与管理员联系","提示");
					}
					break;
			}
		}
	}
}