// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.ConnectedObject

package com.company.assembleegameclient.objects {
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import com.company.assembleegameclient.engine3d.ObjectFace3D;

import flash.display.BitmapData;

import com.company.assembleegameclient.map.Square;

import flash.geom.Utils3D;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.engine3d._uZ_;

public class ConnectedObject extends GameObject {

    protected static const _F_M_:int = 0;
    protected static const _jq:int = 1;
    protected static const _wd:int = 2;
    protected static const _E_l:int = 3;
    protected static const _T_d:int = 4;
    protected static const _0F_d:int = 5;
    protected static const N0:Vector3D = new Vector3D(-1, -1, 0);
    protected static const N1:Vector3D = new Vector3D(0, -1, 0);
    protected static const N2:Vector3D = new Vector3D(1, -1, 0);
    protected static const N3:Vector3D = new Vector3D(1, 0, 0);
    protected static const N4:Vector3D = new Vector3D(1, 1, 0);
    protected static const N5:Vector3D = new Vector3D(0, 1, 0);
    protected static const N6:Vector3D = new Vector3D(-1, 1, 0);
    protected static const N7:Vector3D = new Vector3D(-1, 0, 0);
    protected static const N8:Vector3D = new Vector3D(0, 0, 1);

    private static var _aI_:Dictionary = null;

    private static function init():void {
        _aI_ = new Dictionary();
        _hq(33686018, _F_M_);
        _hq(16908802, _jq);
        _hq(16843266, _wd);
        _hq(16908546, _E_l);
        _hq(16843265, _T_d);
        _hq(16843009, _0F_d);
    }

    private static function _0D_(_arg1:int):ConnectedResults {
        if (_aI_ == null) {
            init();
        }
        var _local2 = (_arg1 & 252645135);
        return (_aI_[_local2]);
    }

    private static function _hq(_arg1:int, _arg2:int):void {
        var _local4:int;
        var _local3:int;
        while (_local3 < 4) {
            if (!_aI_.hasOwnProperty(String(_arg1))) {
                _aI_[_arg1] = new ConnectedResults(_arg2, _local3);
                _local4 = (_arg1 & 0xFF);
                _arg1 = ((_arg1 >> 8) | (_local4 << 24));
            }
            _local3++;
        }
    }

    public function ConnectedObject(_arg1:XML) {
        super(_arg1);
        _P_m = false;
    }
    protected var rotation_:int = 0;

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        var _local4:ObjectFace3D;
        var _local5:int;
        var _local6:int;
        var _local7:BitmapData;
        var _local8:Square;
        if (_8J_ == null) {
            this._08U_();
        }
        Utils3D.projectVectors(_arg2.wToS_, _8J_.vW_, _8J_.vS_, _8J_.uvts_);
        for each (_local4 in _8J_.faces_) {
            _local5 = (((_local4._0F_3.x > 0.4)) ? 1 : (((_local4._0F_3.x < -0.4)) ? -1 : 0));
            _local6 = (((_local4._0F_3.y > 0.4)) ? 1 : (((_local4._0F_3.y < -0.4)) ? -1 : 0));
            _local7 = _local4.texture_;
            if (((!((_local5 == 0))) || (!((_local6 == 0))))) {
                _local8 = map_.lookupSquare((x_ + _local5), (y_ + _local6));
                if ((((_local8 == null)) || ((_local8.texture_ == null)))) {
                    _local7 = null;
                }
            }
            _local4.draw(_arg1, 0, _local7);
        }
    }

    public function _08U_():void {
        _8J_ = new _uZ_();
        var _local1:ConnectedResults = _0D_(_O_l);
        if (_local1 == null) {
            _8J_ = null;
            return;
        }
        this.rotation_ = _local1.rotation_;
        switch (_local1.type_) {
            case _F_M_:
                this.buildDot();
                break;
            case _jq:
                this.buildShortLine();
                break;
            case _wd:
                this.buildL();
                break;
            case _E_l:
                this.buildLine();
                break;
            case _T_d:
                this.buildT();
                break;
            case _0F_d:
                this.buildCross();
                break;
            default:
                _8J_ = null;
                return;
        }
        _8J_.setPosition(x_, y_, 0, (this.rotation_ * 90));
    }

    protected function buildDot():void {
    }

    protected function buildShortLine():void {
    }

    protected function buildL():void {
    }

    protected function buildLine():void {
    }

    protected function buildT():void {
    }

    protected function buildCross():void {
    }

}
}//package com.company.assembleegameclient.objects

class ConnectedResults {

    public var type_:int;
    public var rotation_:int;

    public function ConnectedResults(_arg1:int, _arg2:int) {
        this.type_ = _arg1;
        this.rotation_ = _arg2;
    }
}

