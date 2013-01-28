/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.model.event
{
	import flash.events.Event;
	
	import local.malik.skitch.view.drawing.Shape;
	
	public class DocumentModelEvent extends Event
	{
		public static const SAVE_DOCUMENT:String 				= 'saveDocument';
		public static const SHAPE_ADDED:String 					= 'shapeAdded';
		public static const SHAPE_DELETED:String 				= 'shapeDeleted';
		public static const SHAPE_COLLECTION_CLEARED:String 	= 'shapesCollectionCleared';
		public static const RE_LOAD_DOCUMENT:String 			= 'addShapesInCollection';
		
		private var _payload:Object;
		
		public function DocumentModelEvent(type:String, payload:Object = null)
		{
			super(type);
			_payload = payload;
		}
		
		public function get payload():Object
		{
			return _payload;
		}
	}
}