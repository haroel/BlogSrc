package com.haroel.view
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	import com.haroel.events.DDEvent;
	import com.haroel.events.UIEventDispatcher;
	import com.haroel.model.MenuItemVO;
	import com.haroel.ui.MAbilityView;
	import com.haroel.ui.MProfileView;
	
	import flash.display.MovieClip;
	import flash.events.Event;


	public class PopUpPanel
	{
		private var _material:MovieClip;
		
		private var container:MovieClip;
		private var _currentId:int = -1;
		private var _isInAnimation:Boolean = false;
		public function PopUpPanel()
		{
			super();
			init();
		}
		private function init():void
		{
			
			var cls:Class = App.asset.getClass(ResourceConfig.CLS_MPANEL);
			_material = new cls();
			container = (MovieClip)(_material.m_container);
			_material.x = (Main.stageWidth - _material.width)/2;
			_material.y = -_material.height;
			_material.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
//			_material.blendShader
			function removeHandler(evt:Event):void
			{
				_material.removeEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
				
				UIEventDispatcher.getInstance().dispatchEvent(new DDEvent(DDEvent.POPUPVIEW_REMOVE,null));
			}
//			(SimpleButton)(_material.m_closeBtn).addEventListener(MouseEvent.CLICK,closePanel);
			
		}
		private function moveInCompleteHandler():void
		{
			_isInAnimation = false;
			
			this.setView();
		}
		
		public function playMoveInAction():void
		{
			_isInAnimation = true;
			TweenLite.to(_material, 0.5, {y:0, motionBlur:true, ease:Cubic.easeInOut,onComplete:moveInCompleteHandler});
		}
		
		public function playMoveOutAction():void
		{			
			_isInAnimation = true
			TweenLite.to(_material,0.5,{y:-_material.height,onComplete:removeNode});
			function removeNode():void
			{
				_isInAnimation = false;
				_material.parent.removeChild(_material);
			}
		}
		
		public function set info(value:MenuItemVO):void
		{
			if (_currentId == value.id)
			{
				return;
			}
			_currentId = value.id;
			if(_isInAnimation)
			{
				return;
			}
			else
			{
				this.setView();
			}
		}
		private　function setView():void
		{
			while(container.numChildren > 0)
			{
				container.removeChildAt(0);
			}
			switch(_currentId)
			{
				case 1:
				{
					container.addChild(new MProfileView());
					break;
				}
				case 2:
				{
					container.addChild(new MAbilityView());
					break;
				}
				default:
				{
					container.addChild(new MProfileView());
					break;
				}
			}
		}
		public function get material():MovieClip
		{
			return _material;
		}

	}
}