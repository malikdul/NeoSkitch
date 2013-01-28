/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.text
{
	import local.malik.skitch.view.drawing.Shape;
	
	import spark.components.TextArea;
	import spark.components.TextInput;
	
	public class Text extends Shape
	{
		//protected var _TextArea:TextArea;
		protected var _TextArea:TextInput;
		private var isCapturingKeyBoard:Boolean = false;
		
		public function Text()
		{
			super();
			
			//_TextArea = new TextArea();
			_TextArea = new TextInput();
		}
		override protected function Draw():void
		{
			this.graphics.beginFill(0x0000BB, 0.03);
			this.graphics.lineStyle(1, 0x3123cc, 1);
			this.graphics.drawRect(0, 0, this.width, this.height);
			
			this.graphics.endFill();
			
			//this._TextArea.editable = true;
			//callLater(_TextArea.setFocus);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			addChild(_TextArea);
			SetStyle();
		}
		
		private function SetStyle():void
		{
			this._TextArea.text  = "some text here";
			
			_TextArea.percentHeight 		= 100;
			_TextArea.percentWidth			= 100;
			
			_TextArea.x = 0;
			_TextArea.y = 0;
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