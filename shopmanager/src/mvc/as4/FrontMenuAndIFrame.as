// ActionScript file
/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
import flash.net.LocalConnection;

import flexmdi.controls.tabBarClasses.SuperTab;
import flexmdi.events.PopUpButtonEvent;
import flexmdi.events.SuperTabEvent;
import minn.common.IFrame;

import mvc.model.user.vo.User;
import mvc.view.front.user.component.UserForm;

import mx.collections.ArrayCollection;
import mx.containers.ViewStack;
import mx.events.CloseEvent;
import mx.events.DividerEvent;
import mx.events.ListEvent;
import mx.events.MenuEvent;
import mx.managers.PopUpManager;
import com.adobe.ac.mxeffects.Flip;
import mx.events.EffectEvent;
private var iframes:ArrayCollection=new ArrayCollection();
/*
点击左边菜单导航栏事，切换图标和缩放菜单
*/
protected function image_clickHandler(event:MouseEvent):void
{
	var imgsource:String=event.currentTarget.source;
	switch(imgsource){
		case './assets/img/application_side_contract.png':event.currentTarget.source="./assets/img/application_side_expand.png";
			menuTree.minWidth=50;
			menuTree.percentWidth=100;
			menuTree.percentHeight=100;
			sp.percentWidth=100;
//			order.percentWidth=100;
			menushow.width=150;
			menushow.minWidth=150;
			login.visible=true;
			queryPro.visible=true;
			//					   this.horizontalGap=0;
			//						hg.percentWidth=100;
			break;
		case './assets/img/application_side_expand.png':event.currentTarget.source="./assets/img/application_side_contract.png";
			
			menuTree.width=0;
			menuTree.height=0;
			menuTree.minWidth=0;
			sp.width=0;
//			order.width=0;
			menushow.percentWidth=100;
			menushow.width=15;
		    queryPro.visible=false;
			login.visible=false;
			
			//						menushow.width=0;
			break;
		default:
			Alert.show("没有找到匹配的图片！");
	}
	
}
/*
拖动中间分隔条时重新设置菜单树的百分比
*/
protected function hdividedbox_dividerDragHandler(event:DividerEvent):void{
	imgae.source="./assets/img/application_side_expand.png";
	menuTree.percentWidth=100;
	menuTree.percentHeight=100;
	sp.percentWidth=100;
}

protected function tree_ClickHandler(evt:ListEvent):void{
	var obj:Object=evt.target.selectedItem;
	var ifr:IFrame=checkIframe(obj.url);
//	trace("tree_ClickHandler:"+ifr);
	if(ifr==null){
		if(obj.data){
			ifr=new IFrame();
			ifr.label=obj.label+"    ";
			ifr.source=obj.url;
			ifr.setStyle("backgroundColor","#FBFFFF");
			sup.addChild(ifr);
			sup.selectedChild=ifr;
			ifr.bring2Front();
			iframes.addItem({url:obj.url,uuid:ifr.uuid,obj:ifr});
		}
	}else{
		sup.selectedChild=ifr;
		ifr.bring2Front();
	}
//	ifr.bring2Front();
	
}

private function checkIframe(url:String):IFrame{
	var ifr:IFrame=null;
	for(var i:int=0;i<iframes.length;i++){
		if(iframes.getItemAt(i).url==url)
		{
			ifr=iframes.getItemAt(i).obj as IFrame;
			break;
		}
	}
	return ifr;
}

//flexmdi 
public function supTng():void{
	//sup.setClosePolicyForTab(0,SuperTab.CLOSE_NEVER);
}


public function setLayer(layer:int=15):void{
	if(sup.selectedChild is IFrame){
	var ifr:IFrame=sup.selectedChild as IFrame;
	ifr.setLayer(layer);
	}
}

//上一个版本
protected function sup_tabChildrenChangeHandler(event:Event):void
{
	// TODO Auto-generated method stub
//	if(SuperTabNavigator(event.currentTarget).selectedChild is IFrame){
//	var ifr:IFrame=SuperTabNavigator(event.currentTarget).selectedChild as IFrame;
//	  ifr.bring2Front();
//	}else{
//		ExternalInterface.call("bringAllOther2End");
//	}
	
	if(ViewStack(event.currentTarget).selectedChild is IFrame){
//		var ifr:IFrame=ViewStack(event.currentTarget).selectedChild as IFrame;
//		ifr.bring2Front();
	}else{
		ExternalInterface.call("bringAllOther2End");
	}
}

