package com.haroel.ui
{
	import com.haroel.model.MBlogInfoVO;
	
	import flash.events.MouseEvent;
	
	import morn.core.components.Image;
	import morn.core.components.Label;
	import morn.core.components.View;
	import morn.core.handlers.Handler;
	
	public class BlogItemRenderer extends View
	{
		
//		<View width="780" height="90" sceneColor="0xffffff" layers="1,1,1,0,第 1 层;2,1,1,0,第 2 层">
//			<Image skin="png.comp.img_blogview_bg" x="0" y="0" layer="2" sizeGrid="5,5,10,20" width="779" height="91" var="m_bg"
//visible="false"/>
//			<Label styleSkin="png.comp.label" x="1" y="1" layer="1" width="76" height="22" size="16" bold="true" autoSize="left"
//var="titleLabel"/>
//			<Label styleSkin="png.comp.label" x="9" y="27" layer="1" multiline="true" wordWrap="true" width="757" height="42" 
//autoSize="left" indent="20" isHtml="true" leading="5" letterSpacing="0.5" mouseEnabled="false" mouseChildren="true" var="desLabel"/>
//			<Image skin="png.comp.img_ref" x="595" y="61" layer="1" alpha="0.8"/>
//			<Image skin="png.comp.img_commit" x="652" y="63" layer="1" alpha="0.5"/>
//			<Image skin="png.comp.img_read" x="705" y="64" layer="1" alpha="0.5"/>
//			<Label styleSkin="png.comp.label" x="614" y="60" layer="1" var="m_refLabel"/>
//			<Label styleSkin="png.comp.label" x="670" y="60" layer="1" var="m_comLabel"/>
//			<Label styleSkin="png.comp.label" x="725" y="60" layer="1" var="m_readLabel"/>
//			<Label styleSkin="png.comp.label" x="424" y="62" layer="1" width="156" height="22" var="dataLabel"/>
//		  </View>
//		new Image
		public var m_bg:Image = null;
		public var titleLabel:Label;
		public var desLabel:Label;
		
		public var m_refLabel:Label;
		public var m_comLabel:Label;
		public var m_readLabel:Label;
		public var dataLabel:Label;

		private var _data:MBlogInfoVO = null;
		public static const HEIGHT:Number = 90;
		
		public function BlogItemRenderer()
		{
			super();
		}
		override protected function createChildren():void
		{			
			App.loader.loadTXT("uiXml/BlogViewItem.xml",new Handler(completeHandler));
		}
		private function completeHandler(data:String):void
		{
			this.createView(new XML(data));
			this.setInfo(_data);
			this.addEventListener(MouseEvent.ROLL_OUT,mouseHandler);
			this.addEventListener(MouseEvent.ROLL_OVER,mouseHandler);
			
			function mouseHandler(evt:MouseEvent):void
			{
				switch (evt.type)
				{
					case MouseEvent.ROLL_OUT:
					{
						m_bg.visible = false;
						break;
					}
					case MouseEvent.ROLL_OVER:
					{
						m_bg.visible = true;
						break;
					}

				}
			}
		}
		public function setInfo(value:MBlogInfoVO):void
		{
			if (value == null)
			{
				return;
			}
			_data = value;

			if (m_bg)
			{
				App.render.callLater(delayFuc);

			}
		}
		private function delayFuc():void
		{
			this.titleLabel.text = _data.title;	
			this.desLabel.text = _data.summary;
			this.m_refLabel.text = _data.diggs.toString();
			this.m_readLabel.text = _data.views.toString();
			this.m_comLabel.text = _data.comments.toString();
			var arr:Array =  _data.publishedDate.split("T");
			dataLabel.text = "posted @ " + arr[0];
		}
	}
}