/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import local.malik.skitch.util.xml.XmlConstants;
	import local.malik.skitch.util.xml.XmlUtils;
	import local.malik.skitch.view.drawing.interfaces.IShape;
	
	import mx.core.UIComponent;
	import mx.events.PropertyChangeEvent;
	import mx.events.ResizeEvent;
	
	/**
	 * 
	 * @author malikdul@gmail.com
	 * 
	 * The Shape class is the base class for all Design Objects,
	 * including but not limited to basic shapes, text, Image, etc.
	 * 
	 */	
	[Bindable]
	public class Shape extends UIComponent implements IShape
	{
		private var _shapeHeight:Number;
		private var _shapeWidth:Number;
		private var _shapeX:Number;
		private var _shapeY:Number;
		
		private var _borderWeight:Number	= 1;
		private var _borderColor:uint		= 0x000000;
		private var _borderAlpha:Number		= 1;

		private var _fillColor:uint			= 0xffffff;
		private var _fillAlpha:Number		= 1;
		
		
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
			addEventListener(ResizeEvent.RESIZE, ResizeHandler);
			addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, PropertyChangeHandler);
			addEventListener(MouseEvent.CLICK, mouseClickHandler);
		}
		
		/**
		 * 
		 * Color of the fill. 
		 * 
		 */	
		public function get fillColor():uint
		{
			return _fillColor;
		}

		public function set fillColor(value:uint):void
		{
			_fillColor = value;
		}

		/**
		 * 
		 * Indicates the alpha transparency value of the fill in drawing context. 
		 * Valid values are 0 (fully transparent) to 1 (fully opaque). 
		 * The default value is 1.  
		 * 
		 */	
		public function get fillAlpha():Number
		{
			return _fillAlpha;
		}

		public function set fillAlpha(value:Number):void
		{
			_fillAlpha = value;
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
		public function get borderColor():uint
		{
			return _borderColor;
		}

		public function set borderColor(value:uint):void
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
			
			Draw();
		}
		
		protected function ResizeHandler(event:ResizeEvent):void
		{
			RefreshDisplay();
		}
		
		protected function mouseClickHandler(event:MouseEvent):void
		{
			event.preventDefault();
			event.stopImmediatePropagation();
		}
		
		protected function PropertyChangeHandler(event:PropertyChangeEvent):void
		{
			RefreshDisplay();
		}
		
		
		public function FromXML(x:XML):void
		{
			this._borderAlpha	= x.@[XmlConstants.BORDER_ALPHA];
			this._borderColor	= x.@[XmlConstants.BORDER_COLOR];
			this._borderWeight	= x.@[XmlConstants.BORDER_WEIGHT];
			this._fillAlpha		= x.@[XmlConstants.FILL_ALPHA];
			this._fillColor		= x.@[XmlConstants.FILL_COLOR];
			this._shapeHeight	= x.@[XmlConstants.SHAPE_HEIGHT];
			this._shapeWidth	= x.@[XmlConstants.SHAPE_WIDTH];
			this._shapeX		= x.@[XmlConstants.SHAPE_X];
			this._shapeY		= x.@[XmlConstants.SHAPE_Y];
			this.height			= x.@[XmlConstants.HEIGHT];
			this.width			= x.@[XmlConstants.WIDTH];
			this.x				= x.@[XmlConstants.X];
			this.y				= x.@[XmlConstants.Y];
		}
		
		public function ToXML(tagName:String = "shape"):XML
		{
			var x:XML = XmlUtils.getNodeByTagName(tagName);
			
			x.@[XmlConstants.BORDER_ALPHA] 	= this._borderAlpha;
			x.@[XmlConstants.BORDER_COLOR] 	= this._borderColor;
			x.@[XmlConstants.BORDER_WEIGHT] = this._borderWeight;
			x.@[XmlConstants.FILL_ALPHA] 	= this._fillAlpha;
			x.@[XmlConstants.FILL_COLOR] 	= this._fillColor;
			x.@[XmlConstants.SHAPE_HEIGHT] 	= this._shapeHeight;
			x.@[XmlConstants.SHAPE_WIDTH] 	= this._shapeWidth;
			x.@[XmlConstants.SHAPE_X] 		= this._shapeX;
			x.@[XmlConstants.SHAPE_Y] 		= this._shapeY;
			x.@[XmlConstants.HEIGHT] 		= this.height;
			x.@[XmlConstants.WIDTH] 		= this.width;
			x.@[XmlConstants.X] 			= this.x;
			x.@[XmlConstants.Y] 			= this.y;
			
			return x;
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
		
		private function RefreshDisplay():void
		{     	
			Draw();
		}
		
	}
}