private function filp2QueryPro():void{
//	menuTree.setStyle("borderVisible",false);
	var e:Flip = new Flip( menuTree );
	e.siblings = [ queryPro ];
	e.direction = DistortionConstants.RIGHT;
	e.duration = 1000;
	e.addEventListener( EffectEvent.EFFECT_END, onEndMenuTreeEffect );
	e.play();
}
private function onEndMenuTreeEffect( event : EffectEvent ) : void
{
	menushow.removeChild( menuTree );
	menushow.addChild( queryPro );
}
private function flip2MenuTree() : void
{
	var e : Flip = new Flip( queryPro );
	e.siblings = [ menuTree ];
	e.direction = DistortionConstants.LEFT;
	e.duration = 1000;
	e.addEventListener( EffectEvent.EFFECT_END, onEndQueryProEffect );
	e.play();
}
private function onEndQueryProEffect( event : EffectEvent ) : void
{
	menushow.removeChild( queryPro );
	menushow.addChild( menuTree );
//	menuTree.setStyle("borderVisible",true);
}
protected function menubar_itemClickHandler(event:MenuEvent):void
{
	
	
}

private var flag:Boolean=false;
protected function sp_clickHandler(event:MouseEvent):void
{
	// TODO Auto-generated method stub
	if(flag){
		flip2MenuTree();
		sp.label="意见与建议";
		flag=false;
	}else{
		filp2QueryPro();
		sp.label="返回";
		flag=true;
	}
	
}

//上一个版本
protected function sup_tabCloseHandler(event:SuperTabEvent):void
{
//	if(SuperTabNavigator(event.target).selectedChild is IFrame){
//		var ifr:IFrame=SuperTabNavigator(event.target).selectedChild as IFrame;
//		removeIframe(ifr.uuid);
//	}else{
//		
//	}
	
}
private function removeIframe(uuid:String):void{
	var ifr:IFrame=null;
	for(var i:int=0;i<iframes.length;i++){
		var item:Object=iframes.getItemAt(i);
		
		if(item.uuid==uuid)
		{
			iframes.removeItemAt(i);
			ifr=item.obj as IFrame;
			item.obj=null;
			item.url=null;
			item.uuid=null;
			item=null;
			ifr.removeIFrame();
			ifr=null;
			try{
			var lc1:LocalConnection = new LocalConnection();
			var lc2:LocalConnection = new LocalConnection();
			lc1.connect( "gcConnection" );
			lc2.connect( "gcConnection" );
			}catch(e:Error){
				
			}
			break;
		}
	}
}

public function filp2Loe():void{
	//	menuTree.setStyle("borderVisible",false);
	loe.width=70;
	var e:Flip = new Flip( loginregister );
	e.siblings = [ loe ];
	e.direction = DistortionConstants.TOP;
	e.duration = 1000;
	e.addEventListener( EffectEvent.EFFECT_END, onEndLoginEffect );
	e.play();
}
private function onEndLoginEffect( event : EffectEvent ) : void
{
	menushow.removeChild( loginregister );
//	menushow.addElementAt(loe ,1));
	menushow.addChildAt(loe ,1);
}
private function flip2Login(evt:MouseEvent) : void
{
	user=null;
	loe.width=70;
	var e : Flip = new Flip( loe );
	e.siblings = [ loginregister ];
	e.direction = DistortionConstants.LEFT;
	e.duration = 1000;
	e.addEventListener( EffectEvent.EFFECT_END, onEndLoeEffect );
	e.play();
}
private function onEndLoeEffect( event : EffectEvent ) : void
{
	
	menushow.removeChild( loe );
	menushow.addChildAt( loginregister,1);
	//	menuTree.setStyle("borderVisible",true);
}
private function registerSkin():void{
	new TitleWindowSkinClass();
	new ButtonSkinClass();
}