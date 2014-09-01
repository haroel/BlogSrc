/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class BlogViewUI extends View {
		public var btn_left:Button;
		public var btn_right:Button;
		public var m_panel:Panel;
		public var m_linkBtn:LinkButton;
		public var m_pageLabel:Label;
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Button skin="png.comp.btn_arrow_left" x="371" y="458" stateNum="3" var="btn_left"/>
			  <Button skin="png.comp.btn_arrow_right" x="434" y="458" stateNum="3" var="btn_right"/>
			  <Panel x="3" y="1" width="794" height="452" vScrollBarSkin="png.comp.vscroll" var="m_panel"/>
			  <LinkButton label="内容来自我的cnblogs" x="676" y="453" var="m_linkBtn" buttonMode="true"/>
			  <Label x="395" y="457" width="35" height="18" autoSize="none" align="center" var="m_pageLabel"/>
			</View>;
		public function BlogViewUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}