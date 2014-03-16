/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.operator.vo
{
	[RemoteClass(alias="operator.Operator")]   
	[Bindable]   
	public class Operator 
	{
		public var _sid:String='';
		public var id:String='';
		public var opr_name_en:String='';
		public var opr_name_ch:String='';
		public var password:String='';
		public var email:String='';
		public var qq_msn:String='';
		public var office_phone:String='';
		public var person_phone:String='';
		public var address:String='';
		public var creator:String='';
		public var createDate:String='';
		public var _creatorName:String='';
		public var _color:String='';
		
		public function Operator()
		{
		}
		
		public function toString():String{
			return super.toString();
		}
	}
}