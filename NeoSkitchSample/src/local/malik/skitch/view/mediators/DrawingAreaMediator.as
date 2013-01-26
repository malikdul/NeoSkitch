/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.mediators
{
	import local.malik.skitch.model.DocumentModel;
	import local.malik.skitch.view.DrawingAreaView;
	import local.malik.skitch.view.event.DrawShapeEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.ElementExistenceEvent;
	
	public class DrawingAreaMediator extends Mediator
	{
		[Inject]
		public var drawingArea:DrawingAreaView;
		
		//[Inject]
		//public var model:DocumentModel;
		
		public function DrawingAreaMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			// Context Listeners
			//eventMap.mapListener(eventDispatcher, HelloModelEvent.MESSAGE_ADDED, whenMessageAdded);
			// View Listeners
			eventMap.mapListener(drawingArea, "proxyDrawingEnd", onProxyDrawingEnd);
		}
		
		protected function onProxyDrawingEnd(event:ElementExistenceEvent):void
		{
			trace("onAddElement:", event.currentTarget.name)
			
			var de:DrawShapeEvent = new DrawShapeEvent();
			de.shapeName = 'rectangle';
			de.payload	 = event.element;
			
			dispatch( de );
			
			drawingArea.addElement( event.element );
			//model.addShape( 
		}
	}
}