/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.mediators
{
	import flash.events.MouseEvent;
	
	import local.malik.skitch.view.components.ShapesPopup;
	import local.malik.skitch.view.event.DrawShapeEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.ToggleButton;
	
	public class ShapesPopupMediator extends Mediator
	{
		[Inject]
		public var view:ShapesPopup;
		
		public function ShapesPopupMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(view, MouseEvent.CLICK, onViewClick);
		}
		
		protected function onViewClick(event:MouseEvent):void
		{
			if( event.target is ToggleButton )
			{
				dispatch( new DrawShapeEvent(event.target.label) );
				view.removePopup();
			}
		}
	}
}