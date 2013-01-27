/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.shapes
{
	import local.malik.skitch.view.drawing.Shape;

	[Bindable]
	public class Elipse extends Shape
	{
		private var m_iRadius:uint      		 = 50;
		private var m_bIsEllipse:Boolean       = true;
		
		public function Elipse()
		{
			super();
		}
		
		public function set Radius(value:uint):void
		{
			m_iRadius = value;
			//Clear();
			Draw();
		}
		
		public function get Radius():uint
		{
			return m_iRadius;
		}
		
		public function set IsEllipse(value:Boolean):void
		{
			m_bIsEllipse = value;
			//Clear();
			Draw();
		}
		
		public function get IsEllipse():Boolean
		{
			return m_bIsEllipse;
		}
		
		protected override function Draw():void
		{
			super.Draw();    
			this.graphics.beginFill(fillColor, fillAlpha);
			this.graphics.lineStyle(borderWeight, borderColor, borderAlpha);
			if(m_bIsEllipse)
			{
				this.graphics.drawEllipse(0, 0 ,width, height);
			}
			else
			{
				this.graphics.drawCircle(0, 0 , Radius);
			}
			this.graphics.endFill();
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