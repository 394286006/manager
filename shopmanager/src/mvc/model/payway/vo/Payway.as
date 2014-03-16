/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.payway.vo
{
	[RemoteClass(alias="payway.Payway")]   
	[Bindable]   
	public class Payway
	{
		public var _sid:String='';
		public var id:String='';
		public var name:String='';
		public var descript:String='';
		public var paynum:Number=0;
		public var creator:String='';
		public var createDate:String='';
		public var _creatorName:String='';
		public var account:String='';
		public var _color:String='';
		
		public function Payway()
		{
		}
	}
}