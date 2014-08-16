/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class SkillPageUI extends View {
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Image skin="png.comp.img_skillbar" x="67" y="123" width="669" height="182" smoothing="true" alpha="0.07"/>
			</View>;
		public function SkillPageUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}