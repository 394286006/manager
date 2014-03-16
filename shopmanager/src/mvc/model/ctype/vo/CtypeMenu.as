/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.ctype.vo
{
	[RemoteClass(alias="ctype.Ctype")]   
	[Bindable] 
	public class CtypeMenu
	{
		public var id:String='';
		public var name:String='';
		public var category:String='';
		public var pid:String='';
		public var descript:String='';
		public var children:Object;
		public function CtypeMenu()
		{
		}
	}
}