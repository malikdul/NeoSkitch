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
	import local.malik.skitch.util.xml.XmlUtils;
	import local.malik.skitch.view.drawing.interfaces.IShape;
	
	import mx.collections.IList;
	
	import org.robotlegs.mvcs.Command;
	
	public class SaveDocumentToSO extends Command
	{
		private var model:DocumentModel;
		public var localStoreSO:SharedObject;
		
		public function SaveDocumentToSO(model:DocumentModel)
		{
			super();
			this.model = model;
			
		}
		
		override public function execute():void
		{
			localStoreSO = SharedObject.getLocal( model.documentName );
			
			var collection:IList = model.getAll();
			
			var x:XML = XmlUtils.getNodeByTagName( "document" );
			
			for each( var shape:IShape in collection )
			{
				x.appendChild( shape.ToXML() ) ;
			}
			
			localStoreSO.data.documentXML = x.toXMLString();
			localStoreSO.flush();
			
			trace("SAVED objects in local store: \n", localStoreSO.data.documentXML );
		}
	}
}