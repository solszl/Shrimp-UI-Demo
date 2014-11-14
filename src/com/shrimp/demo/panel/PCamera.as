package com.shrimp.demo.panel
{
	import com.shrimp.demo.panel.camera.core.CameraEvent;
	import com.shrimp.demo.panel.camera.core.MyCamera;
	import com.shrimp.demo.panel.camera.parallax.ParallaxLayer;
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.managers.WorldClockManager;
	import com.shrimp.framework.ui.controls.Button;
	import com.thirdparts.greensock.TweenNano;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	public class PCamera extends BasePanel
	{
		public function PCamera(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var parallax:ParallaxLayer;
		
		private var camera:MyCamera;
		
		private var role:Button;
		override protected function createChildren():void
		{
			super.createChildren();
			
			
			parallax = new ParallaxLayer(this);
			parallax.viewPort =new Rectangle(0,0,100,200);
			
			role = new Button(parallax);
			role.label = "人";
			
			camera = new MyCamera(StageManager.stage,parallax,role,[{name: "bg", instance: this.parallax, ratio: 1.5}]);
			camera.addEventListener(CameraEvent.CAMERA_UPDATE,cameraUpdate);
			camera.start();
			
			addEventListener(MouseEvent.CLICK,onMouseClick);
		}
		
		protected function cameraUpdate(event:Event):void
		{
			parallax.update(getTimer());
		}
		
		protected function onMouseClick(event:MouseEvent):void
		{
			var des:Point=localToGlobal(new Point(event.localX, event.localY));
			TweenNano.killTweensOf(role);
			TweenNano.to(role,2,{x:des.x,y:des.y});
		}
		
		override public function hide():void
		{
			super.hide();
			camera.pause();
		}
	}
}