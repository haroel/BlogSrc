/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class BlogViewUI extends View {
		public var btn_left:Button;
		public var btn_refresh:Button;
		public var btn_right:Button;
		public var m_panel:Panel;
		public var m_linkBtn:LinkButton;
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Button skin="png.comp.btn_arrow_left" x="319" y="446" stateNum="1" var="btn_left" scaleX="0.8" scaleY="0.8"/>
			  <Button skin="png.comp.btn_refresh" x="364" y="442" stateNum="1" var="btn_refresh"/>
			  <Button skin="png.comp.btn_arrow_right" x="424" y="448" stateNum="1" var="btn_right" scaleX="0.8" scaleY="0.8"/>
			  <Panel x="3" y="1" width="793" height="440" vScrollBarSkin="png.comp.vscroll" var="m_panel"/>
			  <LinkButton label="内容来自我的cnblogs" x="676" y="453" var="m_linkBtn" buttonMode="true"/>
			</View>;
		public function BlogViewUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}