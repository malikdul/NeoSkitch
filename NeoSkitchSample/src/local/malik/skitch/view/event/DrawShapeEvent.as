/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.event
{

	public class DrawShapeEvent extends AppViewEvent
	{
		public var shapeName:String = "";
		
		public var shapeX:Number = 0;
		public var shapeY:Number = 0;

		public var shapeHeight:Number = 0;
		public var shapeWidth:Number = 0;
		
		public static var DRAW_SHAPE:String = "DrawShape";
		
		public function DrawShapeEvent(type:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			if(type == "")
			{
				type = DRAW_SHAPE;
			}
			super(type, bubbles, cancelable);
		}
		
	}
}