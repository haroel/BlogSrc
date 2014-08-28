/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class ProfileUI extends View {
		public var m_avatar:Image;
		public var m_emailBtn:LinkButton;
		public var m_weiboLabel:Label;
		public var m_wxBtn:LinkButton;
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Image x="606" y="33" width="155" height="189" var="m_avatar" smoothing="true" url="img/avtar.png"/>
			  <Label text="何浩" x="117" y="36" size="16" selectable="true" width="65" height="24" buttonMode="false" underline="false" toolTip="英文昵称howe"/>
			  <Label text="所在地" x="302" y="72" bold="true" color="0x333333" width="68" height="23"/>
			  <Label text="出生日期" x="39" y="153" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="中文名" x="37" y="36" bold="true" color="0x333333" width="52" height="24"/>
			  <Label text="毕业院校" x="302" y="34" bold="true" color="0x333333" width="72" height="19"/>
			  <Label text="民族" x="39" y="111" bold="true" color="0x333333" width="55" height="19"/>
			  <Label text="籍贯" x="37" y="73" bold="true" color="0x333333" width="50" height="19"/>
			  <Label text="上海市浦东新区" x="392" y="71" size="16" selectable="true"/>
			  <Label text="湖北省武汉市" x="118" y="73" size="16" selectable="true"/>
			  <Label text="汉族" x="117" y="111" size="16" selectable="true" width="66" height="26"/>
			  <Label text="1987年11月" x="115" y="152" size="16" selectable="true"/>
			  <Label text="职业" x="39" y="194" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="固定工作者" x="117" y="193" size="16" selectable="true"/>
			  <Label text="学历" x="306" y="195" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="本科" x="396" y="193" size="16" selectable="true" toolTip="信息管理与信息系统"/>
			  <Label text="婚姻状态" x="304" y="154" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="已婚" x="395" y="154" size="16" selectable="true"/>
			  <Label text="星座" x="304" y="117" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="天蝎座" x="394" y="116" size="16" selectable="true"/>
			  <Label text="武汉科技大学" x="394" y="33" size="16" selectable="true"/>
			  <Label x="38" y="406" bold="true" color="0x333333" width="35" height="19" text="标签"/>
			  <Label text="本站部分界面采用Morn ui框架开发，感谢@yungzhu为flash开发者提供了如此强大易用的UI框架。" x="112" y="462" width="520" height="18" color="0x999999"/>
			  <Label text="Jay迷" x="368" y="406" autoSize="none" background="false" width="70" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="85后" x="88" y="407" autoSize="left" background="false" width="58" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="海漂" x="301" y="406" autoSize="left" background="false" width="58" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="IT民工" x="153" y="407" autoSize="left" background="false" width="71" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="武汉伢" x="443" y="406" autoSize="left" background="false" width="70" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="上班族" x="234" y="406" autoSize="left" background="false" width="59" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="轻强迫症" x="519" y="406" autoSize="left" background="false" width="82" height="26" skin="png.comp.label_tag" align="center" sizeGrid="1,1,24,4" color="0xffffff" bold="false" size="14" font="Arial" letterSpacing="1" margin="1,3,9,1"/>
			  <Label text="微博" x="40" y="293" bold="true" color="0x333333" width="37" height="20"/>
			  <Label text="邮件" x="40" y="327" bold="true" color="0x333333" width="34" height="22"/>
			  <LinkButton label="ihowe@outlook.com" x="89" y="326" var="m_emailBtn"/>
			  <Label text="微信" x="39" y="359" bold="true" color="0x333333" width="35" height="21"/>
			  <Label text="一个游戏前端程序员，目前就职于上海墨白科技" x="41" y="257" bold="true" color="0x333333" width="322" height="20"/>
			  <Label text="howe_wh" x="90" y="292" width="57" height="20" color="0x333333" buttonMode="true" var="m_weiboLabel" backgroundColor="0x333333" toolTip="新浪微博"/>
			  <Image skin="png.comp.img_v" x="147" y="293"/>
			  <LinkButton label="howe_wh" x="88" y="360" var="m_wxBtn"/>
			</View>;
		public function ProfileUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}