package com.haroel.ui
{
	import morn.core.components.Panel;
	import morn.core.components.View;
	
	public class MHelpView extends View implements IMView
	{
		private var _id:int = -1;
		public function set id(value:int):void
		{
			_id = value;
		}
		public function get id():int
		{
			return _id;
		}
		public function MHelpView(value:int)
		{
			id = value;
			super();
		}
		override protected function createChildren():void
		{
			var panel:Panel = new Panel();
			panel.vScrollBarSkin = "png.comp.vscroll";
			panel.width = 820;
			panel.height = 470;
			panel.vScrollBar.showButtons = false;
			//			panel.vScrollBar.autoHide = true;
			this.addChild(panel);
			var cls:Class = App.asset.getClass("HelpView");
			panel.visible = false;
			panel.addChild(new cls());
			panel.vScrollBar.visible = false;
			
			App.render.callLater(delayFunc);
			function delayFunc():void
			{
				panel.vScrollBar.visible = false;
				panel.visible = true;
			}
		}
	}
}