package com.haroel.model
{
	import com.haroel.util.Hash;
	
	import morn.core.handlers.Handler;

	public class MBlogDataProxy
	{
		private static var _instance:MBlogDataProxy = null;
		
		private var callBackHandler:Handler = null;

		private var authorInfo:MBlogInfoAuthor = null;
		
		private var blogsHash:Hash = new Hash();
		
		public function MBlogDataProxy(innerCls:InnerCls)
		{
			if (innerCls == null)
			{
				throw new Error("Singleton Class");
			}
		}
		
		public static function getInstance():MBlogDataProxy
		{
			if(_instance == null)
			{
				_instance = new MBlogDataProxy(new InnerCls());
			}
			return _instance;
		}
		public function dispose():void
		{
			authorInfo = null;
			blogsHash.removeAllItems();
		}
		public function loadDataByUrl(url:String,isrefresh:Boolean,callback:Handler):void
		{
			this.callBackHandler = callback;
			App.loader.loadTXT(url,new Handler(loadBlogContent,[isrefresh]));
		}	
		public function getBlogInfoById(id:int):MBlogInfoVO
		{
			return blogsHash.getItem(id) as MBlogInfoVO;
		}
		private function loadBlogContent(isrefresh:Boolean,data:String):void
		{
			var xml:XML = new XML(data);
			var ns:Namespace = new Namespace("http://www.w3.org/2005/Atom");  
	
			if (authorInfo == null)
			{
				authorInfo = new MBlogInfoAuthor();
				authorInfo.logoUrl = xml.ns::logo;
				authorInfo.nickName = xml.ns::author.ns::name;
				authorInfo.mainUrl = xml.ns::author.ns::uri;
				authorInfo.postcount = xml.ns::postcount;
				authorInfo.areaTitle = xml.ns::title;
			}
			var arr:Array = [];
			for each (var entry:XML in xml.ns::entry)
			{
				var info:MBlogInfoVO = new MBlogInfoVO();
				info.id = entry.ns::id;
				info.title = entry.ns::title;
				info.summary = entry.ns::summary;
				info.publishedDate = entry.ns::published;
				info.linkUrl = entry.ns::link.@href;
				info.diggs = entry.ns::diggs;
				info.comments = entry.ns::comments;
				info.views = entry.ns::views;
				
				if (isrefresh)
				{
					blogsHash.removeItem(info.id);
					blogsHash.addItem(info.id,info);
				}
				else
				{
					if (!blogsHash.hasItem(info.id))
					{
						blogsHash.addItem(info.id,info);
					}
				}
				arr.push(info.id);
			}			
			if (callBackHandler)
			{
				callBackHandler.executeWith(arr);
			}
		}
	}
}

class InnerCls{}