package com.shrimp.demo.panel.pakour
{
	import com.greensock.TweenMax;
	import com.shrimp.framework.ui.controls.Image;

	import flash.display.DisplayObjectContainer;

	public class GamingRender extends BaseRender
	{
		public function GamingRender(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
		{
			super(parent, xpos, ypos);
		}

		private var imgHuman:Image;

		override protected function createChildren():void
		{
			super.createChildren();
			imgHuman = new Image(this);
			imgHuman.source = "http://farm4.staticflickr.com/3057/2981897747_b9df454154.jpg";
			imgHuman.width = imgHuman.height = 40;
		}

		override public function update(t:Number):void
		{
			super.update(t);
			if (imgHuman.x < 200 && imgHuman.x >= 0)
			{
				imgHuman.x += 1;
			}
			else
			{
				imgHuman.x = 0;
			}
		}
	}
}
