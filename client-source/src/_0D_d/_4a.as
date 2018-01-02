// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_d._4a

package _0D_d {
import flash.display.Sprite;

import com.company.assembleegameclient.util.offer.Offers;

import _5H_._5P_;

import flash.events.MouseEvent;

import com.company.assembleegameclient.util.offer.Offer;

import _5H_._xY_;

import flash.display.DisplayObject;

import _mv._6o;
import _mv._F_8;


public class _4a extends Sprite {

    public function _4a(_arg1:Offers, _arg2:String, _arg3:String) {
        this._0J_E_ = _arg1;
        this._yI_ = _arg2;
        this._Q_W_ = _arg3;
        this._08F_();
        this._V_8();
        this._Y_o();
    }
    private var _0J_E_:Offers;
    private var _yI_:String;
    private var _Q_W_:String;
    private var _W_P_:Vector.<_A__>;
    private var _rF_:_5P_;

    public function _iU_():_A__ {
        return ((this._rF_._rq() as _A__));
    }

    public function _d0(_arg1:Boolean):void {
        var _local2:int = this._W_P_.length;
        while (_local2--) {
            this._W_P_[_local2].showBonus(_arg1);
        }
    }

    private function _08F_():void {
        var _local1:int = this._0J_E_.offerList.length;
        this._W_P_ = new Vector.<_A__>(_local1, true);
        var _local2:int;
        while (_local2 < _local1) {
            this._W_P_[_local2] = this._i7(this._0J_E_.offerList[_local2]);
            _local2++;
        }
    }

    private function _i7(_arg1:Offer):_A__ {
        var _local2:_A__ = new _A__(_arg1, this._yI_, this._Q_W_);
        _local2.addEventListener(MouseEvent.CLICK, this._0A_U_);
        addChild(_local2);
        return (_local2);
    }

    private function _V_8():void {
        var _local1:Vector.<DisplayObject> = this._eX_();
        var _local2:_F_8 = new _6o(5);
        _local2.layout(_local1);
    }

    private function _eX_():Vector.<DisplayObject> {
        var _local1:int = this._W_P_.length;
        var _local2:Vector.<DisplayObject> = new <DisplayObject>[];
        var _local3:int;
        while (_local3 < _local1) {
            _local2[_local3] = this._W_P_[_local3];
            _local3++;
        }
        return (_local2);
    }

    private function _Y_o():void {
        var _local1:Vector.<_xY_> = this._G_S_();
        this._rF_ = new _5P_(_local1);
        this._rF_.setSelected(this._W_P_[0].getValue());
    }

    private function _G_S_():Vector.<_xY_> {
        var _local1:int = this._W_P_.length;
        var _local2:Vector.<_xY_> = new <_xY_>[];
        var _local3:int;
        while (_local3 < _local1) {
            _local2[_local3] = this._W_P_[_local3];
            _local3++;
        }
        return (_local2);
    }

    private function _0A_U_(_arg1:MouseEvent):void {
        var _local2:_xY_ = (_arg1.currentTarget as _xY_);
        this._rF_.setSelected(_local2.getValue());
    }

}
}//package _0D_d

