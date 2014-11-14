package com.shrimp.demo.resource
{
	public class ResourcePath
	{
		public function ResourcePath()
		{
		}
		
		private static const Basepath:String="resource/";
		
		public static function getBGImage(id:String):String
		{
			return Basepath+"bg/"+id+".jpg";	
		}
	}
}