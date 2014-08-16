/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class ProfileUI extends View {
		public var m_avatar:Image;
		public var m_collBtn:LinkButton;
		public var m_desLabel:Label;
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Image skin="png.comp.blank" x="25" y="17" width="753" height="218" alpha="0.1" left="25"/>
			  <Image x="614" y="31" width="150" height="188" var="m_avatar" smoothing="true" url="img/avtar.png"/>
			  <Label text="何浩" x="117" y="41" size="16" selectable="true" width="53" height="24" buttonMode="false" underline="false"/>
			  <Label text="故乡" x="330" y="74" bold="true" color="0x333333" width="68" height="21"/>
			  <Label text="出生日期" x="43" y="145" bold="true" color="0x333333" width="58" height="19"/>
			  <Label text="中文名" x="43" y="42" bold="true" color="0x333333" width="52" height="24"/>
			  <Label text="毕业院校" x="330" y="41" bold="true" color="0x333333" width="72" height="19"/>
			  <Label text="民族" x="44" y="110" bold="true" color="0x333333" width="55" height="19"/>
			  <Label text="籍贯" x="44" y="76" bold="true" color="0x333333" width="50" height="19"/>
			  <Label text="湖北省武汉市江夏区" x="416" y="73" size="16" selectable="true"/>
			  <Label text="湖北省武汉市" x="117" y="74" size="16" selectable="true"/>
			  <Label text="汉族" x="119" y="109" size="16" selectable="true" width="66" height="23"/>
			  <LinkButton label="武汉科技大学" x="416" y="39" labelSize="16" labelBold="false" var="m_collBtn" buttonMode="true"/>
			  <Label text="1987年11月" x="117" y="144" size="16" selectable="true" toolTip="天蝎座"/>
			  <Label text="职业" x="43" y="186" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="固定工作者" x="120" y="184" size="16" selectable="true"/>
			  <Label text="婚姻状态" x="327" y="144" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="本科" x="417" y="183" size="16" selectable="true" width="86" height="26" toolTip="信息管理与信息系统"/>
			  <Label text="所在地" x="329" y="108" bold="true" color="0x333333" width="68" height="21"/>
			  <Label text="上海市浦东新区" x="415" y="107" size="16" selectable="true"/>
			  <Label text="已婚" x="418" y="144" size="16" selectable="true" width="86" height="25"/>
			  <Label text="学历" x="328" y="185" bold="true" color="0x333333" width="56" height="19"/>
			  <Label x="25" y="247" width="754" height="210" isHtml="true" var="m_desLabel"/>
			</View>;
		public function ProfileUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}