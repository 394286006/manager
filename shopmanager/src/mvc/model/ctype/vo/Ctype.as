/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.ctype.vo
{
	[RemoteClass(alias="ctype.Ctype")]   
	[Bindable]   
	public  class Ctype
	{
		public var _sid:String='';
		public var id:String='';
		public var name:String='';
		public var category:String='0';
		public var descript:String='';
		public var pid:String='';
		public var creator:String='';
		public var createDate:String='';
		public var _creatorName:String='';
		public var _categoryName:String='';
		public var _parentName:String='';
		public var _color:String='';
		
		public function Ctype()
		{
		}
		
		public function toString():String{
			return "CategoryVo";
		}
	}
}