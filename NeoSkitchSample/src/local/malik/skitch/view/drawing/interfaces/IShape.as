package local.malik.skitch.view.drawing.interfaces
{
	public interface IShape
	{
		function get width():Number;
		function set width(value:Number):void;
		
		function get height():Number;
		function set height(value:Number):void;
		
		function get x():Number;
		function set x(value:Number):void;
		
		function get y():Number;
		function set y(value:Number):void;
		
		function get fillColor():uint;
		function set fillColor(value:uint):void;
		
		function get fillAlpha():Number;
		function set fillAlpha(value:Number):void
		
		function ToXML(tagText:String = null):XML;
		function FromXML(value:XML):void;
	}
}