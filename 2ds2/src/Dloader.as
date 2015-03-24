package 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author yorsh
	 */
	public class Dloader 
	{
		static private var loader:Loader;
		static private var _callback:Function;
		
		
		
		static public function load(url:String,callback:Function=null):void 
		{
			loader = new Loader();
			_callback = callback;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest(url));
		}
		
		static private function onComplete(e:Event):void 
		{
			//trace("cargo");
			_callback();
			
		}
		
		static public function getAsset(name:String):Class 
		{	
			var c:Class = loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
			return c;
		}
		
		
		
		
	}

}