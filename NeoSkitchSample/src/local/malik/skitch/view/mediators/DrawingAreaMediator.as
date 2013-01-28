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
	import local.malik.skitch.model.event.DocumentModelEvent;
	import local.malik.skitch.model.vo.ColorVO;
	import local.malik.skitch.util.Constants;
	import local.malik.skitch.view.DrawingAreaView;
	import local.malik.skitch.view.drawing.Shape;
	import local.malik.skitch.view.drawing.factory.ShapesFactory;
	import local.malik.skitch.view.event.AppViewEvent;
	import local.malik.skitch.view.event.DrawShapeEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.ElementExistenceEvent;
	
	public class DrawingAreaMediator extends Mediator
	{
		[Inject]
		public var drawingArea:DrawingAreaView;
		
		[Inject]
		public var model:DocumentModel;
		
		
		private var lastDrawEvent:DrawShapeEvent = new DrawShapeEvent(Constants.RECTANGLE);
		private var colorVO:ColorVO = new ColorVO( 0xff0000, 1.0 );
		
		public function DrawingAreaMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			// Context Listeners
			eventMap.mapListener(eventDispatcher, DrawShapeEvent.DRAW_SHAPE, whenShapeChanged);
			eventMap.mapListener(eventDispatcher, AppViewEvent.COLOR_CHANGE, whenColorChanged);
			eventMap.mapListener(eventDispatcher, DocumentModelEvent.RE_LOAD_DOCUMENT, whenDocumentReloaded);
			// View Listeners
			eventMap.mapListener(drawingArea, "proxyDrawingEnd", onProxyDrawingEnd);
			
			whenDocumentReloaded(null);
		}
		
		protected function whenDocumentReloaded(event:DocumentModelEvent):void
		{
			var collection:IList = model.getAll();
			
			for each( var shape:Shape in collection )
			{
				drawingArea.addElement( shape );
			}
		}
		protected function whenShapeChanged(event:DrawShapeEvent):void
		{
			lastDrawEvent = event;
		}
		
		protected function whenColorChanged(event:AppViewEvent):void
		{
			colorVO = event.payload as ColorVO ;
		}
		
		protected function onProxyDrawingEnd(event:ElementExistenceEvent):void
		{
			var shape:Shape = ShapesFactory.getShape( lastDrawEvent );
			if( null != shape )
			{
				shape.height = event.element.height;
				shape.width = event.element.width;
				shape.x = event.element.x;
				shape.y = event.element.y;
				
				shape.fillAlpha = colorVO.alpha;
				shape.fillColor = colorVO.color;
				
				drawingArea.addElement( shape );
				model.addShape( shape );
				
				dispatch( new DocumentModelEvent( DocumentModelEvent.SHAPE_ADDED, shape ) );
			}
		}
	}
}