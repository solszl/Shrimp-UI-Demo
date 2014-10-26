package com.shrimp.demo.panel
{
	import com.shrimp.framework.ui.container.HBox;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.utils.StringUtil;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 *	按钮示例 
	 * @author Sol
	 * 
	 */	
	public class PButton extends BasePanel
	{
		public function PButton(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		
		protected var btn1:Button;
		protected var btn2:Button;
		protected var btn3:Button;
		protected var btn4:Button;
		protected var btn5:Button;
		
		private var hbox:HBox;
		
		private var count:int = 0;
		private var temp:String="点击{0}次";
		override protected function createChildren():void
		{
			super.createChildren();
			
			hbox = new HBox(this);
			hbox.verticalCenter=0;
			hbox.horizontalCenter=0;
			hbox.verticalAlign = "middle";
			
			btn1 = new Button(hbox);
			btn1.label = "普通按钮";
			btn1.scale9Rect = new Rectangle(4,4,12,12);
			
			btn5 = new Button(hbox);
			btn5.skinClass = "http://bbs.9ria.com/data/attachment/common/images/forumicons/ico_08.png";
			btn5.label="a"

			btn2 = new Button(hbox);
			btn2.scale9Rect = new Rectangle(4,4,12,12);
			btn2.label = "按钮禁用";
			btn2.enabled = false;
			
			btn3 = new Button(hbox);
			btn3.scale9Rect = new Rectangle(4,4,12,12);
			btn3.label = "点击0次";

			btn4 = new Button(hbox);
			btn4.scale9Rect = new Rectangle(4,4,12,12);
			btn4.label = "右下对齐";
			btn4.width = 100;
			btn4.height = 50;
			btn4.labelAlign = "right-bottom";
			
			hbox.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			if(event.target is Button)
			{
				switch(event.target)
				{
					case btn3:
						btn3.label = StringUtil.substitute(temp,++count);
						break;
				}
			}
		}
	}
}