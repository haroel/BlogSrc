package com.haroel.view
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	import morn.core.components.AutoBitmap;
	
	public class PopTipBG extends Sprite
	{
		public function PopTipBG()
		{
			super();
		}
		
		public function addView(child:DisplayObject,p:Point):void
		{
			
			var gap:Number = 8;
			var w:Number = child.width + gap * 2;
			var h:Number = child.height + gap *2;
			
			var cls:Class = App.asset.getClass("poptip_bg");
			var bitmapBg9:AutoBitmap = new AutoBitmap();
			bitmapBg9.bitmapData = new cls();
			bitmapBg9.sizeGrid = [10,10,10,10];
			bitmapBg9.width = w;
			bitmapBg9.height = h;
			bitmapBg9.x = -gap;
			bitmapBg9.y = -gap;
			
			cls = App.asset.getClass("poptip_arrow");
			var arrow:Bitmap = new Bitmap(new cls);
			arrow.smoothing = true;
			arrow.x = -arrow.width - gap + 2;
			arrow.y = h/2 - arrow.height/2;
			
			var con:Sprite = new Sprite();			
			con.addChild(bitmapBg9);		
			con.addChild(arrow);
			var g:GlowFilter = new GlowFilter(0,0.2,13,13);
			con.filters = [g];
			this.addChild(con);
			this.addChild(child);
			
			this.x = p.x + arrow.width + gap;
			this.y = p.y -arrow.y - arrow.height/2;
		}
	}
}