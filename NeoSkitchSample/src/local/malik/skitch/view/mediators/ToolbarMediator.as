/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.view.mediators
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import local.malik.skitch.model.DocumentModel;
	import local.malik.skitch.model.vo.ColorVO;
	import local.malik.skitch.util.Constants;
	import local.malik.skitch.util.PopupUtil;
	import local.malik.skitch.view.Toolbar;
	import local.malik.skitch.view.components.ColorPopup;
	import local.malik.skitch.view.components.PopupGroup;
	import local.malik.skitch.view.components.ShapesPopup;
	import local.malik.skitch.view.event.AppViewEvent;
	
	import mx.events.CloseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ToolbarMediator extends Mediator
	{
		[Inject]
		public var view:Toolbar;
		
		public function ToolbarMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			// Context Listeners
			eventMap.mapListener(eventDispatcher, AppViewEvent.COLOR_CHANGE, whenColorChanged);
			// View Listeners
			eventMap.mapListener(view, MouseEvent.CLICK, onViewClick);
		}
		
		protected function whenColorChanged(event:AppViewEvent):void
		{
			view.changeColor( event.payload as ColorVO );
		}
		
		protected function onViewClick(event:MouseEvent):void
		{
			switch(event.target.label)
			{
				case Constants.ARROW:
				{
					
					break;
				}
				case Constants.TEXT:
				{
					
					break;
				}
				case Constants.PEN:
				{
					
					break;
				}
				case Constants.SHAPES:
				{
					showShapesPopup(event);
					break;
				}
				case Constants.COLOR:
				{
					showColorPopup(event);
					break;
				}
				case Constants.PIXALATE:
				{
					
					break;
				}
				case Constants.RESIZE:
				{
					
					break;
				}
					
				default:
				{
					break;
				}
			}
			
			event.preventDefault();
			event.stopImmediatePropagation();
		}
		
		
		private var _curruntPopUp:PopupGroup;

		public function get curruntPopUp():PopupGroup
		{
			return _curruntPopUp;
		}

		public function set curruntPopUp(value:PopupGroup):void
		{
			_curruntPopUp = value;
			
			_curruntPopUp.addEventListener(CloseEvent.CLOSE, removePopupMediator);
			mediatorMap.createMediator( _curruntPopUp );
		}
		
		private function removePopupMediator(event:Event):void
		{
			_curruntPopUp.removeEventListener(CloseEvent.CLOSE, removePopupMediator);
			mediatorMap.removeMediatorByView( _curruntPopUp );
			_curruntPopUp = null;
		}

		protected function showColorPopup(event:MouseEvent):void
		{
			curruntPopUp = PopupUtil.createPopup( ColorPopup, event, view );
		}
		
		protected function showShapesPopup(event:MouseEvent):void
		{
			curruntPopUp = PopupUtil.createPopup( ShapesPopup, event, view );
		}
	}
}