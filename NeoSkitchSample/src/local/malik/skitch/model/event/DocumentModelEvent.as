/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.demo.hello.model.event
{
	import flash.events.Event;
	
	import local.malik.skitch.view.drawing.Shape;
	
	public class DocumentModelEvent extends Event
	{
		public static const SHAPE_ADDED:String 					= 'shapeAdded';
		public static const SHAPE_DELETED:String 				= 'shapeDeleted';
		public static const SHAPE_COLLECTION_CLEARED:String 	= 'shapesCollectionCleared';
		
		private var _shape:Shape;
		
		public function DocumentModelEvent(type:String, shape:Shape = null)
		{
			super(type);
			_shape = shape;
		}
		
		public function get shape():Shape
		{
			return _shape;
		}
	}
}