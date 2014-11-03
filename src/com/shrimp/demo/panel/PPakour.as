package com.shrimp.demo.panel
{
	import com.shrimp.demo.panel.pakour.GamingRender;
	import com.shrimp.demo.panel.pakour.GamingRender2;
	import com.shrimp.demo.panel.pakour.WelcomeRender;
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.ui.container.HBox;
	import com.shrimp.framework.ui.controls.Button;
	import com.shrimp.framework.ui.controls.TextArea;
	import com.shrimp.pakour.constants.EngineStateEnum;
	import com.shrimp.pakour.core.Engine;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 *	跑酷引擎 
	 * @author Sol
	 * 
	 */	
	public class PPakour extends BasePanel
	{
		public function PPakour(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var btnStart:Button;
		
		private var btnStop:Button;
		
		private var btnPause:Button;
		
		private var btnResume:Button;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var hb:HBox = new HBox(this,30,30);
			hb.addEventListener(MouseEvent.CLICK,onBoxClick);
			btnStart = new Button(hb);
			btnStart.label = "开始";
			btnStop = new Button(hb);
			btnStop.label = "停止";
			btnPause = new Button(hb);
			btnPause.label = "暂停";
			btnResume = new Button(hb);
			btnResume.label = "恢复";
			
			for (var i:int = 0; i < hb.numChildren; i++) 
			{
				var btn:Button = hb.getChildAt(i) as Button;
				btn.scale9Rect=new Rectangle(4,4,12,12);
			}
			
			engine = new Engine(StageManager.stage);
			engine.initEngine();
			
			welRender = new WelcomeRender(this,30,50);
			
			ingRender = new GamingRender(this,30,80);
			
			ingRender2 = new GamingRender2(this,30,130);
			
			engine.renderPool.push(EngineStateEnum.RUNNING,ingRender);
			engine.renderPool.push(EngineStateEnum.RUNNING,ingRender2);
			engine.renderPool.push(EngineStateEnum.RESUME,welRender);
			
			var ta:TextArea = new TextArea(this,30,150);
			ta.setActualSize(350,120);
			ta.text = "跑酷引擎测试demo,\n分为3个渲染器,分别是\n1:随机数渲染器\n2:人物移动渲染器\n3:得分渲染器\n点击开始后,引擎进入运行状态,事先注册好的人物和得分渲染器进行工作,点击暂停后,注册好的随机渲染器进行工作,点击恢复,则重新回到运行状态,点击停止,所有渲染器停止工作!";
		}
		
		private var engine:Engine;
		
		private var welRender:WelcomeRender;
		private var ingRender:GamingRender;
		private var ingRender2:GamingRender2;
		
		protected function onBoxClick(event:MouseEvent):void
		{
			switch(event.target)
			{
				case btnStart:
					engine.start();
					break;
				case btnStop:
					engine.stop();
					break;
				case btnPause:
					engine.pause();
					break;
				case btnResume:
					engine.resume();
					break;
			}
		}
		
		override public function hide():void
		{
			super.hide();
			engine.stop();
		}
	}
}