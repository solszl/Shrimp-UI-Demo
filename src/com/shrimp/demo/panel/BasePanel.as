package com.shrimp.demo.panel
{
	import com.shrimp.demo.resource.EmbeddResource;
	import com.shrimp.framework.ui.controls.Image;
	import com.shrimp.framework.ui.controls.panel.Panel;
	
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	
	public class BasePanel extends Panel
	{
		public function BasePanel(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		protected var background:Image;
		
		override protected function createChildren():void
		{
			super.createChildren();
			width = 400;
			height = 300;
			
			background = new Image(this,0,0);
			background.scale9Rect = new Rectangle(20,20,30,30);
			background.source = EmbeddResource.PANEL_BORDER;
			background.width = this.width;
			background.height = this.height;
			showCloseBtn = true;
		}
	}
}