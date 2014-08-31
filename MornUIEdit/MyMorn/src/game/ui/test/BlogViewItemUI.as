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
			  <Label x="1" y="1" width="76" height="22" size="16" bold="true" autoSize="left" var="titleLabel"/>
			  <Label x="9" y="27" multiline="true" wordWrap="true" width="757" height="42" autoSize="left" indent="20" isHtml="true" leading="5" letterSpacing="0.5" mouseEnabled="false" mouseChildren="true" var="desLabel"/>
			  <Image skin="png.comp.img_ref" x="595" y="61" alpha="0.8"/>
			  <Image skin="png.comp.img_commit" x="652" y="63" alpha="0.5"/>
			  <Image skin="png.comp.img_read" x="705" y="64" alpha="0.5"/>
			  <Label x="614" y="60" var="m_refLabel"/>
			  <Label x="670" y="60" var="m_comLabel"/>
			  <Label x="725" y="60" var="m_readLabel"/>
			  <Label x="424" y="62" width="156" height="22" var="dataLabel"/>
			</View>;
		public function BlogViewItemUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}