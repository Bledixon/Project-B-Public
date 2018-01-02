// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._X_K_

package _qD_ {
import flash.utils.Dictionary;
import flash.events.Event;
import flash.display.BitmapData;
import flash.geom.Point;

import com.company.util.BitmapUtil;

public class _X_K_ extends _E_b {

    public function _X_K_(_arg1:int, _arg2:int, _arg3:int, _arg4:int) {
        var _local5:String;
        var _local6:_03Y_;
        this._zO_ = new Dictionary();
        super();
        this._pu = new _wo();
        this._pu.x = ((_arg1 / 2) - (this._pu.width / 2));
        this._pu.y = -28;
        this._pu.addEventListener(Event.CHANGE, this._R_F_);
        addChild(this._pu);
        for each (_local5 in _wo._0E_y) {
            if (_local5 == _wo.ATTACK2) {
                _local6 = new _03Y_(_arg1, _arg2, (_arg3 * 2), _arg4, true);
            } else {
                _local6 = new _03Y_(_arg1, _arg2, _arg3, _arg4, true);
            }
            this._zO_[_local5] = _local6;
        }
        this.selected_ = this._zO_[this._pu._rq()];
        addChild(this.selected_);
    }
    public var _pu:_wo;
    public var _zO_:Dictionary;
    private var selected_:_03Y_ = null;

    override public function getBitmapData():BitmapData {
        var _local1:BitmapData = this._zO_[_wo._sS_].getBitmapData();
        var _local2:int = _local1.width;
        var _local3:BitmapData = new BitmapData((_local2 * 7), _local1.height, true, 0);
        _local3.copyPixels(_local1, _local1.rect, new Point(0, 0));
        _local1 = this._zO_[_wo.WALK1].getBitmapData();
        _local3.copyPixels(_local1, _local1.rect, new Point(_local2, 0));
        _local1 = this._zO_[_wo.WALK2].getBitmapData();
        _local3.copyPixels(_local1, _local1.rect, new Point((_local2 * 2), 0));
        _local1 = this._zO_[_wo.ATTACK1].getBitmapData();
        _local3.copyPixels(_local1, _local1.rect, new Point((_local2 * 4), 0));
        _local1 = this._zO_[_wo.ATTACK2].getBitmapData();
        _local3.copyPixels(_local1, _local1.rect, new Point((_local2 * 5), 0));
        return (_local3);
    }

    override public function loadBitmapData(_arg1:BitmapData):void {
        var _local2:_03Y_;
        var _local3:int;
        var _local4:int;
        if (_arg1.width <= 16) {
            _local2 = this._zO_[_wo._sS_];
            _local2.loadBitmapData(_arg1);
        } else {
            _local3 = (_arg1.width / 7);
            _local4 = _arg1.height;
            this._zO_[_wo._sS_].loadBitmapData(BitmapUtil._Y_d(_arg1, 0, 0, _local3, _local4));
            this._zO_[_wo.WALK1].loadBitmapData(BitmapUtil._Y_d(_arg1, _local3, 0, _local3, _local4));
            this._zO_[_wo.WALK2].loadBitmapData(BitmapUtil._Y_d(_arg1, (_local3 * 2), 0, _local3, _local4));
            this._zO_[_wo.ATTACK1].loadBitmapData(BitmapUtil._Y_d(_arg1, (_local3 * 4), 0, _local3, _local4));
            this._zO_[_wo.ATTACK2].loadBitmapData(BitmapUtil._Y_d(_arg1, (_local3 * 5), 0, (_local3 * 2), _local4));
        }
        dispatchEvent(new Event(Event.CHANGE));
    }

    override public function clear():void {
        this.selected_.clear();
    }

    private function _R_F_(_arg1:Event):void {
        var _local2:_03Y_;
        if (this.selected_ != null) {
            removeChild(this.selected_);
        }
        this.selected_ = this._zO_[this._pu._rq()];
        addChild(this.selected_);
        if (this.selected_._0D_J_()) {
            _local2 = this._zO_[_wo._sS_];
            this.selected_.loadBitmapData(_local2.getBitmapData());
            dispatchEvent(new Event(Event.CHANGE));
        }
    }

}
}//package _qD_

