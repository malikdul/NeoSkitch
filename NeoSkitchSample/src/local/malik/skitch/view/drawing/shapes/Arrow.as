/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.shapes
{
	import flash.display.CapsStyle;
	import flash.display.Graphics;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	import local.malik.skitch.view.drawing.Shape;

	/**
	 * 
	 * @author malikdul@gmail.com
	 * 
	 */	
	public class Arrow extends Shape
	{
		
		public function Arrow()
		{
			super();
			
			borderAlpha = 1.0;
			borderWeight = 5;
			borderColor = Math.random() * 0xffffff;
			
		}
		
		override protected function Draw():void
		{
			borderColor = Math.random() * 0xffffff;
			
			var g:Graphics = this.graphics;
			g.beginFill(0x0, 0.0);
			g.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			g.endFill();
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		protected function mouseDownHandler(event:MouseEvent):void
		{
			this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			
			// mark start point
			shapeX = event.localX;
			shapeY = event.localY;
			
			// start rendering
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			// listen for mouse up / out to end arrow
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseUpHandler);
		}
		
		protected function enterFrameHandler(event:Event):void
		{
			var angle:Number = polarAngle(new Point(mouseX, mouseY), new Point(shapeX, shapeY));
			
			// draw line
			var g:Graphics = this.graphics;
			g.clear();
			
			// give alpha for interaction
			g.beginFill(0x0, 0.0);
			g.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			g.endFill();
			
			g.lineStyle(borderWeight, borderColor, 1, true, LineScaleMode.NORMAL, CapsStyle.SQUARE, JointStyle.MITER);
			g.moveTo(shapeX, shapeY);
			g.lineTo(mouseX, mouseY);
			
			// draw arrow head
			g.moveTo(mouseX - (20 * Math.cos((angle - 45) * Math.PI / 180)),
				mouseY - (20 * Math.sin((angle - 45) * Math.PI / 180)));
			
			g.lineTo(mouseX + (5 * Math.cos((angle) * Math.PI / 180)),
				mouseY + (5 * Math.sin((angle) * Math.PI / 180)));
			
			g.lineTo(mouseX - (20 * Math.cos((angle + 45) * Math.PI / 180)),
				mouseY - (20 * Math.sin((angle + 45) * Math.PI / 180)));
		}
		
		protected function polarAngle(point:Point, center:Point=null):Number
		{
			if (!center)
				center = new Point(0, 0);
			
			return Math.atan2(point.y - center.y, point.x - center.x) * 180 / Math.PI;
		}
		
		protected function mouseUpHandler(event:MouseEvent):void
		{
			this.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			this.removeEventListener(MouseEvent.MOUSE_OUT, mouseUpHandler);
			
			// stop rendering
			this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
	}
}