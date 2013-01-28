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
	
	import local.malik.skitch.controller.LoadDocumentFromSO;
	import local.malik.skitch.controller.SaveDocumentToSO;
	import local.malik.skitch.model.DocumentModel;
	import local.malik.skitch.model.event.DocumentModelEvent;
	import local.malik.skitch.view.DrawingAreaView;
	import local.malik.skitch.view.Toolbar;
	import local.malik.skitch.view.Topbar;
	import local.malik.skitch.view.components.ColorPopup;
	import local.malik.skitch.view.components.ShapesPopup;
	import local.malik.skitch.view.mediators.ColorPopupMediator;
	import local.malik.skitch.view.mediators.DrawingAreaMediator;
	import local.malik.skitch.view.mediators.ShapesPopupMediator;
	import local.malik.skitch.view.mediators.ToolbarMediator;
	import local.malik.skitch.view.mediators.TopbarMediator;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	public class SkitchContext extends Context
	{
		public function SkitchContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			// Model
			injector.mapSingleton(DocumentModel);
			
			// Controller
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, LoadDocumentFromSO ); 
			commandMap.mapEvent(DocumentModelEvent.SAVE_DOCUMENT, SaveDocumentToSO);

			//view
			mediatorMap.mapView(ColorPopup, ColorPopupMediator, null, false );
			mediatorMap.mapView(ShapesPopup, ShapesPopupMediator, null, false );
			mediatorMap.mapView(Topbar, TopbarMediator);
			mediatorMap.mapView(Toolbar, ToolbarMediator);
			mediatorMap.mapView(DrawingAreaView, DrawingAreaMediator);
			
			super.startup();
		}
		
	}
}