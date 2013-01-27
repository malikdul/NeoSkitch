/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.shapes
{
	import flash.geom.Point;
	
	import local.malik.skitch.view.drawing.Shape;
	
	import mx.events.ResizeEvent;

	public class Line extends Shape
	{
		private var m_oStartPoint:Point = new Point(0, 0);
		private var m_oEndPoint:Point ;
		
		public function Line()
		{
			super();
			
			this.addEventListener(ResizeEvent.RESIZE, OnResize);
			
		}
		
		protected override function Draw():void
		{
			super.Draw();
			graphics.moveTo		(m_oStartPoint.x, m_oStartPoint.y);
			graphics.lineStyle	(borderWeight, borderColor, borderAlpha);
			
			if(m_oEndPoint)
			{
				if(width > height) // horizonatal
				{
					if(this.height >1)
						this.height = 1;
					m_oEndPoint.x = width;
					m_oEndPoint.y = m_oStartPoint.y;
				}
				else // vertical line
				{
					if(this.width >1)
						this.width = 1;
					m_oEndPoint.x = m_oStartPoint.x;
					m_oEndPoint.y = height;
				}
				graphics.lineTo	(m_oEndPoint.x, m_oEndPoint.y);
			}
			graphics.endFill();
			
		}
		
		protected function OnResize(event:ResizeEvent):void
		{
			if(m_oEndPoint || m_oEndPoint != new Point(width, height))
			{
				//trace("width, height: ", width, height);
				var p:Point = new Point(width, height);
				m_oEndPoint = p;
			} 
			Draw();
		}
		
		override public function FromXML(x:XML):void
		{
			super.FromXML( x );
		}
		
		override public function ToXML(tagName:String = ""):XML
		{
			var x:XML = super.ToXML( className );
			
			return x;
		}
	}
}