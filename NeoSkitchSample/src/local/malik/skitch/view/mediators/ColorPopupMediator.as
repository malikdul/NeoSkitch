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
	
	import local.malik.skitch.model.vo.ColorVO;
	import local.malik.skitch.view.components.ColorButton;
	import local.malik.skitch.view.components.ColorPopup;
	import local.malik.skitch.view.event.AppViewEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ColorPopupMediator extends Mediator
	{
		[Inject]
		public var view:ColorPopup;
		
		public function ColorPopupMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			// Context Listeners
			//eventMap.mapListener(eventDispatcher, HelloModelEvent.MESSAGE_ADDED, whenMessageAdded);
			// View Listeners
			eventMap.mapListener(view, MouseEvent.CLICK, onViewClick);
			
		}
		
		protected function onViewClick(event:MouseEvent):void
		{
			if( event.target is ColorButton )
			{
				var color:ColorVO = new ColorVO( event.target.color, view.id_opacity.value / 100 );
				trace(color);
				dispatch( new AppViewEvent(AppViewEvent.COLOR_CHANGE, color ) );
			}
		}
	}
}