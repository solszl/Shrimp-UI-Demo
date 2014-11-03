package com.shrimp.demo.panel.pakour
{
	import com.shrimp.framework.ui.controls.Label;
	
	import flash.display.DisplayObjectContainer;
	
	public class WelcomeRender extends BaseRender
	{
		public function WelcomeRender(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var lblState:Label;
		
		override protected function createChildren():void
		{
			super.createChildren();
			lblState = new Label(this);
			lblState.text = "default";
		}
		
		private var delta:Number=0;
		override public function update(t:Number):void
		{
			super.update(t);
			if(delta<0.35)
			{
				delta+=t;
			}
			else
			{
				lblState.text = delta+"";
				delta = 0;
			}
		}
	}
}