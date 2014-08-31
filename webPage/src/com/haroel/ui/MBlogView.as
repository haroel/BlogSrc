package com.haroel.ui
{
	import morn.core.components.Button;
	import morn.core.components.LinkButton;
	import morn.core.components.Panel;
	import morn.core.components.View;
	import morn.core.handlers.Handler;
	
	public class MBlogView extends View
	{
		public var m_panel:Panel;
		public var btn_left:Button;
		public var btn_right:Button;
		public var btn_refresh:Button;
		public var m_linkBtn:LinkButton;
		
		public var currentPageIndex:int = -1;
		
		public const PAGE_SIZE:int = 5;
		
		public function MBlogView()
		{
			super();
		}
		override protected function preinitialize():void
		{
			App.loader.loadTXT("uiXml/BlogView.xml",new Handler(completeHandler));
			
		}
		private function completeHandler(data:String):void
		{
			this.createView(new XML(data));
			
			btn_left.clickHandler = new Handler(funcClick,[1]);
			btn_refresh.clickHandler = new Handler(funcClick,[2]);
			btn_right.clickHandler = new Handler(funcClick,[3]);
			m_linkBtn.clickHandler = new Handler(funcClick,[4]);
			
			function funcClick(tag:int):void
			{
				switch tag
				{
					case 1:
					{
						
						break;
					}
					case 2:
					{
						
						break;
					}
					case 3:
					{
						
						break;
					}
					case 4:
					{
						
						break;
					}
				}
				
			}
		}
	}
}