/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.area.vo
{
	[RemoteClass(alias="area.Province")]   
	[Bindable]   
	public class Province
	{
		public var _sid:String='';
		public var id:String='';
		public var name:String='';
		public var nid:String='';
		public var creator:String='';
		public var createDate:String='';
		public var _creatorName:String='';
		public var _color:String='';
		public var _citys:Object;
		public function Province()
		{
		}
		
	}
}