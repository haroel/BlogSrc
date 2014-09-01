/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class BlogViewItemUI extends View {
		public var m_bg:Image;
		public var titleLabel:Label;
		public var desLabel:Label;
		public var m_refLabel:Label;
		public var m_comLabel:Label;
		public var m_readLabel:Label;
		public var dataLabel:Label;
		protected static var uiXML:XML =
			<View width="780" height="90">
			  <Image skin="png.comp.img_blogview_bg" x="0" y="0" sizeGrid="5,5,10,20" width="779" height="91" var="m_bg" visible="false"/>
			  <Label x="1" y="1" width="771" height="22" size="16" bold="true" autoSize="left" var="titleLabel"/>
			  <Label x="9" y="27" multiline="true" wordWrap="true" width="761" height="55" autoSize="left" indent="20" isHtml="true" leading="5" letterSpacing="0.5" mouseEnabled="false" mouseChildren="true" var="desLabel"/>
			  <Image skin="png.comp.img_ref" x="575" y="63" alpha="0.8"/>
			  <Image skin="png.comp.img_commit" x="647" y="66" alpha="0.5" width="15" height="12"/>
			  <Image skin="png.comp.img_read" x="697" y="67" alpha="0.5"/>
			  <Label x="593" y="62" var="m_refLabel" width="50" height="20" autoSize="left" text="11"/>
			  <Label x="664" y="62" var="m_comLabel" width="50" height="20" text="11" autoSize="left"/>
			  <Label x="715" y="62" var="m_readLabel" width="58" height="20" text="11"/>
			  <Label x="321" y="60" width="253" height="22" var="dataLabel" autoSize="right"/>
			</View>;
		public function BlogViewItemUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}