package com.haroel.util
{
	import flash.display.DisplayObjectContainer;
	import flash.system.ApplicationDomain;

	public class Util
	{
		public function Util()
		{
		}
		/**
		 * 获取flash资源
		 * @param fileName文件名
		 * @param className文件中的元件名
		 * @return 
		 * 
		 */		
//		public static function getResSwf(fileName:String,className:String):Class
//		{
//			var obj:Object = ApplicationDomain(getRes(fileName))
//			var cls:Class =  obj .getDefinition(className) as Class;
//			return cls;
//		}
		
		public static function removeAllChildren(container:DisplayObjectContainer):void
		{
			while(container.numChildren > 0)
			{
				container.removeChildAt(0);
			}
		}
	}
}