package com.shrimp.demo.panel.pakour
{
	import com.shrimp.framework.ui.controls.core.Component;
	import com.shrimp.pakour.interfaces.IRender;
	
	import flash.display.DisplayObjectContainer;
	import flash.utils.getQualifiedClassName;
	
	public class BaseRender extends Component implements IRender
	{
		public function BaseRender(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		public function update(t:Number):void
		{
			
		}
		
		public function get type():String
		{
			return getQualifiedClassName(this).split("::")[1];
		}
		
		public function destroy():void
		{
		}
	}
}