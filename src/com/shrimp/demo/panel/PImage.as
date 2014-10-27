package com.shrimp.demo.panel
{
	import com.shrimp.demo.resource.EmbeddResource;
	import com.shrimp.framework.ui.controls.Image;
	
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	
	/**
	 *	图片示例 
	 * @author Sol
	 * 
	 */	
	public class PImage extends BasePanel
	{
		public function PImage(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		protected var img1:Image;
		protected var img2:Image;
		protected var img3:Image;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			//远程加载
			img1 = new Image(this,50,50);
			img1.source = "http://bbs.9ria.com/data/attachment/common/images/forumicons/ico_08.png";
			
			//本地嵌入
			img2 = new Image(this,200,50);
			img2.source = EmbeddResource.PANEL_BORDER;
			
			//九宫格
			img3 = new Image(this,50,140);
			img3.scale9Rect = new Rectangle(20,20,30,30);
			img3.source = EmbeddResource.PANEL_BORDER;
			img3.width = 250;
			img3.height = 120;
		}
		
	}
}