/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class ProfileUI extends View {
		public var m_avatar:Image;
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Image skin="png.comp.blank" x="21" y="19" width="760" height="288" alpha="0.15"/>
			  <Image x="609" y="38" width="150" height="188" var="m_avatar" smoothing="true" url="img/avtar.png"/>
			  <Label text="何浩" x="129" y="36" size="16" selectable="true" width="65" height="24" buttonMode="false" underline="false" toolTip="英文昵称howe"/>
			  <Label text="所在地" x="314" y="72" bold="true" color="0x333333" width="68" height="23"/>
			  <Label text="出生日期" x="50" y="152" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="中文名" x="49" y="36" bold="true" color="0x333333" width="52" height="24"/>
			  <Label text="毕业院校" x="314" y="34" bold="true" color="0x333333" width="72" height="19"/>
			  <Label text="民族" x="50" y="113" bold="true" color="0x333333" width="55" height="19"/>
			  <Label text="籍贯" x="49" y="73" bold="true" color="0x333333" width="50" height="19"/>
			  <Label text="上海市浦东新区" x="404" y="71" size="16" selectable="true"/>
			  <Label text="湖北省武汉市" x="130" y="73" size="16" selectable="true"/>
			  <Label text="汉族" x="129" y="111" size="16" selectable="true" width="66" height="26"/>
			  <Label text="1987年11月" x="127" y="152" size="16" selectable="true"/>
			  <Label text="职业" x="51" y="194" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="固定工作者" x="129" y="193" size="16" selectable="true"/>
			  <Label text="学历" x="318" y="195" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="本科" x="408" y="193" size="16" selectable="true" toolTip="信息管理与信息系统"/>
			  <Label text="婚姻状态" x="316" y="154" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="已婚" x="407" y="154" size="16" selectable="true"/>
			  <Label text="星座" x="316" y="117" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="天蝎座" x="406" y="116" size="16" selectable="true"/>
			  <Label text="武汉科技大学" x="406" y="33" size="16" selectable="true"/>
			  <Label x="54" y="265" bold="true" color="0x333333" width="35" height="19" text="标签"/>
			  <Label text="本站部分界面采用Morn ui框架开发，感谢@yungzhu为flash开发者提供了如此强大易用的UI框架。" x="20" y="445" width="757" height="27" color="0x999999"/>
			  <Label text="闷骚内敛" x="624" y="262" autoSize="left" background="false" width="82" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="Jay迷" x="385" y="262" autoSize="none" background="false" width="70" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="85后" x="105" y="263" autoSize="left" background="false" width="58" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="海漂" x="318" y="262" autoSize="left" background="false" width="58" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="IT民工" x="170" y="263" autoSize="left" background="false" width="71" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="武汉伢" x="460" y="262" autoSize="left" background="false" width="70" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="上班族" x="251" y="262" autoSize="left" background="false" width="59" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="轻强迫症" x="536" y="262" autoSize="left" background="false" width="82" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			</View>;
		public function ProfileUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}