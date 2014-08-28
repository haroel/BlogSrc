package com.haroel.view
{
	import flash.display.Sprite;
	import morn.core.components.Label;
	
	public class IconItemTips extends Sprite
	{
		private var _label:Label;
		
		public function IconItemTips()
		{
			super();
			init();
		}
		private function init():void
		{
			//	初始化背景
//			_bg = new AutoBitmap();
//			_bg.bitmapData = App.asset.getBitmapData("dockItemTip_bg");
//			_bg.sizeGrid = [23,0,23,0];
//			_bg.anchorX = 0.5;
//			_bg.anchorY = 0.5;
//			this.addChild(_bg);
			
			
//			_inditor = new AutoBitmap();
//			_inditor.bitmapData = App.asset.getBitmapData("dockItemTip_inditor");
//			_inditor.anchorX = 0.5;
//			_inditor.y = _bg.height/3;
//			this.addChild(_inditor);
			
			_label = new Label();
			_label.color = 0xffffff;
			this.addChild(_label);
		}
		public function set label(str:String):void
		{
			_label.text = str;
			_label.x = -_label.width/2;
			_label.y = -_label.height/2;
			
			var w:Number = 20 + this._label.width;
			var h:Number = 22;
			
			this.graphics.clear();
			this.graphics.beginFill(0x000000,0.5);
			this.graphics.drawRoundRect(-w/2,-h/2,w,h,h,h);
			
			this.graphics.moveTo(-6,h/2);
			this.graphics.lineTo(0,h/2 + 7);
			this.graphics.lineTo(6,h/2);
			this.graphics.endFill();
		}
	}
}