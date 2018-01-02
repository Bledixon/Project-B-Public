// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.ConnectedWall

package com.company.assembleegameclient.objects {
import flash.geom.Vector3D;
import flash.display.BitmapData;

import com.company.util.AssetLibrary;
import com.company.assembleegameclient.engine3d.ObjectFace3D;


public class ConnectedWall extends ConnectedObject {

    public function ConnectedWall(_arg1:XML) {
        super(_arg1);
        this._I_z = _arg1;
        if (_arg1.hasOwnProperty("BaseIndent")) {
            this._0D_V_ = (0.5 - Number(_arg1.BaseIndent));
        }
        if (_arg1.hasOwnProperty("TopIndent")) {
            this._R_x = (0.5 - Number(_arg1.TopIndent));
        }
        if (_arg1.hasOwnProperty("Height")) {
            this.h_ = Number(_arg1.Height);
        }
        this._3A_ = !(_arg1.hasOwnProperty("NoWallTextureRepeat"));
        this._0A_i = !(_arg1.hasOwnProperty("NoTopTextureRepeat"));
    }
    protected var _I_z:XML;
    protected var _0D_V_:Number = 0.5;
    protected var _R_x:Number = 0.25;
    protected var h_:Number = 1;
    protected var _3A_:Boolean;
    protected var _0A_i:Boolean;

    override protected function buildDot():void {
        var _local1:Vector3D = new Vector3D(-(this._0D_V_), -(this._0D_V_), 0);
        var _local2:Vector3D = new Vector3D(this._0D_V_, -(this._0D_V_), 0);
        var _local3:Vector3D = new Vector3D(this._0D_V_, this._0D_V_, 0);
        var _local4:Vector3D = new Vector3D(-(this._0D_V_), this._0D_V_, 0);
        var _local5:Vector3D = new Vector3D(-(this._R_x), -(this._R_x), this.h_);
        var _local6:Vector3D = new Vector3D(this._R_x, -(this._R_x), this.h_);
        var _local7:Vector3D = new Vector3D(this._R_x, this._R_x, this.h_);
        var _local8:Vector3D = new Vector3D(-(this._R_x), this._R_x, this.h_);
        this._0E_b(_local6, _local5, _local1, _local2, texture_, true, true);
        this._0E_b(_local7, _local6, _local2, _local3, texture_, true, true);
        this._0E_b(_local5, _local8, _local4, _local1, texture_, true, true);
        this._0E_b(_local8, _local7, _local3, _local4, texture_, true, true);
        var _local9:BitmapData = texture_;
        if (this._I_z.hasOwnProperty("DotTexture")) {
            _local9 = AssetLibrary._xK_(String(this._I_z.DotTexture.File), int(this._I_z.DotTexture.Index));
        }
        this._H_m([_local5, _local6, _local7, _local8], new <Number>[0.25, 0.25, 0.75, 0.25, 0.25, 0.75], _local9);
    }

    override protected function buildShortLine():void {
        var _local1:Vector3D = new Vector3D(-(this._0D_V_), -0.5, 0);
        var _local2:Vector3D = new Vector3D(this._0D_V_, -0.5, 0);
        var _local3:Vector3D = new Vector3D(this._0D_V_, this._0D_V_, 0);
        var _local4:Vector3D = new Vector3D(-(this._0D_V_), this._0D_V_, 0);
        var _local5:Vector3D = new Vector3D(-(this._R_x), -0.5, this.h_);
        var _local6:Vector3D = new Vector3D(this._R_x, -0.5, this.h_);
        var _local7:Vector3D = new Vector3D(this._R_x, this._R_x, this.h_);
        var _local8:Vector3D = new Vector3D(-(this._R_x), this._R_x, this.h_);
        this._0E_b(_local7, _local6, _local2, _local3, texture_, true, false);
        this._0E_b(_local5, _local8, _local4, _local1, texture_, false, true);
        this._0E_b(_local8, _local7, _local3, _local4, texture_, true, true);
        var _local9:BitmapData = texture_;
        if (this._I_z.hasOwnProperty("ShortLineTexture")) {
            _local9 = AssetLibrary._xK_(String(this._I_z.ShortLineTexture.File), int(this._I_z.ShortLineTexture.Index));
        }
        this._H_m([_local5, _local6, _local7, _local8], new <Number>[0.25, 0, 0.75, 0, 0.25, 0.75], _local9);
    }

    override protected function buildL():void {
        var _local1:Vector3D = new Vector3D(-(this._0D_V_), -0.5, 0);
        var _local2:Vector3D = new Vector3D(this._0D_V_, -0.5, 0);
        var _local3:Vector3D = new Vector3D(this._0D_V_, -(this._0D_V_), 0);
        var _local4:Vector3D = new Vector3D(0.5, -(this._0D_V_), 0);
        var _local5:Vector3D = new Vector3D(0.5, this._0D_V_, 0);
        var _local6:Vector3D = new Vector3D(-(this._0D_V_), this._0D_V_, 0);
        var _local7:Vector3D = new Vector3D(-(this._R_x), -0.5, this.h_);
        var _local8:Vector3D = new Vector3D(this._R_x, -0.5, this.h_);
        var _local9:Vector3D = new Vector3D(this._R_x, -(this._R_x), this.h_);
        var _local10:Vector3D = new Vector3D(0.5, -(this._R_x), this.h_);
        var _local11:Vector3D = new Vector3D(0.5, this._R_x, this.h_);
        var _local12:Vector3D = new Vector3D(-(this._R_x), this._R_x, this.h_);
        this._hc(_local9, _local8, _local2, _local3, texture_, N2, true);
        this._hc(_local10, _local9, _local3, _local4, texture_, N2, false);
        this._0E_b(_local12, _local11, _local5, _local6, texture_, true, false);
        this._0E_b(_local7, _local12, _local6, _local1, texture_, false, true);
        var _local13:BitmapData = texture_;
        if (this._I_z.hasOwnProperty("LTexture")) {
            _local13 = AssetLibrary._xK_(String(this._I_z.LTexture.File), int(this._I_z.LTexture.Index));
        }
        this._H_m([_local7, _local8, _local9, _local10, _local11, _local12], new <Number>[0.25, 0, 0.75, 0, 0.25, 0.75], _local13);
    }

    override protected function buildLine():void {
        var _local1:Vector3D = new Vector3D(-(this._0D_V_), -0.5, 0);
        var _local2:Vector3D = new Vector3D(this._0D_V_, -0.5, 0);
        var _local3:Vector3D = new Vector3D(this._0D_V_, 0.5, 0);
        var _local4:Vector3D = new Vector3D(-(this._0D_V_), 0.5, 0);
        var _local5:Vector3D = new Vector3D(-(this._R_x), -0.5, this.h_);
        var _local6:Vector3D = new Vector3D(this._R_x, -0.5, this.h_);
        var _local7:Vector3D = new Vector3D(this._R_x, 0.5, this.h_);
        var _local8:Vector3D = new Vector3D(-(this._R_x), 0.5, this.h_);
        this._0E_b(_local7, _local6, _local2, _local3, texture_, false, false);
        this._0E_b(_local5, _local8, _local4, _local1, texture_, false, false);
        var _local9:BitmapData = texture_;
        if (this._I_z.hasOwnProperty("LineTexture")) {
            _local9 = AssetLibrary._xK_(String(this._I_z.LineTexture.File), int(this._I_z.LineTexture.Index));
        }
        this._H_m([_local5, _local6, _local7, _local8], new <Number>[0.25, 0, 0.75, 0, 0.25, 1], _local9);
    }

    override protected function buildT():void {
        var _local1:Vector3D = new Vector3D(-(this._0D_V_), -0.5, 0);
        var _local2:Vector3D = new Vector3D(this._0D_V_, -0.5, 0);
        var _local3:Vector3D = new Vector3D(this._0D_V_, -(this._0D_V_), 0);
        var _local4:Vector3D = new Vector3D(0.5, -(this._0D_V_), 0);
        var _local5:Vector3D = new Vector3D(0.5, this._0D_V_, 0);
        var _local6:Vector3D = new Vector3D(-0.5, this._0D_V_, 0);
        var _local7:Vector3D = new Vector3D(-0.5, -(this._0D_V_), 0);
        var _local8:Vector3D = new Vector3D(-(this._0D_V_), -(this._0D_V_), 0);
        var _local9:Vector3D = new Vector3D(-(this._R_x), -0.5, this.h_);
        var _local10:Vector3D = new Vector3D(this._R_x, -0.5, this.h_);
        var _local11:Vector3D = new Vector3D(this._R_x, -(this._R_x), this.h_);
        var _local12:Vector3D = new Vector3D(0.5, -(this._R_x), this.h_);
        var _local13:Vector3D = new Vector3D(0.5, this._R_x, this.h_);
        var _local14:Vector3D = new Vector3D(-0.5, this._R_x, this.h_);
        var _local15:Vector3D = new Vector3D(-0.5, -(this._R_x), this.h_);
        var _local16:Vector3D = new Vector3D(-(this._R_x), -(this._R_x), this.h_);
        this._hc(_local11, _local10, _local2, _local3, texture_, N2, true);
        this._hc(_local12, _local11, _local3, _local4, texture_, N2, false);
        this._0E_b(_local14, _local13, _local5, _local6, texture_, false, false);
        this._hc(_local16, _local15, _local7, _local8, texture_, N0, true);
        this._hc(_local9, _local16, _local8, _local1, texture_, N0, false);
        var _local17:BitmapData = texture_;
        if (this._I_z.hasOwnProperty("TTexture")) {
            _local17 = AssetLibrary._xK_(String(this._I_z.TTexture.File), int(this._I_z.TTexture.Index));
        }
        this._H_m([_local9, _local10, _local11, _local12, _local13, _local14, _local15, _local16], new <Number>[0.25, 0, 0.75, 0, 0.25, 0.25], _local17);
    }

    override protected function buildCross():void {
        var _local1:Vector3D = new Vector3D(-(this._0D_V_), -0.5, 0);
        var _local2:Vector3D = new Vector3D(this._0D_V_, -0.5, 0);
        var _local3:Vector3D = new Vector3D(this._0D_V_, -(this._0D_V_), 0);
        var _local4:Vector3D = new Vector3D(0.5, -(this._0D_V_), 0);
        var _local5:Vector3D = new Vector3D(0.5, this._0D_V_, 0);
        var _local6:Vector3D = new Vector3D(this._0D_V_, this._0D_V_, 0);
        var _local7:Vector3D = new Vector3D(this._0D_V_, 0.5, 0);
        var _local8:Vector3D = new Vector3D(-(this._0D_V_), 0.5, 0);
        var _local9:Vector3D = new Vector3D(-(this._0D_V_), this._0D_V_, 0);
        var _local10:Vector3D = new Vector3D(-0.5, this._0D_V_, 0);
        var _local11:Vector3D = new Vector3D(-0.5, -(this._0D_V_), 0);
        var _local12:Vector3D = new Vector3D(-(this._0D_V_), -(this._0D_V_), 0);
        var _local13:Vector3D = new Vector3D(-(this._R_x), -0.5, this.h_);
        var _local14:Vector3D = new Vector3D(this._R_x, -0.5, this.h_);
        var _local15:Vector3D = new Vector3D(this._R_x, -(this._R_x), this.h_);
        var _local16:Vector3D = new Vector3D(0.5, -(this._R_x), this.h_);
        var _local17:Vector3D = new Vector3D(0.5, this._R_x, this.h_);
        var _local18:Vector3D = new Vector3D(this._R_x, this._R_x, this.h_);
        var _local19:Vector3D = new Vector3D(this._R_x, 0.5, this.h_);
        var _local20:Vector3D = new Vector3D(-(this._R_x), 0.5, this.h_);
        var _local21:Vector3D = new Vector3D(-(this._R_x), this._R_x, this.h_);
        var _local22:Vector3D = new Vector3D(-0.5, this._R_x, this.h_);
        var _local23:Vector3D = new Vector3D(-0.5, -(this._R_x), this.h_);
        var _local24:Vector3D = new Vector3D(-(this._R_x), -(this._R_x), this.h_);
        this._hc(_local15, _local14, _local2, _local3, texture_, N2, true);
        this._hc(_local16, _local15, _local3, _local4, texture_, N2, false);
        this._hc(_local18, _local17, _local5, _local6, texture_, N4, true);
        this._hc(_local19, _local18, _local6, _local7, texture_, N4, false);
        this._hc(_local21, _local20, _local8, _local9, texture_, N6, true);
        this._hc(_local22, _local21, _local9, _local10, texture_, N6, false);
        this._hc(_local24, _local23, _local11, _local12, texture_, N0, true);
        this._hc(_local13, _local24, _local12, _local1, texture_, N0, false);
        var _local25:BitmapData = texture_;
        if (this._I_z.hasOwnProperty("CrossTexture")) {
            _local25 = AssetLibrary._xK_(String(this._I_z.CrossTexture.File), int(this._I_z.CrossTexture.Index));
        }
        this._H_m([_local13, _local14, _local15, _local16, _local17, _local18, _local19, _local20, _local21, _local22, _local23, _local24], new <Number>[0.25, 0, 0.75, 0, 0.25, 0.25], _local25);
    }

    protected function _0E_b(_arg1:Vector3D, _arg2:Vector3D, _arg3:Vector3D, _arg4:Vector3D, _arg5:BitmapData, _arg6:Boolean, _arg7:Boolean):void {
        var _local8:int = (_8J_.vL_.length / 3);
        _8J_.vL_.push(_arg1.x, _arg1.y, _arg1.z, _arg2.x, _arg2.y, _arg2.z, _arg3.x, _arg3.y, _arg3.z, _arg4.x, _arg4.y, _arg4.z);
        var _local9:Number = ((_arg6) ? (-((this._0D_V_ - this._R_x)) / ((1 - (this._0D_V_ - this._R_x)) - ((_arg7) ? (this._0D_V_ - this._R_x) : 0))) : 0);
        _8J_.uvts_.push(0, 0, 0, 1, 0, 0, 1, 1, 0, _local9, 1, 0);
        var _local10:ObjectFace3D = new ObjectFace3D(_8J_, new <int>[_local8, (_local8 + 1), (_local8 + 2), (_local8 + 3)]);
        _local10.texture_ = _arg5;
        _local10.bitmapFill_.repeat = this._3A_;
        _8J_.faces_.push(_local10);
    }

    protected function _hc(_arg1:Vector3D, _arg2:Vector3D, _arg3:Vector3D, _arg4:Vector3D, _arg5:BitmapData, _arg6:Vector3D, _arg7:Boolean):void {
        var _local8:int = (_8J_.vL_.length / 3);
        _8J_.vL_.push(_arg1.x, _arg1.y, _arg1.z, _arg2.x, _arg2.y, _arg2.z, _arg3.x, _arg3.y, _arg3.z, _arg4.x, _arg4.y, _arg4.z);
        if (_arg7) {
            _8J_.uvts_.push((-0.5 + this._R_x), 0, 0, 0, 0, 0, 0, 0, 0, (-0.5 + this._0D_V_), 1, 0);
        } else {
            _8J_.uvts_.push(1, 0, 0, (1.5 - this._R_x), 0, 0, 0, 0, 0, 1, 1, 0);
        }
        var _local9:ObjectFace3D = new ObjectFace3D(_8J_, new <int>[_local8, (_local8 + 1), (_local8 + 2), (_local8 + 3)]);
        _local9.texture_ = _arg5;
        _local9.bitmapFill_.repeat = this._3A_;
        _local9.normalL_ = _arg6;
        _8J_.faces_.push(_local9);
    }

    protected function _H_m(_arg1:Array, _arg2:Vector.<Number>, _arg3:BitmapData):void {
        var _local4:int = (_8J_.vL_.length / 3);
        var _local5:Vector.<int> = new Vector.<int>();
        var _local6:uint;
        while (_local6 < _arg1.length) {
            _8J_.vL_.push(_arg1[_local6].x, _arg1[_local6].y, _arg1[_local6].z);
            _local5.push((_local4 + _local6));
            if (_local6 == 0) {
                _8J_.uvts_.push(_arg2[0], _arg2[1], 0);
            } else {
                if (_local6 == 1) {
                    _8J_.uvts_.push(_arg2[2], _arg2[3], 0);
                } else {
                    if (_local6 == (_arg1.length - 1)) {
                        _8J_.uvts_.push(_arg2[4], _arg2[5], 0);
                    } else {
                        _8J_.uvts_.push(0, 0, 0);
                    }
                }
            }
            _local6++;
        }
        var _local7:ObjectFace3D = new ObjectFace3D(_8J_, _local5);
        _local7.texture_ = _arg3;
        _local7.bitmapFill_.repeat = this._0A_i;
        _8J_.faces_.push(_local7);
    }

}
}//package com.company.assembleegameclient.objects

