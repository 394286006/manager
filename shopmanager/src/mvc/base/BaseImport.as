// ActionScript file
/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
include "../base/BaseObjectImport.as"; 
import com.event.DateSelectEvent;

import flexmdi.containers.MDIWindow;

import minn.event.MinnMessageEvent;
import minn.event.MinnMessageEventManager;
import minn.event.PageEvent;
import minn.proxy.WindowProxy;
import minn.util.MinnUtil;

import mvc.ApplicationFacade;
import mvc.view.manager.AppCommand;
import mvc.view.manager.operator.event.OperatorEvent;
import mvc.model.advertise.vo.Advertise;
import mvc.view.manager.advertise.event.AdvertiseEvent;
import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.events.CloseEvent;
import mx.events.FlexEvent;
import mx.events.MenuEvent;
import mvc.view.manager.message.event.PublicMessageEvent;
import mvc.view.manager.domain.event.DomainEvent;
import spark.components.TitleWindow;
import minn.common.Entrypt;
private var ds:DateSelectEvent;
private var _ds1:MinnMessageEvent;
private var appFacade:ApplicationFacade= ApplicationFacade.getInstance();
