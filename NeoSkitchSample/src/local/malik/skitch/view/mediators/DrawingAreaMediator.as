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
	import local.malik.skitch.view.drawing.factory.ShapesFactory;
	import local.malik.skitch.view.drawing.interfaces.IShape;
	import local.malik.skitch.view.event.AppViewEvent;
	import local.malik.skitch.view.event.DrawShapeEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.core.IVisualElement;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.ElementExistenceEvent;
	
	public class DrawingAreaMediator extends Mediator
	{
		[Inject]
		public var view:DrawingAreaView;
		
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
			eventMap.mapListener(eventDispatcher, DocumentModelEvent.SHAPE_DELETED, whenShapeDeleted);
			// View Listeners
			eventMap.mapListener(view, "proxyDrawingEnd", onProxyDrawingEnd);
			
			whenDocumentReloaded(null);
		}
		
		protected function whenShapeDeleted(event:DocumentModelEvent):void
		{
			model.removeAll(  view.deleteSelected() );
			trace("getAll", model.getAll().length );
		}
		
		protected function whenDocumentReloaded(event:DocumentModelEvent):void
		{
			var collection:IList = model.getAll();
			
			for each( var shape:IShape in collection )
			{
				view.addElement( shape as IVisualElement );
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
			//if( null == lastDrawEvent )
			var shape:IShape = ShapesFactory.getShape( lastDrawEvent );
			if( null != shape )
			{
				shape.height = event.element.height;
				shape.width = event.element.width;
				shape.x = event.element.x;
				shape.y = event.element.y;
				
				shape.fillAlpha = colorVO.alpha;
				shape.fillColor = colorVO.color;
				
				view.addElement( shape as IVisualElement );
				model.addShape( shape );
				
				dispatch( new DocumentModelEvent( DocumentModelEvent.SHAPE_ADDED, shape ) );
			}
		}
	}
}