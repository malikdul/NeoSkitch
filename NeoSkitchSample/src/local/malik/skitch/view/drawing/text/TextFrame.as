/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.text
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.container.ScrollPolicy;
	
	import local.malik.skitch.util.xml.XmlConstants;
	import local.malik.skitch.util.xml.XmlUtils;
	import local.malik.skitch.view.drawing.interfaces.IShape;
	
	import mx.core.UIComponent;
	import mx.events.PropertyChangeEvent;
	import mx.events.ResizeEvent;
	
	import spark.components.Group;
	import spark.components.SkinnableContainer;
	import spark.components.TextArea;
	import spark.components.supportClasses.SkinnableComponent;

	
	/** 
	 * This is an example and not part of the core ObjectHandles library. 
	 **/
	[Bindable]
	public class TextFrame extends SkinnableContainer implements IShape
	{
		private var _textArea:TextArea;
		private var _fillColor:uint			= 0xffffff;
		private var _fillAlpha:Number		= 0;
		
		public var isLocked:Boolean = false;
		
		
		public function TextFrame()
		{
			super();
			_textArea = new TextArea();
			
			addEventListener( ResizeEvent.RESIZE, ResizeHandler );
			
			//this.addEventListener(MouseEvent.CLICK, mouseClickHandler );
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
		
		public function get text():String
		{
			return _textArea.text;
		}
		
		public function set text(value:String):void
		{
			_textArea.text = value;
		}
		
		override protected function createChildren():void
		{
			_textArea.percentHeight = 100;
			_textArea.percentWidth = 100;
			//text.text = "Hello, World.";
			_textArea.heightInLines = NaN;
			_textArea.horizontalCenter = 0;
			_textArea.verticalCenter = 0;
			
			//text bg is not suitable here as it is more of a highlight color
			//_textArea.setStyle("contentBackgroundColor", fillColor);
			//_textArea.setStyle("contentBackgroundAlpha", fillAlpha);

			//found an issue with caret, when bg alpha is zero caret is not visible
			//and quick googling shows that custom color can't be assigned to caret :(
			//so have to set it some value so that it can be seen with naked eye :)
			_textArea.setStyle("contentBackgroundAlpha", 0.1);
			_textArea.setStyle("borderVisible", "false");
			_textArea.setStyle("horizontalScrollPolicy", ScrollPolicy.OFF);
			_textArea.setStyle("verticalScrollPolicy", ScrollPolicy.OFF);
			
			
			addElement( _textArea );
			
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
		
		private function RefreshDisplay():void
		{     	
			Draw();
		}
		
		
		protected function Draw():void
		{
			//_textArea.graphics.clear();
			graphics.clear();
			/*graphics.lineStyle(1,0);
			graphics.beginFill(fillColor,fillAlpha);
			graphics.drawRoundRect(0,0,width,height,0,0);
			graphics.endFill();*/
			
			// set focus to text area			
			callLater( _textArea.setFocus );
		}
		
		public function FromXML(x:XML):void
		{
			this.height			= x.@[XmlConstants.HEIGHT];
			this.width			= x.@[XmlConstants.WIDTH];
			this.x				= x.@[XmlConstants.X];
			this.y				= x.@[XmlConstants.Y];
			this._fillAlpha		= x.@[XmlConstants.FILL_ALPHA];
			this._fillColor		= x.@[XmlConstants.FILL_COLOR];
			
			_textArea.text = x.text();
		}
		
		public function ToXML(tagName:String = "Text"):XML
		{
			var x:XML = XmlUtils.getNodeByTagName(tagName);
			
			x.@[XmlConstants.HEIGHT] 		= this.height;
			x.@[XmlConstants.WIDTH] 		= this.width;
			x.@[XmlConstants.X] 			= this.x;
			x.@[XmlConstants.Y] 			= this.y;
			x.@[XmlConstants.FILL_ALPHA] 	= this._fillAlpha;
			x.@[XmlConstants.FILL_COLOR] 	= this._fillColor;
			
			
			//TODO: escape the text ... may be use XML Entities, base64 strings or CDATA section etc. 
			x.appendChild( _textArea.text );
			
			return x;
		}
	}
}