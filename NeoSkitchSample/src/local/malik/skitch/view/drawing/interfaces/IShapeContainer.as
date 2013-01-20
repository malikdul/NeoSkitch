/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
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