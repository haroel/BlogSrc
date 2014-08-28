package com.haroel.ui
{
	import com.greensock.TweenMax;
	import com.haroel.view.PopTipManager;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
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
			
			m_weiboLabel.addEventListener(MouseEvent.ROLL_OVER,weiboLmouseHandler);
			m_weiboLabel.addEventListener(MouseEvent.ROLL_OUT,weiboLmouseHandler);
			m_weiboLabel.addEventListener(MouseEvent.CLICK,weiboLmouseHandler);

			m_weiboLabel.mouseEnabled = true;

			m_emailBtn.clickHandler = new Handler(linkClickHandler,[1]);
			m_wxBtn.clickHandler = new Handler(linkClickHandler,[2]);
			m_cnBtn.clickHandler = new Handler(linkClickHandler,[3]);
			
			function weiboLmouseHandler(evt:MouseEvent):void
			{
				switch(evt.type)
				{
					case MouseEvent.ROLL_OVER:
					{
						(Label)(evt.target).alpha = 0.8;
						break;
					}
					case MouseEvent.ROLL_OUT:
					{
						(Label)(evt.target).alpha = 1.0;
						break;
					}
					case MouseEvent.CLICK:
					{
						try
						{
							navigateToURL(new URLRequest("http://weibo.com/haroel"), '_blank');
						}
						catch(e:Error)
						{
							trace("Error occurred!");
						}
						break;
					}

				}
			}
			
			function linkClickHandler(tag:int):void
			{
				switch(tag)
				{
					case 1://邮件
					{
						try
						{
							navigateToURL(new URLRequest("mailto:" + m_emailBtn.label), '_blank');
						}
						catch(e:Error)
						{
							trace("Error occurred!");
						}
						break;
					}
					case 2://微信
					{
						var p:Point = m_wxBtn.localToGlobal(new Point(0,0));
						p.x = p.x + m_wxBtn.width;
						p.y = p.y + m_wxBtn.height/2 - 2;
						
						var cls:Class = App.asset.getClass("WeixinMC");
						var mc:MovieClip = new cls();
						
						PopTipManager.addPopTipView(mc,p,true);
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