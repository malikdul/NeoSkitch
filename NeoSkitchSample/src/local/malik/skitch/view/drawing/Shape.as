package local.malik.skitch.view.drawing
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import mx.core.UIComponent;
	
	/**
	 * 
	 * @author malikdul@gmail.com
	 * 
	 * The Shape class is the base class for all Design Objects,
	 * including but not limited to basic shapes, text, Image, etc.
	 * 
	 */	
	[Bindable]
	public class Shape extends UIComponent
	{
		private var _shapeHeight:Number;
		private var _shapeWidth:Number;
		private var _shapeX:Number;
		private var _shapeY:Number;
		
		private var _borderWeight:Number	= 1;
		private var _borderColor:Number		= 0x000000;
		private var _borderAlpha:Number		= 1;
		
		public function Shape()
		{
			super();
			
			shapeX 				= 0;
			shapeY 				= 0;
			shapeHeight 		= NaN;
			shapeWidth 			= NaN;
			borderWeight		= 1;
			borderColor			= 0x000000;
			borderAlpha			= 1;
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		/**
		 * 
		 * The stroke weight for the border.
		 * 
		 */		
		public function get borderWeight():Number
		{
			return _borderWeight;
		}

		public function set borderWeight(value:Number):void
		{
			_borderWeight = value;
		}

		/**
		 * 
		 * Color of the border. 
		 * 
		 */		
		public function get borderColor():Number
		{
			return _borderColor;
		}

		public function set borderColor(value:Number):void
		{
			_borderColor = value;
		}

		/**
		 * 
		 * Indicates the alpha transparency value of the line in drawing context. 
		 * Valid values are 0 (fully transparent) to 1 (fully opaque). 
		 * The default value is 1.  
		 * 
		 */		
		public function get borderAlpha():Number
		{
			return _borderAlpha;
		}

		public function set borderAlpha(value:Number):void
		{
			_borderAlpha = value;
		}

		/**
		 * Indicates the y coordinate of the start point where drawing hapens, in pixels. 
		 * 
		 */	
		public function get shapeY():Number
		{
			return _shapeY;
		}

		public function set shapeY(value:Number):void
		{
			_shapeY = value;
		}

		/**
		 * Indicates the x coordinate of the start point where drawing hapens, in pixels. 
		 * 
		 */		
		public function get shapeX():Number
		{
			return _shapeX;
		}

		public function set shapeX(value:Number):void
		{
			_shapeX = value;
		}

		/**
		 * 
		 * Number that specifies the width of the actual drawing area.
		 * 
		 */		
		public function get shapeWidth():Number
		{
			return _shapeWidth;
		}

		public function set shapeWidth(value:Number):void
		{
			_shapeWidth = value;
		}

		/**
		 * 
		 * Number that specifies the height of the actual drawing area.
		 * 
		 */	
		public function get shapeHeight():Number
		{
			return _shapeHeight;
		}

		public function set shapeHeight(value:Number):void
		{
			_shapeHeight = value;
		}

		/**
		 * 
		 * handler function is called when shape is added to stage
		 * 
		 */	
		protected function addedToStageHandler(event:Event):void
		{
			//child classes will implement
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align 	= StageAlign.TOP_LEFT;
			
		}
		
		/**
		 * 
		 * Actual function that draws shape using graphics object.
		 * 
		 */	
		protected function Draw():void
		{
			//child classes will implement drawing logic
			
			this.graphics.clear();
		}
	}
}