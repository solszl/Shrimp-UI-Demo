package com.shrimp.demo.constant
{
	public class PanelType
	{
		//基础偏移量
		private static var BASE:int = 50;
		
		//按钮
		public static var PANEL_BUTTON_DEMO:int = ++BASE;
		//复选框
		public static var PANEL_CHECKBOX_DEMO:int = ++BASE;
		//图片
		public static var PANEL_IMAGE_DEMO:int = ++BASE;
		//文本
		public static var PANEL_LABEL_DEMO:int = ++BASE;
		//文本域
		public static var PANEL_TEXT_DEMO:int = ++BASE;
		
		public static var PANEL_VIEWSTACK_DEMO:int = ++BASE;
		
		public static var PANEL_DATABOX_DEMO:int = ++BASE;
		/**	骨头*/
		public static var PANEL_BONE_DEMO:int = ++BASE;
		
		public function PanelType()
		{
		}
	}
}