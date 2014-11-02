package com.shrimp.demo.panel
{
	import com.shrimp.demo.resource.EmbeddResource;
	import com.shrimp.ext.bone.Armature;
	import com.shrimp.ext.bone.animation.WorldClock;
	import com.shrimp.ext.bone.factorys.NativeFactory;
	import com.shrimp.framework.managers.WorldClockManager;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.ui.controls.core.Component;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class PBone extends BasePanel
	{
		private var factory:NativeFactory;
		
		private var armature:Armature;
		
		public function PBone(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			factory=new NativeFactory();
			factory.fillBitmapSmooth=true;
			factory.addEventListener(Event.COMPLETE, textureCompleteHandler);
			factory.parseData(new EmbeddResource.Bones_Data);
			
			var btn:Button = new Button(this);
			btn.scale9Rect = new Rectangle(4,4,12,12);
			btn.label = "开始";
			btn.addEventListener(MouseEvent.CLICK,onBtnClick);
		}
		
		private var bone:Sprite;
		
		private function textureCompleteHandler(e:Event):void
		{
			armature = factory.buildArmature("Human");
			bone = armature.display as Sprite;
			bone.x = 100;
			bone.y = 100;
			bone.scaleX = bone.scaleY = .5;
			addChild(bone);
			armature.animation.gotoAndPlay("stand");
			WorldClock.clock.add(armature);
		}
		
		override public function hide():void
		{
			super.hide();
			WorldClockManager.getInstance().clearTimer(WorldClock.clock.advanceTime);
		}
		
		protected function onBtnClick(event:MouseEvent):void
		{
			WorldClockManager.getInstance().doFrameLoop(1,WorldClock.clock.advanceTime,[-1]);
		}
	}
}