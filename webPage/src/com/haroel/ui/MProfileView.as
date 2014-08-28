package com.haroel.ui
{
	import com.greensock.TweenMax;
	
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import morn.core.components.Image;
	import morn.core.components.Label;
	import morn.core.components.LinkButton;
	import morn.core.components.View;
	import morn.core.events.UIEvent;
	import morn.core.handlers.Handler;

	public class MProfileView extends View
	{
//		public var m_collBtn:LinkButton;
		public var m_avatar:Image;
		public var m_weiboLabel:Label;
		public var m_emailBtn:LinkButton;
		public var m_wxBtn:LinkButton;
		public var m_cnBtn:LinkButton;

		public function MProfileView()
		{
			super();
		}
		override protected function createChildren():void
		{			
			App.loader.loadTXT("uiXml/Profile.xml",new Handler(onComplete));
		}
		private function onComplete(content:String):void
		{
			var contentXml:XML = new XML(content);
			createView(contentXml);
			this.visible = false;
			m_avatar.addEventListener(UIEvent.IMAGE_LOADED,imgLoadedHandler);
			
			m_emailBtn.clickHandler = new Handler(linkClickHandler,[1]);
			m_wxBtn.clickHandler = new Handler(linkClickHandler,[2]);
			m_cnBtn.clickHandler = new Handler(linkClickHandler,[3]);
			
			function linkClickHandler(tag:int):void
			{
				switch(tag)
				{
					case 1://邮件
					{
						try
						{
							navigateToURL(new URLRequest("mailto:" + m_emailBtn.label), '_self');
						}
						catch(e:Error)
						{
							trace("Error occurred!");
						}
						break;
					}
					case 2://微信
					{
						
						break;
					}
					case 3://cnblog
					{
						try
						{
							navigateToURL(new URLRequest(m_cnBtn.label), '_blank');
						}
						catch(e:Error)
						{
							trace("Error occurred!");
						}
						break;
					}
					default:
						break;
				}
			}
		}

		private function imgLoadedHandler(evt:UIEvent):void
		{
			if (m_avatar.bitmapData)
			{
				m_avatar.height = m_avatar.bitmapData.height * m_avatar.width/m_avatar.bitmapData.width;
				m_avatar.filters = [new BlurFilter(20,20)];
				TweenMax.to(m_avatar, 0.5, {blurFilter:{blurX:0,blurY:0}});
				
				this.visible = true;
			}
		}
		 override public function remove():void
		 {
//			 m_collBtn.removeEventListener(MouseEvent.CLICK,clickHandler);
			 m_avatar.removeEventListener(UIEvent.IMAGE_LOADED,imgLoadedHandler);
			 super.remove();
		 }
	}
}