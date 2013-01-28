/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.drawing.controller
{
	import com.roguedevelopment.objecthandles.ObjectHandles;
	import com.roguedevelopment.objecthandles.SelectionEvent;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import local.malik.skitch.view.DrawingAreaView;
	import local.malik.skitch.view.drawing.ShapeProxy;
	import local.malik.skitch.view.drawing.interfaces.IShape;
	
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	
	import spark.events.ElementExistenceEvent;

	public class DrawingController
	{
		private var currentObject:ShapeProxy ;
		//private var currentTarget:IVisualElementContainer ;
		protected var objectHandles:ObjectHandles;
		private var proxyObject:ShapeProxy ;
		
		private var cView:DrawingAreaView;
		private var minHeightWidth:int ;
		
		public function DrawingController( view:DrawingAreaView )
		{
			proxyObject = new ShapeProxy();
			minHeightWidth =50;
			cView = view;
			this.objectHandles = new ObjectHandles( cView );
			objectHandles.selectionManager.addEventListener(SelectionEvent.ADDED_TO_SELECTION, onSelectionChanged );
		}
		
		private function onSelectionChanged(event:SelectionEvent):void
		{
			var selObj:IVisualElement = objectHandles.selectionManager.currentlySelected[0];
			var wse:ElementExistenceEvent = new ElementExistenceEvent("itemSelected", true, false, selObj);
			
			//TODO: create custom event to handle multiple selection
			/*if( objectHandles.selectionManager.currentlySelected.length > 1 )
			{
				wse.SelectedItems = objectHandles.selectionManager.currentlySelected; 
			}*/
			
			if( selObj )
				cView.dispatchEvent( wse );
		}
		
		public function RegisterShape(shape:IShape):void
		{
			
			objectHandles.registerComponent(shape, shape as IEventDispatcher);
			
		}
		public function UnRegisterShape(shape:IShape):void
		{
			objectHandles.selectionManager.clearSelection();
			objectHandles.unregisterComponent(shape as IEventDispatcher);
			
		}
		public function ClearSelection():void
		{
			objectHandles.selectionManager.clearSelection();
			objectHandles.modelList.splice(0, objectHandles.modelList.length);
			
		}
		
		public function SetSelected(element:IVisualElement):void
		{
			objectHandles.selectionManager.clearSelection();
			objectHandles.selectionManager.addToSelected(element);
		}
		
		public function currentlySelected():Array 
		{
			return objectHandles.selectionManager.currentlySelected;
		}
	}
}