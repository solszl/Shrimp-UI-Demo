package com.shrimp.demo.resource
{
	public class EmbeddResource
	{
		[Embed(source="/../arts/embeddAssets/closeBtn.png")]
		public static const CLOSE_BTN:Class;
		
		[Embed(source="/../arts/embeddAssets/common_bg.png", scaleGridTop="30", scaleGridBottom="50", scaleGridLeft="30", scaleGridRight="50")]
		public static const PANEL_BORDER:Class;
		
		[Embed(source="/../arts/embeddAssets/dialog_bg.png")]
		public static const DIALOG_BORDER:Class;
		
		[Embed(source="/../arts/boneAssets/bone.png", mimeType="application/octet-stream")]
		public static const Bones_Data:Class;
		
		[Embed(source="/../arts/camera/bg001.jpg")]
		public static const Camera_BG:Class;
	}
}