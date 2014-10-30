package com.shrimp.demo.panel.itemrenders
{
	import com.shrimp.framework.ui.controls.ItemRender;
	import com.shrimp.framework.ui.controls.Label;
	
	import flash.display.DisplayObjectContainer;
	
	public class LabelItemRender extends ItemRender
	{
		public function LabelItemRender(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var lblName:Label;
		
		private var lblAge:Label;
		
		override protected function createChildren():void
		{
			super.createChildren();
			lblName = new Label(this);
			
			lblAge = new Label(this,100);
		}
		
		private var obj:Object ;
		override public function set data(value:*):void
		{
			super.data = value;
			
			obj = value as Object;
			
			lblName.text = obj.name;
			lblAge.text = obj.age+'';
			
			trace("set data:::",index,",lblName.text:",lblName.text,",obj.name:",obj.name,",lblAge.text:",lblAge.text,"obj.age:",obj.age)
		}
	}
}