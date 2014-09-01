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
			<View width="800" height="90">
			  <Image skin="png.comp.img_blogview_bg" x="2" y="0" sizeGrid="5,5,10,20" width="796" height="90" var="m_bg" visible="false"/>
			  <Label x="2" y="1" width="771" height="22" size="16" bold="true" autoSize="left" var="titleLabel" color="0x333333"/>
			  <Label x="4" y="25" multiline="true" wordWrap="true" width="781" height="55" autoSize="left" indent="20" isHtml="true" leading="5" letterSpacing="0.5" mouseEnabled="false" mouseChildren="true" var="desLabel"/>
			  <Image skin="png.comp.img_ref" x="631" y="63" alpha="0.8" width="19" height="16"/>
			  <Image skin="png.comp.img_commit" x="686" y="65" alpha="0.5" width="15" height="12"/>
			  <Image skin="png.comp.img_read" x="730" y="66" alpha="0.5"/>
			  <Label x="648" y="62" var="m_refLabel" width="34" height="18" autoSize="left" text="11"/>
			  <Label x="700" y="62" var="m_comLabel" width="30" height="18" text="11" autoSize="left"/>
			  <Label x="748" y="62" var="m_readLabel" width="33" height="18" text="999"/>
			  <Label x="376" y="58" width="253" height="22" var="dataLabel" autoSize="right"/>
			</View>;
		public function BlogViewItemUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}