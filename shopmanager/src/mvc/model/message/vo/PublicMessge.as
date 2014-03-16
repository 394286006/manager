/**
 * @author minn
 * @QQ 394286006
 * @email freemanfreelift@gmail.com
 */
package mvc.model.message.vo
{
	[RemoteClass(alias="message.PublicMessage")]   
	[Bindable]   
	public class PublicMessge
	{
		public var _sid:String='';
		public var id:String='';
		public var title:String='';
		public var content:String='';
		public var creator:String='';
		public var createDate:String='';
		public var modifyDate:String='';
		public var _creatorName:String='';
		public var _color:String='';
		public function PublicMessge()
		{
		}
	}
}