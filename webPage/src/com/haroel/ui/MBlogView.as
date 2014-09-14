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
	
	public class MBlogView extends View implements IMView
	{
		public var m_panel:Panel;
		public var btn_left:Button;
		public var btn_right:Button;
		public var m_linkBtn:LinkButton;
		public var m_pageLabel:Label;
		
		public var _currentPageIndex:int = -1;
		
		public static const PAGE_SIZE:int = 5;
		//
		private var blogHash:Hash = new Hash();
		
		private var pageItemHash:Hash = new Hash();
		private var _id:int = -1;
		public function set id(value:int):void
		{
			_id = value;
		}
		public function get id():int
		{
			return _id;
		}
		public function MBlogView(value:int)
		{
			id = value;
			super();
		}
		
		override protected function createChildren():void
		{			
			App.loader.loadTXT("uiXml/BlogView.xml",new Handler(completeHandler));
		}
		private function completeHandler(data:String):void
		{
			this.createView(new XML(data));
			
			this.setPageIndex(1);
//			this.pageIndex = 1;
			btn_left.clickHandler = new Handler(funcClick,[1]);
			btn_right.clickHandler = new Handler(funcClick,[3]);
			m_linkBtn.clickHandler = new Handler(funcClick,[4]);
			
			function funcClick(tag:int):void
			{
				switch (tag)
				{
					case 1:
					{
						setPageIndex(_currentPageIndex - 1);
						break;
					}

					case 3:
					{
						setPageIndex(_currentPageIndex + 1);
						break;
					}
					case 4:
					{
						
						break;
					}
				}
				
			}
		}
		public function setPageIndex(value:int):void
		{
			trace("setPageIndex" + value);
			if (value < 1)
			{
				return;
			}
			if (_currentPageIndex == value)
			{
				return;
			}
			_currentPageIndex = value;
			var url:String = "http://wcf.open.cnblogs.com/blog/u/howeho/posts/"+ _currentPageIndex + "/" + MBlogView.PAGE_SIZE;
			MBlogDataProxy.getInstance().loadDataByUrl(url,false,new Handler(callBackFuc));
		}
		private function callBackFuc(...data):void
		{
			m_pageLabel.text = _currentPageIndex.toString();
			
			var l:int = data.length;
			for (var i:int = 0;i < l;i++)
			{
				var id:int = data[i];
				var viewItem:BlogItemRenderer = pageItemHash.getItem(i) as BlogItemRenderer;
				if (viewItem)
				{ 
					viewItem.setInfo(MBlogDataProxy.getInstance().getBlogInfoById(id));
				}
				else
				{
					viewItem = new BlogItemRenderer();
					pageItemHash.addItem(i,viewItem);
					var h:Number = BlogItemRenderer.HEIGHT;
					h = h * i;
					m_panel.addElement(viewItem,5,h);
					viewItem.setInfo(MBlogDataProxy.getInstance().getBlogInfoById(id));
				}
			}
		}
	}
}






