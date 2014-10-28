package com.shrimp.demo.panel
{
	import com.shrimp.framework.ui.container.VBox;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.ui.controls.Label;
	import com.shrimp.framework.ui.controls.core.Style;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 *	文本示例 
	 * @author Sol
	 * 
	 */	
	public class PLabel extends BasePanel
	{
		public function PLabel(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		protected var lbl1:Label;
		protected var lbl2:Label;
		protected var lbl3:Label;
		protected var lbl4:Label;
		
		protected var btn1:Button;
		protected var btn2:Button;
		
		override protected function createChildren():void
		{
			super.createChildren();
			var vb:VBox = new VBox(this);
			vb.horizontalCenter =0;
			vb.verticalCenter =0;
			
			lbl1 = new Label(vb);
			lbl2 = new Label(vb);
			lbl3 = new Label(vb);
			lbl4 = new Label(vb);
			
			lbl1.text="1:默认文本";
			
			lbl2.color = 0xFF0000;
			lbl2.bold = true;
			lbl2.underline = true;
			lbl2.align = "right";
			lbl2.width = 100;
			//为了能看出来右对齐
			lbl2.opaqueBackground = 0x0C0C0C;
			lbl2.text = "2:右对齐";
			
			lbl3 = new Label(vb);
			lbl3.width = 80;
			lbl3.text = "3:宽度不够的时候, 查看显示效果";
			
			lbl4 = new Label(vb);
			
			btn1 = new Button(this);
			btn1.label = "开始";
			btn1.addEventListener(MouseEvent.CLICK,onMouseClick);
			
			btn2 = new Button(this,100);
			btn2.label = "停止";
			btn2.addEventListener(MouseEvent.CLICK,onMouseClick);
				
				
		}
		
		//用来计时的
		private var sp:Shape;
		
		protected function onMouseClick(event:MouseEvent):void
		{
			sp||=new Shape();
			switch(event.target)
			{
				case btn1:
					sp.addEventListener(Event.ENTER_FRAME,onShapeEnterFrame);
					break;
				case btn2:
					sp.removeEventListener(Event.ENTER_FRAME,onShapeEnterFrame);
			}
		}
		
		protected function onShapeEnterFrame(event:Event):void
		{
			lbl4.color = Math.random()*0xFFFFFF;
			lbl4.bold = Math.random()<0.5;
			lbl4.underline = Math.random()*0.5;
			lbl4.alpha = Math.random();
			lbl4.fontSize = Math.random()*6+Style.fontSize;
			lbl4.text = Math.random().toFixed(4);
		}
		
		override public function hide():void
		{
			super.hide();
			if(!sp)
			{
				return;
			}
			sp.removeEventListener(Event.ENTER_FRAME,onShapeEnterFrame);
		}
		
		
	}
}