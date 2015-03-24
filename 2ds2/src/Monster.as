package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author yorsh
	 */
	public class Monster extends Sprite 
	{
		private var skin:Sprite;
		
		
		public function Monster() 
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
						
			//skin = new Sprite();
			//trace(Dloader.getAsset("mrl"));
		}
		
		
		
	}

}