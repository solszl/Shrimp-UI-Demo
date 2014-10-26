package
{
	import com.shrimp.demo.constant.ViewType;
	import com.shrimp.demo.panel.BasePanel;
	import com.shrimp.demo.view.WelcomeView;
	import com.shrimp.extensions.clip.core.LazyDispatcher;
	import com.shrimp.framework.core.ApplicationBase;
	import com.shrimp.framework.managers.LayerManager;
	import com.shrimp.framework.managers.PanelManager;
	import com.shrimp.framework.managers.StageManager;
	import com.shrimp.framework.managers.ViewManager;
	import com.shrimp.framework.utils.SWFProfiler;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="800",height="600",frameRate="60")]
	public class Main extends ApplicationBase
	{
		public function Main()
		{
			addEventListener(Event.ENTER_FRAME,onEnter);
		}
		
		protected function onEnter(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME,onEnter);
			StageManager.init(this);
			SWFProfiler.init(StageManager.stage,this);
			LayerManager.lazyInit();
			
			ViewManager.regView(ViewType.WELCOME_VIEW,WelcomeView);
			
			ViewManager.getInstance().view = ViewManager.defaultView;
		}
	}
}