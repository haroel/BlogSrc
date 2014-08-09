package com.haroel.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import morn.core.components.AutoBitmap;
	import morn.core.components.Image;
	import morn.core.components.Label;
	
	
	public class IconItemTips extends Sprite
	{
		private var _bg:Image;
		private var _label:Label;
		private var _inditor:AutoBitmap;
		
		public function IconItemTips()
		{
			super();
			
		}
		private function init():void
		{
//			_bg = new Image();
//			_bg.anchorX = 0.5;
			
			
			_inditor = new AutoBitmap();
			_inditor.anchorX = 0.5;
			
//			this.addChild(_bg):
			this.addChild(_inditor);
			
			_label = new Label();
			this.addChild(_label);
			this._label.skin = "dockItemTip_bg"
		}
		public function set label(str:String):void
		{
			
		}
	}
}