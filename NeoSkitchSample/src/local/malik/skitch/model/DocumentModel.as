/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.model
{
	import local.malik.skitch.view.drawing.Shape;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;

	public class DocumentModel extends Actor
	{
		private var shapesCollection:ArrayCollection;
		
		public function DocumentModel()
		{
		}
		
		public function addShape(shape:Shape):void
		{
			shapesCollection.addItem( shape );
		}
	}
}