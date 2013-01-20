package local.malik.skitch.view.drawing
{
	import flash.display.Graphics;
	import flash.events.Event;
	
	import mx.events.PropertyChangeEvent;
	import mx.events.ResizeEvent;

	/**
	 * 
	 * @author malikdul@gmail.com
	 * 
	 */	
	public class ShapeProxy extends Shape
	{
		public function ShapeProxy()
		{
			super();
			
			this.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onPropertyChange);
			this.addEventListener(ResizeEvent.RESIZE,onPropertyChange);
		}
		
		override protected function Draw():void
		{
			super.Draw();
			
			this.graphics.beginFill(0x0000BB, 0.07);
			this.graphics.lineStyle(1, 0x3123cc, 1);
			this.graphics.drawRect(0, 0, this.width, this.height);
			
			this.graphics.endFill();
		}
		
		protected function onPropertyChange(event:Event):void
		{
			this.Draw()
		}
	}
}