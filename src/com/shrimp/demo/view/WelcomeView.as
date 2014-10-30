package com.shrimp.demo.view
{
	import com.shrimp.demo.constant.PanelType;
	import com.shrimp.demo.panel.PButton;
	import com.shrimp.demo.panel.PCheckBox;
	import com.shrimp.demo.panel.PDataBox;
	import com.shrimp.demo.panel.PImage;
	import com.shrimp.demo.panel.PLabel;
	import com.shrimp.demo.panel.PText;
	import com.shrimp.demo.panel.PViewStack;
	import com.shrimp.extensions.clip.core.AbsClip;
	import com.shrimp.framework.interfaces.IPanel;
	import com.shrimp.framework.managers.PanelManager;
	import com.shrimp.framework.ui.container.HBox;
	import com.shrimp.framework.ui.container.VBox;
	import com.shrimp.framework.ui.controls.BaseView;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.ui.controls.TabBar;
	import com.shrimp.framework.ui.layout.VerticalLayout;
	import com.shrimp.framework.utils.ArrayList;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class WelcomeView extends BaseView
	{
		public function WelcomeView(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var btnButton:Button;
		private var btnRadio:Button;
		private var btnCheckBox:Button;
		private var btnLabel:Button;
		private var btnText:Button;
		private var btnImage:Button;
		/**	导航*/
		private var btnViewStack:Button;
		/**	数据*/
		private var btnDataBox:Button;
		override protected function createChildren():void
		{
			super.createChildren();
			with(this)
			{
				graphics.beginFill(0xc0c0c0);
				graphics.drawRect(0,0,this.width,this.height);
				graphics.endFill();
			}
			
			hbox = new VBox(this);
			hbox2= new VBox(this,90);
			initHUE();
		}
		
		private var hbox:VBox;
		private var hbox2:VBox;
		private function initHUE():void
		{
			hbox.addEventListener(MouseEvent.CLICK,onBoxClickHandler);
			hbox2.addEventListener(MouseEvent.CLICK,onBoxClickHandler);
			
			btnLabel = new Button(hbox);
			btnLabel.label = "Label";
			
			btnButton = new Button(hbox);
			btnButton.label = "Button";
			
			btnRadio = new Button(hbox);
			btnRadio.label = "Radio";
			
			btnCheckBox = new Button(hbox);
			btnCheckBox.label = "Check";
			
			btnText = new Button(hbox);
			btnText.label = "Text";
			
			btnImage = new Button(hbox);
			btnImage.label= "Image";
			
			btnViewStack = new Button(hbox2);
			btnViewStack.scale9Rect =new Rectangle(4,4,12,12); 
			btnViewStack.label = "ViewStack";
			
			btnDataBox = new Button(hbox2);
			btnDataBox.scale9Rect = new Rectangle(4,4,12,12);
			btnDataBox.label = "DataBox";
			
			
			var btn:Button;
			for (var i:int = 0; i < hbox.numChildren; i++) 
			{
				btn = hbox.getChildAt(i) as Button;
				btn.scale9Rect = new Rectangle(4,4,12,12);
				btn.width = 80;
			}
			
			for (var j:int = 0; j < hbox2.numChildren; j++) 
			{
				btn = hbox2.getChildAt(j) as Button;
				btn.scale9Rect = new Rectangle(4,4,12,12);
				btn.width = 80;
			}
			
			
			PanelManager.registPanel(PanelType.PANEL_LABEL_DEMO,PLabel);
			PanelManager.registPanel(PanelType.PANEL_BUTTON_DEMO,PButton);
			PanelManager.registPanel(PanelType.PANEL_CHECKBOX_DEMO,PCheckBox);
			PanelManager.registPanel(PanelType.PANEL_IMAGE_DEMO,PImage);
			PanelManager.registPanel(PanelType.PANEL_TEXT_DEMO,PText);
			
			PanelManager.registPanel(PanelType.PANEL_VIEWSTACK_DEMO,PViewStack);
			PanelManager.registPanel(PanelType.PANEL_DATABOX_DEMO,PDataBox);
			
		}
		
		protected function onBoxClickHandler(event:MouseEvent):void
		{
			var panelId:int = -1;
			switch(event.target)
			{
				case btnButton:
					panelId = PanelType.PANEL_BUTTON_DEMO;
					break;
				case btnCheckBox:
					panelId = PanelType.PANEL_CHECKBOX_DEMO;
					break;
				case btnImage:
					panelId = PanelType.PANEL_IMAGE_DEMO;
					break;
				case btnLabel:
					panelId = PanelType.PANEL_LABEL_DEMO;
					break;
				case btnText:
					panelId = PanelType.PANEL_TEXT_DEMO;
					break;
				case btnViewStack:
					panelId = PanelType.PANEL_VIEWSTACK_DEMO;
					break;
				case btnDataBox:
					panelId = PanelType.PANEL_DATABOX_DEMO;
					break;
			}
			PanelManager.getInstance().showPanel(panelId,false);
			
		}
	}
}