/**Created by the Morn,do not modify.*/
package game.ui.test {
	import morn.core.components.*;
	public class ProfileUI extends View {
		public var m_avatar:Image;
		public var m_collBtn:LinkButton;
		public var m_desLabel:Label;
		public var m_desLabel:Label;
		protected static var uiXML:XML =
			<View width="800" height="480">
			  <Image skin="png.comp.blank" x="21" y="16" width="760" height="230" alpha="0.15"/>
			  <Image x="600" y="38" width="150" height="188" var="m_avatar" smoothing="true" url="img/avtar.png"/>
			  <Label text="何浩" x="130" y="36" size="16" selectable="true" width="65" height="24" buttonMode="false" underline="false" toolTip="英文昵称howe"/>
			  <Label text="所在地" x="314" y="72" bold="true" color="0x333333" width="68" height="23"/>
			  <Label text="出生日期" x="50" y="152" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="中文名" x="49" y="36" bold="true" color="0x333333" width="52" height="24"/>
			  <Label text="毕业院校" x="314" y="34" bold="true" color="0x333333" width="72" height="19"/>
			  <Label text="民族" x="50" y="113" bold="true" color="0x333333" width="55" height="19"/>
			  <Label text="籍贯" x="49" y="73" bold="true" color="0x333333" width="50" height="19"/>
			  <Label text="上海市浦东新区" x="401" y="69" size="16" selectable="true"/>
			  <Label text="湖北省武汉市" x="129" y="73" size="16" selectable="true"/>
			  <Label text="汉族" x="129" y="112" size="16" selectable="true" width="66" height="26"/>
			  <LinkButton label="武汉科技大学" x="401" y="33" labelSize="16" labelBold="false" var="m_collBtn" buttonMode="true"/>
			  <Label text="1987年11月" x="127" y="152" size="16" selectable="true"/>
			  <Label text="职业" x="51" y="194" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="固定工作者" x="130" y="195" size="16" selectable="true"/>
			  <Label text="学历" x="319" y="195" bold="true" color="0x333333" width="56" height="19"/>
			  <Label text="本科" x="407" y="196" size="16" selectable="true" toolTip="信息管理于信息系统"/>
			  <Label text="婚姻状态" x="316" y="154" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="已婚" x="407" y="154" size="16" selectable="true"/>
			  <Label text="星座" x="316" y="117" bold="true" color="0x333333" width="66" height="19"/>
			  <Label text="天蝎座" x="406" y="115" size="16" selectable="true"/>
			  <Label x="23" y="363" width="758" height="45" var="m_desLabel" text="本网站基于Flash技术开发，动画效果采用轻量级的TweenLite缓动引擎；界面UI制作大部分使用Morn ui框架开发，感谢@yungzhu为flash开发者提供了如此强大易用的UI框架。" multiline="true" wordWrap="true" size="16"/>
			  <Label x="24" y="277" width="758" height="81" var="m_desLabel" text="网站使用了Windows Metro和Mac OSX混搭的设计风格，显然，两者的风格是完全不一样的，所以如何将两者结合在一起就成了设计的一大难点。经过多次的尝试和思考后，我使用了较复杂的icon动画来回切换技巧来融合两者。网站UI风格比较简洁，突出内容而轻外在装饰，去掉了关闭按钮，而为了让界面能重新返回Metro界面，又在Dock栏新增一个Home图标，整个界面非常自然。" multiline="true" wordWrap="true" size="16"/>
			</View>;
		public function ProfileUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}