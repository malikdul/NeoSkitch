/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.shapes
{
	import flash.events.Event;
	
	import local.malik.skitch.util.xml.XmlConstants;
	import local.malik.skitch.view.drawing.Shape;
	
	import mx.states.OverrideBase;

	public class Rectangle extends Shape
	{
		private var isRounded:Boolean			= false;
		private var _cornerRadius:Number		= 0;
		
		public function Rectangle()
		{
			super();
		}

		public function get cornerRadius():Number
		{
			return _cornerRadius;
		}

		public function set cornerRadius(value:Number):void
		{
			_cornerRadius = value;
		}
		
		protected override function Draw():void
		{
			super.Draw();
			this.graphics.beginFill(fillColor, fillAlpha);
			this.graphics.lineStyle(borderWeight, borderColor, borderAlpha);
			if(isRounded)
			{
				if(this.width < 0 && this.height < 0)
				{
					this.width *= -1;
					this.height *= -1;
				}
				this.graphics.drawRoundRect(0, 0, this.width, this.height, cornerRadius);
			}
			else
			{
				this.graphics.drawRect(0, 0, this.width, this.height);
			}
			this.graphics.endFill();
			//trace("Rectangle shape...\n")
		}
		
		override public function FromXML(x:XML):void
		{
			super.FromXML( x );
			this._cornerRadius	= x.@[XmlConstants.CORNER_RADIUS];
		}
		
		override public function ToXML(tagName:String = ""):XML
		{
			var x:XML = super.ToXML( className );
			x.@[XmlConstants.CORNER_RADIUS] 	= this._cornerRadius;
			
			return x;
		}
	}
}