// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0C_P_._pw

package _0C_P_ {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;
import com.company.ui.SimpleText;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsPath;
import flash.display.GraphicsStroke;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Graphics;


public class _pw extends Sprite {

    public static const WIDTH:int = 80;
    public static const HEIGHT:int = 32;

    public function _pw(_arg1:Vector.<String>, _arg2:Array, _arg3:Object) {
        this.internalFill_ = new GraphicsSolidFill(0x2a2a2a, 1);
        this._pq = new GraphicsSolidFill(0xB3B3B3, 1);
        this._uN_ = new GraphicsSolidFill(0x4c4c4c, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this._uN_);
        this.graphicsData_ = new <IGraphicsData>[internalFill_, _0y, path_, GraphicHelper._H_B_, GraphicHelper.END_FILL];
        super();
        this._C_h = _arg1;
        this._0E_q = _arg2;
        this.labelText_ = new SimpleText(16, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.labelText_.setBold(true);
        this.labelText_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        addChild(this.labelText_);
        this.setValue(_arg3);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        addEventListener(MouseEvent.CLICK, this._021);
    }
    public var _C_h:Vector.<String>;
    public var _0E_q:Array;
    public var _7Y_:int = -1;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var labelText_:SimpleText = null;
    private var over_:Boolean = false;
    private var internalFill_:GraphicsSolidFill;
    private var _pq:GraphicsSolidFill;
    private var _uN_:GraphicsSolidFill;
    private var path_:GraphicsPath;
    private var _0y:GraphicsStroke;

    public function setValue(_arg1:*):void {
        var _local2:int;
        while (_local2 < this._0E_q.length) {
            if (_arg1 == this._0E_q[_local2]) {
                if (_local2 == this._7Y_) {
                    return;
                }
                this._7Y_ = _local2;
                break;
            }
            _local2++;
        }
        this.setSelected(this._7Y_);
        dispatchEvent(new Event(Event.CHANGE));
    }

    public function value() {
        return (this._0E_q[this._7Y_]);
    }

    private function _rC_():void {
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
        this._0y.fill = ((this.over_) ? this._pq : this._uN_);
        graphics.drawGraphicsData(this.graphicsData_);
        var _local1:Graphics = graphics;
        _local1.clear();
        _local1.drawGraphicsData(this.graphicsData_);
    }

    private function setSelected(_arg1:int):void {
        this._7Y_ = _arg1;
        this._02C_(this._C_h[this._7Y_]);
    }

    private function _02C_(_arg1:String):void {
        this.labelText_.text = _arg1;
        this.labelText_.updateMetrics();
        this.labelText_.x = ((WIDTH / 2) - (this.labelText_.width / 2));
        this.labelText_.y = (((HEIGHT / 2) - (this.labelText_.height / 2)) - 2);
        this._rC_();
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.over_ = true;
        this._rC_();
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.over_ = false;
        this._rC_();
    }

    private function _021(_arg1:MouseEvent):void {
        this.setSelected(((this._7Y_ + 1) % this._0E_q.length));
        dispatchEvent(new Event(Event.CHANGE));
    }

}
}//package _0C_P_

