package local.malik.skitch.view.drawing.interfaces
{
	public interface IShape
	{
		function ToXML(tagText:String = null):XML;
		function FromXML(value:XML):void;
	}
}