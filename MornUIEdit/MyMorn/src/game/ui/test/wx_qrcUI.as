/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class wx_qrcUI extends View {
		protected static var uiXML:XML =
			<View width="600" height="400"/>;
		public function wx_qrcUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}