/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.factory
{
	import local.malik.skitch.util.Constants;
	import local.malik.skitch.view.drawing.Shape;
	import local.malik.skitch.view.drawing.events.DrawShapeEvent;
	import local.malik.skitch.view.drawing.shapes.Elipse;
	import local.malik.skitch.view.drawing.shapes.Line;
	import local.malik.skitch.view.drawing.shapes.Rectangle;
	import local.malik.skitch.view.drawing.text.Text;
	
	import mx.controls.Alert;

	public class ShapesFactory
	{
		public static function getShape(event:DrawShapeEvent):Shape
		{
			var shape:Shape = null;
			switch(event.shapeName)
			{
				case Constants.PAGE:
					return null; //its a special object not a normal shape, will create later if required.
				case Constants.ELIPSE:
					shape = new Elipse();
					break;
				case Constants.LINE:
					shape = new Line();
					break;
				case Constants.RECTANGLE:
					shape = new Rectangle();
					break;
				case Constants.TEXT:
					shape = new Text();
					break;
				default:
					Alert.show("Requeted feature [ADD " + event.shapeName.toUpperCase() + "] is in progress ...", "Skitch");
					return null;				
			}
			
			shape.x = event.shapeX;
			shape.y = event.shapeY;
			return shape;
		}
	}
}