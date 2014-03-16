/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.merchandise.vo
{
	import mvc.model.ctype.vo.Ctype;

	[RemoteClass(alias="merchandise.Merchandise")]   
	[Bindable]   
	public class Merchandise
	{
		
		public var _sid:String='';
		public var id:String='';
		public var name:String='';
		public var descript:String='';
		public var price:String='';
		public var category_id:String='';
		public var creator:String='';
		public var createDate:String='';
		public var pcount:String='';
		public var upTime:String='';
		public var downTime:String='';
		public var weight:String='';
		public var isfirst:String='0';
		public var _creatorName:String='';
		public var _photos:Object;
		public var _discount:Object;
		public var _ctype:Object;
		public var _imgcount:String='';
		public var otherpath:String='';
		
		public var _color:String='';
		
		public function Merchandise()
		{
		}
		
	}
}