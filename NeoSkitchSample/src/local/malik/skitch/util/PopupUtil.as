/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.util
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import local.malik.skitch.view.components.PopupGroup;

	public class PopupUtil
	{
		private static var curruntpop:PopupGroup;
		
		public static function createPopup(Type:Class, event:MouseEvent, parentContainer:DisplayObject, eventProperty:String = "target"):PopupGroup
		{
			var toggleView:Boolean = null != curruntpop && curruntpop.isPopUp && curruntpop is Type ;
			
			removeOpenPopup();
			
			if(toggleView )
			{
				return curruntpop;
			}
			
			curruntpop = new Type();
			curruntpop.ShowPopup( parentContainer );
			
			var pt:Point = event[eventProperty].parent.localToGlobal(new Point(event[eventProperty].x, event[eventProperty].y));
			curruntpop.move( pt.x + 40 , pt.y - ( event[eventProperty].height / 2  ) + 10);
			
			return curruntpop;
		}
		
		public static function removeOpenPopup():void
		{
			if( curruntpop )
			{
				curruntpop.removePopup();
				curruntpop = null;
			}
			
		}
	}
}