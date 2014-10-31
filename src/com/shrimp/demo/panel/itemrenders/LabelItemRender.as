package com.shrimp.demo.panel.itemrenders
{
	import com.shrimp.framework.ui.controls.Image;
	import com.shrimp.framework.ui.controls.ItemRender;
	import com.shrimp.framework.ui.controls.Label;
	
	import flash.display.DisplayObjectContainer;
	
	public class LabelItemRender extends ItemRender
	{
		public function LabelItemRender(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
			height=60;
		}
		
		private var lblName:Label;
		
		private var lblAge:Label;
		
		private var imgIcon:Image;
		
		override protected function createChildren():void
		{
			super.createChildren();
			imgIcon = new Image(this);
			imgIcon.width = imgIcon.height = 20;
			lblName = new Label(this,30);
			
			lblAge = new Label(this,100);
		}
		
		private var obj:Object ;
		override public function set data(value:*):void
		{
			super.data = value;
			
			obj = value as Object;
			
			lblName.text = obj.name;
			lblName.fontSize = 40;
			lblAge.text = obj.age+'';
			imgIcon.source = "http://i.maxthonimg.com/v5/common/search-1/baidu.gif";
			
//			trace("set data:::",index,",lblName.text:",lblName.text,",obj.name:",obj.name,",lblAge.text:",lblAge.text,"obj.age:",obj.age)
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
//			trace("commitProperties",index);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
//			trace("updateDisplayList",index);
		}
	}
}