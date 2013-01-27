/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.controller
{
	import flash.net.SharedObject;
	
	import local.malik.skitch.model.DocumentModel;
	import local.malik.skitch.view.drawing.Shape;
	import local.malik.skitch.view.drawing.factory.ShapesFactory;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadDocumentFromSO extends Command
	{
		private var model:DocumentModel;
		public var localStoreSO:SharedObject;
		
		public function LoadDocumentFromSO(model:DocumentModel)
		{
			super();
			this.model = model;
			
			/*localStoreSO = SharedObject.getLocal( model.documentName );
			localStoreSO.clear();*/
		}
		
		override public function execute():void
		{
			var shapes:ArrayCollection = new ArrayCollection();
			localStoreSO = SharedObject.getLocal( model.documentName );
			var doc:XML = new XML( localStoreSO.data.documentXML );
			if( null != doc )
			{
				var xList:XMLList = doc.children();
				
				for each( var x:XML in xList )
				{
					trace(x);
					var shape:Shape = ShapesFactory.getShapeFromXML( x );
					
					shapes.addItem( shape );
				}
				
				model.addAll( shapes );
				trace("OLD objects in local store: \n", doc );
			}
		}
	}
}