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
	
	//import spark.components.TextArea;

	public class Text extends Shape
	{
		//protected var _TextArea:TextArea;
		private var isCapturingKeyBoard:Boolean = false;
		
		public function Text()
		{
			super();
			
			//_TextArea = new TextArea();
		}
		override protected function Draw():void
		{
			this.graphics.beginFill(0x0000BB, 0.07);
			this.graphics.lineStyle(1, 0x3123cc, 1);
			this.graphics.drawRect(0, 0, this.width, this.height);
			
			this.graphics.endFill();
			
			//this._TextArea.editable = true;
			//callLater(_TextArea.setFocus);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			//addChild(_TextArea);
			SetStyle();
		}
		
		private function SetStyle():void
		{
			//this._TextArea.text  = "";
			
			//_TextArea.percentHeight 		= 100;
			//_TextArea.percentWidth			= 100
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