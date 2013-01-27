/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.model
{
	import flash.net.SharedObject;
	
	import local.malik.skitch.model.event.DocumentModelEvent;
	import local.malik.skitch.view.drawing.Shape;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class DocumentModel extends Actor
	{
		private var _documentName:String = "Blank";

		public function get documentName():String
		{
			return _documentName;
		}

		public function set documentName(value:String):void
		{
			_documentName = value;
		}

		private var shapesCollection:ArrayCollection;
		
		public function DocumentModel()
		{
			shapesCollection = new ArrayCollection();
			//trace("objects in local store: ", localStoreSO.data.shapesCollection.length );
		}
		
		public function addShape(shape:Shape):void
		{
			shapesCollection.addItem( shape );
		}
		
		public function getAll():IList
		{
			return shapesCollection;
		}
		
		public function addAll(collection:IList):void
		{
			if( collection && collection.length )
			{
				shapesCollection.addAll( collection );
				dispatch( new DocumentModelEvent( DocumentModelEvent.RE_LOAD_DOCUMENT, shapesCollection ) );
			}
		}
	}
}