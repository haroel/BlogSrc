package com.haroel.ui
{
	import com.greensock.TweenLite;
	import com.haroel.model.PSkillVO;
	import com.haroel.util.Hash;
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import morn.core.components.Panel;
	import morn.core.components.View;
	import morn.core.handlers.Handler;

	public class MAbilityView extends View
	{
		//存储个人技能配置数据
		private static var skillDataArray:Array = [];
		
		public function MAbilityView()
		{
			App.log.debug("MAbilityView()");
			super();
		}
		override protected function createChildren():void
		{		
//			if (skillDataArray.length < 1)
//			{
//				App.loader.loadTXT("uiXml/pskill.xml",new Handler(onComplete));
//			}
//			else
//			{
//				
//			}
			var panel:Panel = new Panel();
			panel.vScrollBarSkin = "png.comp.vscroll";
			panel.width = 820;
			panel.height = 470;
			panel.vScrollBar.showButtons = false;
//			panel.vScrollBar.autoHide = true;
			this.addChild(panel);
			var cls:Class = App.asset.getClass("SkillShowView");
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
		private function onComplete(content:String):void
		{
			var contentXml:XML = new XML(content);
			for each (var xml:XML in contentXml.groups)
			{
				var vo:PSkillVO = new PSkillVO();
				vo.des = xml.@des;
				vo.id = parseInt(xml.@id);
				
				for each (var cXml:XML in xml.item)
				{
					var obj:Object = new Object();
					obj.label = cXml.@label;
					obj.value = parseInt(cXml.@value);
					vo.items.push(obj);
				}
				skillDataArray.push(vo);
			}
			this.createUI();
		}
		
		private function createUI():void
		{
			var tempVO:PSkillVO = skillDataArray[0] as PSkillVO;
			
			var cls:Class = App.asset.getClass("SkillShowView");
			var material:MovieClip = new cls();
			this.addChild(material);
			var posX:Number = 0;
			cls = App.asset.getClass("Skillbar");
			
			var arr1:Array = [];
			var arr2:Array = [];

			var container:MovieClip = material.m_ContentContainer;
			for each(var obj:Object in tempVO.items)
			{
				var bar:MovieClip = new cls();
//				new TextField
				(TextField)(bar.m_label).text = obj.label;
				(MovieClip)(bar.m_barTrack).scaleY = 0;
				
				arr1.push(bar);
				bar.x = posX;
				arr2.push(obj.value);
				container.addChild(bar);
				posX += 50;
			}
//			new TweenLite
			var arr3:Array = [];
			for(var i:int = 0;i < arr2.length;i++)
			{
				arr3.push(0);
			}
			TweenLite.to(arr3, 2, {endArray:arr2,onUpdate:updateFunc});
			function updateFunc():void
			{
				for(var i:int = 0;i < arr1.length;i++)
				{
					var bar:MovieClip = arr1[i];
					(MovieClip)(bar.m_barTrack).scaleY = 1.0 *arr3[i]/100;
				}
			}
		}
			
	}
}