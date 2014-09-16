package com.haroel.view
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	import com.haroel.events.DDEvent;
	import com.haroel.events.UIEventDispatcher;
	import com.haroel.model.MenuItemVO;
	import com.haroel.ui.IMView;
	import com.haroel.ui.MAbilityView;
	import com.haroel.ui.MBlogView;
	import com.haroel.ui.MExpView;
	import com.haroel.ui.MHelpView;
	import com.haroel.ui.MProfileView;
	
	import flash.display.DisplayObject;
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
			_material.y = -_material.height - 30;
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
			this.info = _currentId;
//			this.setView();
		}
		
		public function playMoveInAction():void
		{
			_isInAnimation = true;
			TweenLite.to(_material, 0.5, {y:5, motionBlur:true, ease:Cubic.easeInOut,onComplete:moveInCompleteHandler});
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
		
		public function set info(value:int):void
		{
			if (_currentId == value)
			{
				return;
			}
			_currentId = value;
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
			if (container.numChildren > 0)
			{
				var child:DisplayObject = container.getChildAt(0);
				container.removeChild(child);
			}
			switch(_currentId)
			{
				case 1:
				{
					container.addChildAt(new MProfileView(_currentId),0);
					break;
				}
				case 4:
				{
					container.addChildAt(new MAbilityView(_currentId),0);
					break;
				}
				case 5:
				{
					container.addChildAt(new MExpView(_currentId),0);
					break;
				}
				case 6:
				{
					container.addChildAt(new MBlogView(_currentId),0);
					break;
				}
				case 7:
				{
					container.addChildAt(new MHelpView(_currentId),0);
					break;
				}
				default:
				{
					container.addChildAt(new MProfileView(_currentId),0);
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