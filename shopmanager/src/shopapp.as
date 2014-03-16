// ActionScript file
/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
//include 'mvc/base/BaseImport.as'
import com.adobe.serialization.json.JSON;

import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.net.URLVariables;
import flash.utils.ByteArray;

import minn.common.Entrypt;
import minn.message.Message;
import minn.util.MinnUtil;

import mvc.model.operator.vo.Operator;

import mx.controls.Alert;
import mx.events.FlexEvent;
import mx.managers.BrowserManager;
import mx.managers.IBrowserManager;
import mx.modules.Module;
import mx.rpc.remoting.RemoteObject;

private var _mm:Module;
public var KEY:String='';
public var PRIVATEKEY:String='';
public var operator:Operator=null;
private var bm:IBrowserManager;
protected function application1_creationCompleteHandler(event:FlexEvent):void
{
	Alert.okLabel="确定";
	var o:RemoteObject=new RemoteObject();
	o.destination="amf";
	o.getOperation("").send();
	bm=BrowserManager.getInstance();
	bm.init(); 
		
	if(Config.SUBFFIX==".jpg"){
		if(bm.url==null||bm.url.indexOf("minwwls.com")<0)
		{
			
			for(;;){
				Alert.show("非法操作");
			}
		}
	}
	
	Alert.show('hello');
	var urlLoader:URLLoader=new URLLoader();
	urlLoader.dataFormat=URLLoaderDataFormat.BINARY;
	urlLoader.addEventListener(Event.COMPLETE,loadUserPrivateCompleteHandler);
	urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS,httpStatusEvent);
	urlLoader.addEventListener(IOErrorEvent.IO_ERROR,ioerrorEvent);
	urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityError);
	var request:URLRequest=new URLRequest(Config.PRIVATE_KEY_LOADER);
	urlLoader.load(request);
}
private function loadUserPrivateCompleteHandler(evt:Event=null):void{
	PRIVATEKEY=evt.target.data;
	Alert.show(PRIVATEKEY);
	var urlLoader:URLLoader=new URLLoader();
	var variables:URLVariables = new URLVariables();
	variables.method ="encrypt";
	variables.skey=PRIVATEKEY;
	
	urlLoader.dataFormat=URLLoaderDataFormat.BINARY;
	urlLoader.addEventListener(Event.COMPLETE,loadKeyCompleteHandler);
	urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS,httpStatusEvent);
	urlLoader.addEventListener(IOErrorEvent.IO_ERROR,ioerrorEvent);
	urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityError);
	var request:URLRequest=new URLRequest(Config.KEY_LOADER);
	request.data=variables;
	request.method="post";
	urlLoader.load(request);
}
private  function httpStatusEvent(evt:HTTPStatusEvent):void{
//				Alert.show(evt.type,"HTTPStatusEvent");
}
private function securityError(evt:SecurityErrorEvent):void{
	Alert.show(evt.type,"SecurityErrorEvent");
}

private  function ioerrorEvent(evt:IOErrorEvent):void{
	Alert.show(evt.type,"IOErrorEvent");
}
private function loadKeyCompleteHandler(evt:Event):void{
	var message:Message=MinnUtil.getMessage(JSON.decode(decodeURIComponent(evt.target.data)));
//	var message:Message=MinnUtil.getMessage(evt.target.data);
	if(message.messageSucess==0){
		
		Alert.show(message.messageBody,"警告");
	}else{
		KEY=message.messageBody;
//		Entrypt.loadswfObject("shopMainApp.swf",loadswfCompleteHandler);
		Entrypt.loadswfObject(Config.MAIN_APP,loadswfCompleteHandler);
	}
	
	
}


private function loadswfCompleteHandler(evt:Event):void{
	if(Config.SUBFFIX==Config.FLAG){
		mm.loadModule("2011010812342.swf",evt.target.data as ByteArray);
	}else
		mm.loadModule("2011010812342.swf",Entrypt.uncompress(evt.target.data as ByteArray,KEY));
}