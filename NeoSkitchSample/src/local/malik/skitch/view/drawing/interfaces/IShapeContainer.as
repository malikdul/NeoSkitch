package local.malik.skitch.view.drawing.interfaces
{
	import flash.geom.Point;
	
	import mx.core.IVisualElement;
	import mx.core.IVisualElementContainer;
	
	/**
	 * 
	 * @author malikdul@gmail.com
	 * 
	 */	
	public interface IShapeContainer extends IVisualElement, IVisualElementContainer
	{
		function localToGlobal(point:Point):Point;
		function globalToLocal(point:Point):Point;
	}
}