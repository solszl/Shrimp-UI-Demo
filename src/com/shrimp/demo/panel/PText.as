package com.shrimp.demo.panel
{
	import com.shrimp.ext.controls.mobile.TextArea;
	import com.shrimp.framework.ui.container.VBox;
	import com.shrimp.framework.ui.controls.TextInput;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.FocusEvent;
	
	public class PText extends BasePanel
	{
		public function PText(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		private var txt1:TextInput;
		private var txt2:TextInput;
		
		private var txt3:PromoteTextInput;
		
		private var ta1:TextArea;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var vb:VBox = new VBox(this);
			vb.horizontalCenter = 0;
			vb.verticalCenter = 0;
			
			txt1 = new TextInput(vb);
			txt1.selectable = false;
			txt1.editable = false;
			txt1.text = "不可选择,编辑";
			txt1.color = 0xc0c0c0;
			
			txt2 = new TextInput(vb);
			txt2.text = "显示密码";
			txt2.displayAsPassword = true;
			
			txt3 = new PromoteTextInput(vb);
			txt3.promote = "默认文本为:123";
			
//			ta1 = new TextArea(this);
//			ta1.text = "ab\ncd\nefg\nghi\njk\nlm\nno\npq\nrs\ntu\nvwx\nyz`\n123\n45\n678\n90-\n=";
			
			ta1 = new TextArea(this);
			ta1.width = 100;
			ta1.height = 100;
			ta1.selectable=false;
			ta1.text = "a水水水水水水水水b\n不笨不笨不笨不笨不笨不笨别别别5cd\n个哈哈哈哈哈哈哈哈哈哈efg\nghi\njk\nlm\no\npq\nrs\ntu\nvwx\nyz`\n123\n45\n678\n90-\n=";
		}
	}
	
}
import com.shrimp.framework.ui.controls.TextInput;

import flash.display.DisplayObjectContainer;
import flash.events.FocusEvent;

class PromoteTextInput extends TextInput
{
	public function PromoteTextInput(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
	{
		super(parent,xpos,ypos);
	}
	
	override protected function createChildren():void
	{
		super.createChildren();
		_textField.addEventListener(FocusEvent.FOCUS_IN,onFocusIn);
		_textField.addEventListener(FocusEvent.FOCUS_OUT,onFocusOut);
	}
	
	protected function onFocusOut(event:FocusEvent):void
	{
		if (_text.length == 0 || _text == promote)
		{
			_textField.textColor=promoteColor;
			text=promote;
		}
	}
	
	protected function onFocusIn(event:FocusEvent):void
	{
		if (_text == promote)
		{
			_textField.textColor=color as uint;
			text='';
		}
	}
	
	override protected function commitProperties():void
	{
		super.commitProperties();
		if (_promoteChanged)
		{
			_promoteChanged=false;
			if (_text.length == 0)
			{
				_textField.textColor=promoteColor;
				_textField.text=_promote;
				_text=_promote;
			}
		}
	}
	
	//默认文本
	private var _promote:String="promote";
	//默认文本颜色
	private var promoteColor:uint=0x86A0A8;
	
	public function get promote():String
	{
		return _promote;
	}
	
	private var _promoteChanged:Boolean;
	public function set promote(value:String):void
	{
		if(_promote == value)
			return;
		
		_promote = value;
		
		_promoteChanged = true;
		invalidateProperties();
		invalidateSize();
	}
	
	override public function get text():String
	{
		if (_text == _promote)
			return '';
		return _text;
	}
}