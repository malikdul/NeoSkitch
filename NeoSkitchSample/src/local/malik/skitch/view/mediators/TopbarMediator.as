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
	
	import local.malik.skitch.model.event.DocumentModelEvent;
	import local.malik.skitch.util.Constants;
	import local.malik.skitch.view.Topbar;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class TopbarMediator extends Mediator
	{
		[Inject]
		public var view:Topbar;
		
		public function TopbarMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			// View Listeners
			eventMap.mapListener(view, MouseEvent.CLICK, onViewClick);
		}
		
		protected function onViewClick(event:MouseEvent):void
		{
			switch(event.target.label)
			{
				case Constants.SAVE:
				{
					dispatch( new DocumentModelEvent( DocumentModelEvent.SAVE_DOCUMENT ) );
					break;
				}
				case Constants.DELETE:
				{
					dispatch( new DocumentModelEvent( DocumentModelEvent.SHAPE_DELETED ) );
					break;
				}
			}
				
		}
			
				
	}
}