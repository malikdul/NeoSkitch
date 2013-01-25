/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/

package local.malik.skitch.view.components
{
	import spark.components.Button;
	
	public class ColorButton extends Button
	{
		//----------------------------------
		//  color
		//----------------------------------
		
		private var _color:uint = 0x000000;
		
		[Bindable]
		[Inspectable(category="General", format="Color")]
		
		/**
		 *  A color value. 
		 *  
		 */
		public function get color():uint
		{
			return _color;
		}
		
		public function set color(value:uint):void
		{
			_color = value;
		}
		
		public function ColorButton()
		{
			super();
		}
	}
}