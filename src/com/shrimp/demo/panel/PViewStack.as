package com.shrimp.demo.panel
{
	import com.shrimp.framework.ui.container.Box;
	import com.shrimp.framework.ui.controls.Label;
	import com.shrimp.framework.ui.controls.TabBar;
	import com.shrimp.framework.ui.controls.ViewStack;
	import com.shrimp.framework.ui.layout.VerticalLayout;
	import com.shrimp.framework.utils.ArrayList;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	public class PViewStack extends BasePanel
	{
		public function PViewStack(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		protected var vs:ViewStack;
		
		protected var tab:TabBar;
		
		protected var tab2:TabBar;
		
		override protected function createChildren():void
		{
			super.createChildren();
			vs= new ViewStack(this,20,20);
			
			var box1:Box = new Box();
			var label:Label = new Label(box1);
			label.text = "这个是box1的label";
			
			var box2:Box = new Box();
			var label2:Label = new Label(box2);
			label2.text = "这个是box2的label";
			
			var box3:Box = new Box();
			var label3:Label = new Label(box3);
			label3.text = "这个是box3的label";
			
			
			vs.addChild(box1);
			vs.addChild(box2);
			vs.addChild(box3);
			
			vs.selectedIndex=0;
			
			tab = new TabBar(this,20,200);
			tab.data = new ArrayList(["标签1","标签2","标签3"]);
			tab.addEventListener(Event.SELECT,onTabSelect);
			
			tab2 = new TabBar(this,200,20);
			tab2.data = new ArrayList(["标签1","标签2","标签3"]);
			tab2.direction = TabBar.VERTICAL;
			tab2.addEventListener(Event.SELECT,onTabSelect);
			
		}
		
		protected function onTabSelect(event:Event):void
		{
			var tb:TabBar = event.target as TabBar;
			if(tb == this.tab)
			{
				tab2.selectedIndex = tb.selectedIndex;
			}
			else if(tb == this.tab2)
			{
				tab.selectedIndex = tb.selectedIndex;
			}
			
			vs.selectedIndex = tab.selectedIndex;
//			updateDisplayList();
		}
	}
}