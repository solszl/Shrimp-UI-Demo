package com.shrimp.demo.panel
{
	import com.shrimp.framework.ui.container.VBox;
	import com.shrimp.framework.ui.controls.CheckBox;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	/**
	 *	复选框示例 
	 * @author Sol
	 * 
	 */	
	public class PCheckBox extends BasePanel
	{
		public function PCheckBox(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		
		protected var cb1:CheckBox;
		protected var cb2:CheckBox;
		protected var cb3:CheckBox;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var vbox:VBox = new VBox(this);
			
			cb1 = new CheckBox("",vbox);
			cb1.label = "点点试试";
			
			cb2 = new CheckBox("不可用",vbox);
			cb2.enabled = false;
			
			cb3 = new CheckBox("",vbox);
			
			vbox.addEventListener(MouseEvent.CLICK,onVboxClick);
			vbox.horizontalCenter=0;
			vbox.verticalCenter=0;
		}
		
		protected function onVboxClick(event:MouseEvent):void
		{
			switch(event.target)
			{
				case cb1:
					cb3.label = Math.random().toFixed(2);
					cb3.textField.color = Math.random()*0xFFFFFF;
					break;
			}
		}
	}
}