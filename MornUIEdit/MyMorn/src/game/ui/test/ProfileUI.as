/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class ProfileUI extends View {
		public var m_desLabel:Label;
		public var m_avatar:Image;
		public var m_collBtn:LinkButton;
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Image skin="png.comp.blank" x="21" y="16" width="760" height="230" alpha="0.15"/>
			  <Label x="22" y="263" width="758" height="201" var="m_desLabel"/>
			  <Image x="600" y="38" width="150" height="188" var="m_avatar" smoothing="true" url="img/avtar.png"/>
			  <Label text="何浩" x="130" y="37" size="16" selectable="true" width="65" height="24" buttonMode="false" underline="false"/>
			  <Label text="所在地" x="314" y="72" bold="true" color="0x333333" width="68" height="23"/>
			  <Label text="出生日期" x="50" y="152" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="中文名" x="49" y="36" bold="true" color="0x333333" width="52" height="24"/>
			  <Label text="毕业院校" x="314" y="34" bold="true" color="0x333333" width="72" height="19"/>
			  <Label text="民族" x="50" y="113" bold="true" color="0x333333" width="55" height="19"/>
			  <Label text="籍贯" x="49" y="73" bold="true" color="0x333333" width="50" height="19"/>
			  <Label text="上海市浦东新区" x="401" y="69" size="16" selectable="true"/>
			  <Label text="湖北省武汉市" x="129" y="73" size="16" selectable="true"/>
			  <Label text="汉族" x="129" y="112" size="16" selectable="true" width="66" height="20"/>
			  <LinkButton label="武汉科技大学" x="400" y="33" labelSize="16" labelBold="false" var="m_collBtn" buttonMode="true"/>
			  <Label text="1987年11月" x="127" y="152" size="16" selectable="true"/>
			  <Label text="职业" x="51" y="194" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="固定工作者" x="130" y="195" size="16" selectable="true"/>
			  <Label text="学历" x="319" y="195" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="本科" x="407" y="196" size="16" selectable="true" toolTip="信息管理于信息系统"/>
			  <Label text="婚姻状态" x="316" y="154" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="已婚" x="407" y="154" size="16" selectable="true" toolTip="信息管理于信息系统"/>
			  <Label text="星座" x="316" y="117" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="天蝎座" x="406" y="115" size="16" selectable="true" toolTip="信息管理于信息系统"/>
			</View>;
		public function ProfileUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}