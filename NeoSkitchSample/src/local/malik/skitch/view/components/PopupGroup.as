/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/

package local.malik.skitch.view.components
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.FlexGlobals;
	import mx.core.IFlexDisplayObject;
	import mx.events.CloseEvent;
	import mx.managers.IFocusManagerContainer;
	import mx.managers.PopUpManager;
	
	import spark.components.Group;
	import spark.events.PopUpEvent;
	
	
	
	public class PopupGroup extends Group implements IFocusManagerContainer
	{
		private var _defaultButton:IFlexDisplayObject;
		public function PopupGroup()
		{
			super();
			addEventListener(CloseEvent.CLOSE, onClosePopup);
			FlexGlobals.topLevelApplication.addEventListener(MouseEvent.CLICK, onApplicationClick );
			
		}
		
		private function onApplicationClick(event:Event):void
		{
			removePopup();
		}
		
		private function onClosePopup(event:Event):void
		{
			if( isPopUp )
				close();
		}
		
		public function ShowPopup(parent:DisplayObject):void
		{
			PopUpManager.addPopUp( this, parent );
		}
		
		public function removePopup():void
		{
			dispatchEvent( new PopUpEvent( CloseEvent.CLOSE, true, false ) );
		}
		
		private function close():void
		{
			removeEventListener(CloseEvent.CLOSE, onClosePopup);
			FlexGlobals.topLevelApplication.removeEventListener(MouseEvent.CLICK, onClosePopup );
			
			PopUpManager.removePopUp( this );
		}
		
		
		//IFocusManagerContainer impl
		
		public function set defaultButton(value:IFlexDisplayObject):void
		{
			_defaultButton = value;
		}
		
		public function get defaultButton():IFlexDisplayObject
		{
			return _defaultButton;
		}
		
	}
}