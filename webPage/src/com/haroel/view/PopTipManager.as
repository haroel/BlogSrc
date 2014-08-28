package com.haroel.view
{
	import com.greensock.TweenLite;
	import com.haroel.model.ModelLocator;
	import com.haroel.util.Util;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class PopTipManager
	{
			
		public static function addPopTipView(child:DisplayObject,point:Point,isModal:Boolean = true):void
		{
			var container:Sprite = App.tipsLayer;
			Util.removeAllChildren(App.tipsLayer);
			if (isModal)
			{
				var shape:Shape = new Shape();
//				shape.width = Main.stageWidth;
//				shape.height = Main.stageHeight;
				
				shape.graphics.beginFill(0,0);
				shape.graphics.drawRect(0,0,Main.stageWidth,Main.stageHeight);
				shape.graphics.endFill();
				
				container.addChild(shape);				
			}
			var tipContent:PopTipBG = new PopTipBG();
			tipContent.addView(child,point);
			container.addChild(tipContent);
			tipContent.alpha = 0.6;
//			new TweenLite
			TweenLite.to(tipContent,0.2,{alpha:1});
			container.addEventListener(MouseEvent.CLICK,cleanTips);
			function cleanTips(evt:MouseEvent):void
			{
				container.removeEventListener(MouseEvent.CLICK,cleanTips);
				Util.removeAllChildren(App.tipsLayer);
			}
		}
	}
}

class InnerCls{}