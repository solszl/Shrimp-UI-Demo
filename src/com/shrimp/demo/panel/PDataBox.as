package com.shrimp.demo.panel
{
	import com.shrimp.demo.panel.itemrenders.LabelItemRender;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.ui.controls.DataBox;
	import com.shrimp.framework.ui.layout.VerticalLayout;
	import com.shrimp.framework.utils.ArrayList;
	import com.shrimp.framework.utils.ClassFactory;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class PDataBox extends BasePanel
	{
		public function PDataBox(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var db:DataBox;
		
		private var btnCreate:Button;
		override protected function createChildren():void
		{
			super.createChildren();
			db = new DataBox(this,20,20);
			db.itemRender = new ClassFactory(LabelItemRender);
			db.layout = new VerticalLayout();
			
			btnCreate = new Button(this);
			btnCreate.label = "create";
			btnCreate.scale9Rect = new Rectangle(4,4,12,12);
			btnCreate.addEventListener(MouseEvent.CLICK,onBtnClick);
		}
		
		protected function onBtnClick(event:MouseEvent):void
		{
			
			var arr:Array = [];
			var obj:Object;
			for (var i:int = 0; i < 1 ; i++)// Math.ceil(Math.random()*10) 
			{
				obj = {};
				obj.name = "Hello"+i;
				obj.age = i;
				arr.push(obj);
			}
			
			db.dataProvider = new ArrayList(arr);
		}
	}
}