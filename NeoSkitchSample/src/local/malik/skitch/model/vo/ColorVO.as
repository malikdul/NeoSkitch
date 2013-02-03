/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.model.vo
{
	public class ColorVO
	{
		//----------------------------------
		//  color
		//----------------------------------
		
		private var _color:uint = 0x000000;
		
		[Bindable]
		
		/**
		 * A color value. 
		 * The default value is 0x000000.
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
		
		//----------------------------------
		//  alpha
		//----------------------------------
		
		private var _alpha:Number = 1.0;
		
		[Bindable]
		
		/**
		 * A alpha value. 
		 * Valid values are 0 (fully transparent) to 1 (fully opaque). 
		 * The default value is 1.  
		 *  
		 */
		public function get alpha():Number
		{
			return _alpha;
		}
		
		public function set alpha(value:Number):void
		{
			if( value < 0 )
				value = 0;
			else if( value > 1 )
				value = 1;
				
			_alpha = value;
		}
		
		
		public function ColorVO(color:uint, alpha:Number)
		{
			this.color = color;
			this.alpha = alpha;
		}
		
		public function toString():String
		{
			return "ColorVO{color:" + color + ", alpha:" + alpha + "}";
		}
	}
}