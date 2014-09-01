package com.haroel.ui
{
	import com.haroel.model.MBlogDataProxy;
	import com.haroel.util.Hash;
	
	import morn.core.components.Button;
	import morn.core.components.Label;
	import morn.core.components.LinkButton;
	import morn.core.components.Panel;
	import morn.core.components.View;
	import morn.core.handlers.Handler;
	
	public class MBlogView extends View
	{
		public var m_panel:Panel;
		public var btn_left:Button;
		public var btn_right:Button;
		public var m_linkBtn:LinkButton;
		public var m_pageLabel:Label;
		
		public var _currentPageIndex:int = -1;
		
		public const PAGE_SIZE:int = 5;
		//
		private var blogHash:Hash = new Hash();
		
		private var pageItemHash:Hash = new Hash();
		
		public function MBlogView()
		{
			super();
		}
		override protected function createChildren():void
		{			
			App.loader.loadTXT("uiXml/BlogView.xml",new Handler(completeHandler));
		}
		private function completeHandler(data:String):void
		{
			this.createView(new XML(data));
			
			this.pageIndex = 1;
			btn_left.clickHandler = new Handler(funcClick,[1]);
			btn_right.clickHandler = new Handler(funcClick,[3]);
			m_linkBtn.clickHandler = new Handler(funcClick,[4]);
			
			function funcClick(tag:int):void
			{
				trace(tag);
				switch (tag)
				{
					case 1:
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
		public function set pageIndex(value:int):void
		{
			if (_currentPageIndex == value)
			{
				return;
			}
			_currentPageIndex = value;
			var url:String = "http://wcf.open.cnblogs.com/blog/u/howeho/posts/"+ _currentPageIndex + "/" + PAGE_SIZE;
			MBlogDataProxy.getInstance().loadDataByUrl(url,false,new Handler(callBackFuc));
		}
		private function callBackFuc(...data):void
		{
			m_pageLabel.text = _currentPageIndex.toString();
			
			var l:int = data.length;
			for (var i:int = 0;i < l;i++)
			{
				var id:int = data[i];
				var viewItem:BlogItemRenderer = pageItemHash.getItem(id) as BlogItemRenderer;
				if (viewItem)
				{
					viewItem.setInfo(MBlogDataProxy.getInstance().getBlogInfoById(id));
				}
				else
				{
					viewItem = new BlogItemRenderer();
					m_panel.addElement(viewItem,5,viewItem.height*i);
					viewItem.setInfo(MBlogDataProxy.getInstance().getBlogInfoById(id));
				}
			}
		}
	}
}






