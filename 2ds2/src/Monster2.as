package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author yorsh
	 */
	public class Monster2 extends Sprite 
	{
		private var skin:Sprite;
		
		public function Monster2() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = Dloader.getAsset("mrl");
			skin = new c();
			addChild(skin);
		}
		
	}

}