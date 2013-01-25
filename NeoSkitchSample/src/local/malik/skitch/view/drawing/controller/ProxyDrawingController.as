/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/

package local.malik.skitch.view.drawing.controller
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import local.malik.skitch.view.drawing.ShapeProxy;
	import local.malik.skitch.view.drawing.interfaces.IShapeContainer;
	
	import mx.core.UIComponent;
	
	import spark.events.ElementExistenceEvent;
	
	
	/**
	 * 
	 *  Dispatched when drawing a proxy object on the canvas is done, 
	 *  the event will be dispatched by the view ( canvas )
	 * 
	 *  Note: this class is not an event dispatcher so the dispatcher of the actual view is used instead.
	 *
	 *  @eventType spark.events.ElementExistenceEvent with custom type "proxyDrawingEnd"
	 *
	 */
	[Event(name="proxyDrawingEnd", type="spark.events.ElementExistenceEvent")]
	
	
	/**
	 * 
	 *  A controller class that draws a proxy object on the canvas, using mouse gestures.
	 * 
	 *  @author malikdul@gmail.com
	 * 
	 * 
	 */	
	public class ProxyDrawingController
	{
		private var currentObject	:ShapeProxy ;
		private var proxyObject		:ShapeProxy ;
		private var cView			:IShapeContainer;
		private var minHeightWidth	:int ;
		
		
		public function ProxyDrawingController(view:IShapeContainer, minHeightWidth:int = 20)
		{
			cView 			= view;
			minHeightWidth	= minHeightWidth;
			
			proxyObject = new ShapeProxy();
		}
		
		public function mouseDownHandler(event:MouseEvent):void
		{
			event.stopImmediatePropagation();
			
			var target:UIComponent 		= event.currentTarget as UIComponent;
			
			var localPoint:Point 		= cView.globalToLocal(new Point(event.stageX, event.stageY));				
			var parentLocalPoint:Point 	= target.globalToLocal(new Point(event.stageX, event.stageY));				
			
			currentObject 				= new ShapeProxy();
			currentObject.x 			= parentLocalPoint.x;
			currentObject.y 			= parentLocalPoint.y;
			
			proxyObject.x 				= localPoint.x ;
			proxyObject.y 				= localPoint.y;
			proxyObject.width 			= 0;
			proxyObject.height 			= 0;
			
			cView.addElement(proxyObject);			
			
		}
		
		public function mouseMoveHandler(event:MouseEvent):void
		{
			event.stopImmediatePropagation();
			
			var global:Point 		= cView.localToGlobal(new Point(proxyObject.x,proxyObject.y));
			
			var w:int 				= event.stageX - global.x ;				
			var h:int 				= event.stageY - global.y ;
			
			proxyObject.width 		= w;
			proxyObject.height 		= h
			
		}
		
		public function mouseUpHandler(event:MouseEvent):void
		{
			try
			{
				event.stopImmediatePropagation();
				
				currentObject.width 	= proxyObject.width;
				currentObject.height 	= proxyObject.height;
				
				cView.removeElement(proxyObject);
				
				if(currentObject.width < minHeightWidth && currentObject.height < minHeightWidth)
				{
					currentObject.width 	= minHeightWidth;
					currentObject.height 	= minHeightWidth;
				}
				
				var sp:ShapeProxy 			= currentObject as ShapeProxy;
				currentObject 				= null;
				
				var e:ElementExistenceEvent = new ElementExistenceEvent( "proxyDrawingEnd", true, false, sp );
				cView.dispatchEvent( e );
				
			} 
			catch(error:Error) 
			{
				//known if previously was on popup, just ignore it ... TODO: needs more cases here and need more debuging :)
			}
		}
	}
}