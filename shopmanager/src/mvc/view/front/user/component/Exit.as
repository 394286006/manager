/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.front.user.component
{

	
	import mx.containers.HBox;
	import mx.controls.Label;
	import mx.controls.Spacer;
	
	public class Exit extends HBox
	{
		public function Exit()
		{
			super();
		}
	override  protected function createChildren():void
	{
		
		super.createChildren();
		var sp:Spacer=new Spacer();
		sp.percentWidth=50;
		this.addChild(sp);
		var la:Label=new Label();
		la.setStyle("paddingTop",8);
		la.text="用户退出";
		this.addChild(la);
		sp=new Spacer();
		sp.percentWidth=50;
		this.addChild(sp);
	}
		
	}
}