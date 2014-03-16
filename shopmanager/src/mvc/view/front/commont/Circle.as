/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.view.front.commont
{
	import mx.core.UIComponent;
	
	public class Circle extends UIComponent
	{
		public function Circle()
		{
			super();
		}
		
		public function drawCircle(x:Number,y:Number,r:Number,color:uint=0x000000,thiness:Number=2):void{
			graphics.lineStyle(thiness,color);
			graphics.drawCircle(x,y,r);
		}
	}
}