package com.haroel.model
{
	import com.haroel.util.Hash;
	import com.haroel.util.MURLLoader;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import flash.utils.ByteArray;
	
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
						
			var request:URLRequest = new URLRequest();
//			request.url = "http://feed.cnblogs.com/blog/u/147303/rss";
			request.url = url;
			request.method = URLRequestMethod.GET;
			
//			var l:Loader = new Loader();
//			l.contentLoaderInfo.addEventListener(Event.COMPLETE,loaderComplete);
//			l.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,httpStatusHandler);
//			l.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
//			l.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progress);
//			var loaderContext:LoaderContext = new LoaderContext(false);
//			loaderContext.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
////			new SecurityDomain
//			loaderContext.securityDomain = SecurityDomain.currentDomain;
//			l.load(request,loaderContext);
//			function loaderComplete(evt:Event):void
//			{
//				var l:Loader = evt.target as Loader;
//				App.log.debug(l.contentLoaderInfo.bytes);
//			}
//			function errorHandler(evt:IOErrorEvent):void
//			{
////				new LoaderInfo
//				var bytes:ByteArray = (LoaderInfo)(evt.target).bytes;
//				var len:uint = bytes.bytesAvailable;
//				var str:String = bytes.readUTFBytes(len);
//				trace("error");
//			}
//			function progress(evt:ProgressEvent):void
//			{
//				trace("progress");
//			}
//			return;
			var loader:MURLLoader = new MURLLoader();
			loader.param = isrefresh;
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			try
			{
				loader.load(request);
			}
			catch (error:Error)
			{
				trace("Unable to load URL");
			}
			function loaderCompleteHandler(evt:Event):void
			{
				trace(evt.type);
				var loader:MURLLoader = evt.target as MURLLoader; 
				loadBlogContent(loader.param,loader.data);
			}
			function httpStatusHandler (e:Event):void
			{
				App.log.debug("httpStatusHandler:" + e);
			}
			function securityErrorHandler (e:Event):void
			{
				App.log.debug("securityErrorHandler:" + e);
			}
			function ioErrorHandler(e:Event):void
			{
				App.log.debug("ioErrorHandler: " + e);
			}
//			App.loader.loadTXT(url,new Handler(loadBlogContent,[isrefresh]));
		}	
		public function getBlogInfoById(id:int):MBlogInfoVO
		{
			return blogsHash.getItem(id) as MBlogInfoVO;
		}
		private function loadBlogContent(isrefresh:Boolean,data:String):void
		{
			App.log.debug(data);
			
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