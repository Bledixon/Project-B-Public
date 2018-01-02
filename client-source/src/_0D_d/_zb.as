// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_d._zb

package _0D_d {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.display.Graphics;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;

public class _zb extends Sprite {

    private static const _02K_:int = 20;

    public function _zb(_arg1:String, _arg2:Boolean, _arg3:String) {
        this._0J_B_ = _arg2;
        this._8n = new Sprite();
        this._8n.x = 2;
        this._8n.y = 2;
        this._pi();
        this._8n.addEventListener(MouseEvent.CLICK, this._021);
        addChild(this._8n);
        this.text_ = new SimpleText(16, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.text_.x = ((this._8n.x + _02K_) + 8);
        this.text_.setBold(true);
        this.text_.htmlText = _arg1;
        this.text_.mouseEnabled = true;
        this.text_.updateMetrics();
        this.text_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.text_);
        this.errorText_ = new SimpleText(12, 16549442, false, 0, 0, "Myriad Pro");
        this.errorText_.x = this.text_.x;
        this.errorText_.y = (this.text_.y + 20);
        this.errorText_.text = _arg3;
        this.errorText_.updateMetrics();
        this.errorText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.errorText_);
    }
    public var _8n:Sprite;
    public var text_:SimpleText;
    public var errorText_:SimpleText;
    private var _0J_B_:Boolean;

    public function _u6():Boolean {
        return (this._0J_B_);
    }

    public function _0B_T_(_arg1:String):void {
        this.errorText_.text = _arg1;
        this.errorText_.updateMetrics();
    }

    private function _pi():void {
        var _local1:Graphics = this._8n.graphics;
        _local1.clear();
        _local1.beginFill(0x404040, 1);
        _local1.drawRect(0, 0, _02K_, _02K_);
        _local1.endFill();
        if (this._0J_B_) {
            _local1.lineStyle(4, 0xB3B3B3, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND);
            _local1.moveTo(2, 2);
            _local1.lineTo((_02K_ - 2), (_02K_ - 2));
            _local1.moveTo(2, (_02K_ - 2));
            _local1.lineTo((_02K_ - 2), 2);
            _local1.lineStyle();
        }
        _local1.lineStyle(2, 0x333333, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND);
        _local1.drawRect(0, 0, _02K_, _02K_);
        _local1.lineStyle();
    }

    private function _021(_arg1:MouseEvent):void {
        this._0B_T_("");
        this._0J_B_ = !(this._0J_B_);
        this._pi();
    }

}
}//package _0D_d

