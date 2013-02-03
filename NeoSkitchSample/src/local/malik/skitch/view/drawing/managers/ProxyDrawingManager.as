/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/

package local.malik.skitch.view.drawing.managers
{
	import com.roguedevelopment.objecthandles.SpriteHandle;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import local.malik.skitch.view.DrawingAreaView;
	import local.malik.skitch.view.drawing.ShapeProxy;
	import local.malik.skitch.view.drawing.interfaces.IShape;
	import local.malik.skitch.view.drawing.interfaces.IShapeContainer;
	
	import mx.core.UIComponent;
	
	import spark.components.RichEditableText;
	import spark.events.ElementExistenceEvent;
	import spark.skins.spark.SkinnableContainerSkin;
	
	
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
	public class ProxyDrawingManager
	{
		private var currentObject	:ShapeProxy ;
		private var proxyObject		:ShapeProxy ;
		private var cView			:IShapeContainer;
		private var minHeightWidth	:int ;
		private var isDrawing		:Boolean
		
		
		public function ProxyDrawingManager(view:IShapeContainer, minHeightWidth:int = 20)
		{
			cView 			= view;
			minHeightWidth	= minHeightWidth;
			
			proxyObject = new ShapeProxy();
			
			view.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			view.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			view.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
		
		public function mouseDownHandler(event:MouseEvent):void
		{
			if( ! ( event.target is SkinnableContainerSkin && event.currentTarget is DrawingAreaView ) ) return;
			
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
			if( ! ( event.target is SkinnableContainerSkin && event.currentTarget is DrawingAreaView ) ) return;
			
			if( event.buttonDown )
			{
				isDrawing = true;
				
				var global:Point 		= cView.localToGlobal(new Point(proxyObject.x,proxyObject.y));
				
				var w:int 				= event.stageX - global.x ;				
				var h:int 				= event.stageY - global.y ;
				
				proxyObject.width 		= w - 1;
				proxyObject.height 		= h - 1;
			}
			else if( null != proxyObject && ( cView as DisplayObjectContainer ).contains( proxyObject ) )
			{
				cView.removeElement(proxyObject);
			}
		}
		
		public function mouseUpHandler(event:MouseEvent):void
		{
			try
			{
				if( ! ( isDrawing && event.target is SkinnableContainerSkin && event.currentTarget is DrawingAreaView ) ) return;
				
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
				
				isDrawing = false;
				
			} 
			catch(error:Error) 
			{
				//known if previously was on popup, just ignore it ... TODO: needs more cases here and need more debuging :)
			}
		}
	}
}