/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class rssUI extends View {
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Panel x="12" y="11" width="775" height="460" vScrollBarSkin="png.comp.vscroll"/>
			</View>;
		public function rssUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}