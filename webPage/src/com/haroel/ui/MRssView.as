package com.haroel.ui
{
	import com.haroel.model.ModelLocator;
	
	import morn.core.components.View;
	import morn.core.handlers.Handler;
	
	public class MRssView extends View
	{
		private var rssDatas:Array = [];

		public function MRssView()
		{
			super();
		}
		override protected function createChildren():void
		{
//			new ModelLocator
			App.loader.loadTXT(ModelLocator.RSS_URL,new Handler(onComplete));
		}
		private function onComplete(content:String):void
		{
			var contentXml:XML = new XML(content);
			trace(contentXml)
		}
	}
}