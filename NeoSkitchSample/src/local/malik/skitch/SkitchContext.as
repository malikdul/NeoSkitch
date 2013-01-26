/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch
{
	import flash.display.DisplayObjectContainer;
	
	import local.malik.skitch.view.DrawingAreaView;
	import local.malik.skitch.view.Toolbar;
	import local.malik.skitch.view.components.ColorPopup;
	import local.malik.skitch.view.mediators.ColorPopupMediator;
	import local.malik.skitch.view.mediators.DrawingAreaMediator;
	import local.malik.skitch.view.mediators.ToolbarMediator;
	
	import org.robotlegs.mvcs.Context;

	public class SkitchContext extends Context
	{
		public function SkitchContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			
			
			
			mediatorMap.mapView(DrawingAreaView, DrawingAreaMediator);
			mediatorMap.mapView(Toolbar, ToolbarMediator);
			mediatorMap.mapView(ColorPopup, ColorPopupMediator, null, false );
			
			super.startup();
		}
			
	}
}