package com.shrimp.demo.panel.pakour
{
	import com.shrimp.framework.ui.controls.Label;
	import com.shrimp.framework.utils.StringUtil;
	
	import flash.display.DisplayObjectContainer;
	
	public class GamingRender2 extends BaseRender
	{
		public function GamingRender2(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var lblScore:Label;
		
		private var temp:String="score:{0}";
		
		private var score:int = 0;
		override protected function createChildren():void
		{
			super.createChildren();
			lblScore = new Label(this);
			lblScore.text = StringUtil.substitute(temp,score);
		}
		
		override public function update(t:Number):void
		{
			super.update(t);
			lblScore.text = StringUtil.substitute(temp,++score);
		}
	}
}