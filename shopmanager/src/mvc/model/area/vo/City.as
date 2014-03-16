/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.area.vo
{
	[RemoteClass(alias="area.City")]   
	[Bindable]   
	public class City
	{
		public var _sid:String='';
		public var id:String='';
		public var name:String='';
		public var nid:String='';
		public var p_id:String='';
		public var flag:String='';
		public var creator:String='';
		public var createDate:String='';
		public var _creatorName:String='';
		public var _color:String='';
		public var _towns:Object;
		
		
		public function City()
		{
		}
	}
}