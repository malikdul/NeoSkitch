package local.malik.skitch.view.event
{
	import flash.events.Event;
	
	public class AppViewEvent extends Event
	{
		
		public static const COLOR_CHANGE : String = 'colorChange';
		
		public var payload:Object = null;
		
		public function AppViewEvent(type:String, payload:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.payload = payload;
		}
	}
}