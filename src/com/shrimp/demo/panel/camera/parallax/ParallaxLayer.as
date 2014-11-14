package com.shrimp.demo.panel.camera.parallax
{
	import com.shrimp.demo.resource.EmbeddResource;
	import com.shrimp.demo.resource.ResourcePath;
	import com.shrimp.framework.ui.container.Box;
	import com.shrimp.framework.ui.controls.Image;
	
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	
	public class ParallaxLayer extends Box
	{
		public function ParallaxLayer(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var bg1:Image;
		
		private var bg2:Image;
		
		private var bg3:Image;
		
		private var bgs:Vector.<Image>;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			bg1 = new Image(this);
			bg1.source = ResourcePath.getBGImage("bg001");
			
			bg2 = new Image(this);
			bg2.source = ResourcePath.getBGImage("bg001");
			
			bg3 = new Image(this);
			bg3.source = ResourcePath.getBGImage("bg001");
			
			bgs = new Vector.<Image>();
			bgs.push(bg1);
			bgs.push(bg2);
			bgs.push(bg3);
			
			bg1.height = bg2.height = bg3.height = 768;
		}
		
		private var _viewPort:Rectangle;
		
		public function set viewPort(value:Rectangle):void
		{
			if(!viewPort)
			{
				_viewPort = value;
			}
			else if(_viewPort.equals(value))
			{
				return;
			}
		}
		
		public function get viewPort():Rectangle
		{
			return _viewPort;
		}
		
		public function update(t:Number):void
		{
			trace(viewPort.toString());
			
			manageEndlessLayer();
		}
		
		private function manageEndlessLayer():void
		{
			var tmp:Image;
			var tmp2:Image;
			if(bgs[0].y>0)
			{
				tmp = bgs[0];
				tmp2 = bgs[2];
				
				tmp.y = tmp2.y + tmp2.height;
				
				bgs[0] = bgs[1];
				bgs[1] = tmp2;
				bgs[2] = tmp;
			}
			else if(bgs[2].height<viewPort.height)
			{
				tmp = bgs[0];
				tmp2 = bgs[2];
				tmp2.y = tmp.y - tmp.height;
				bgs[0] = bgs[2];
				bgs[2] = bgs[1];
				bgs[1] = tmp;
			}
		}
	}
}