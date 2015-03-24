package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author yorsh
	 */
	public class Main extends Sprite 
	{
		private var Apress:Boolean;
		private var Dpress:Boolean;
		private var monster:Sprite;
		private var speed:Number = 0;
		private var aceleration:Number = 0.2;
		private var maxSpeed:Number = 5;
		private var friction:Number = 0.95;
		private var currentTimer:int;
		private var elapsed:Number=0;
		
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Dloader.load("assets.swf",goGame);
		}
		
		private function goGame():void 
		{
			trace("go to game");
			monster = new Monster();
			
			currentTimer = getTimer();
			
			addChild(monster);
			monster.x = (stage.stageWidth / 2) - monster.width;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKdown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKup);
			addEventListener(Event.ENTER_FRAME, loop);
			//var timer:Timer = new Timer(500);
			//timer.start();
			//timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		
	
		private function onTimer():void 
		{
			var m:Monster2 = new Monster2();
			addChild(m);
			m.x = Math.random() * stage.stageWidth;
		}
		
		private function loop(e:Event):void 
		{	
			
			var dt:Number = (getTimer() - currentTimer)*0.001;
			currentTimer = getTimer();
			elapsed += dt;
			trace(elapsed);
			if (elapsed >= 1) { onTimer(); elapsed = 0; }
			
			
			
			
			
			
			if (Apress) {
				
				speed -= aceleration;
				if (speed < -maxSpeed) { speed = -maxSpeed; }
				
			}
			if (Dpress) {
				
				speed += aceleration;
				if (speed > maxSpeed) { speed = maxSpeed; }
				
				
			}
			speed *= friction;
			//trace(speed);
			monster.x += speed;
			
			if (monster.x<0) { monster.x = 0; }
			if (monster.x > stage.stageWidth - monster.width) { monster.x = stage.stageWidth - monster.width };
			
			
		}
		
		private function onKdown(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.A:Apress = true;
					
				break;
				case Keyboard.D:Dpress = true;
				break;
			}
		}
		
		private function onKup(e:KeyboardEvent):void 
		{
				switch (e.keyCode) 
			{
				case Keyboard.A:Apress = false;
					
				break;
				case Keyboard.D:Dpress = false;
				break;
			}
		}
		
		
	}
	
}