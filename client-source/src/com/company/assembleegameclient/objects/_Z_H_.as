// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects._Z_H_

package com.company.assembleegameclient.objects {
import flash.display.BitmapData;

import com.company.assembleegameclient.util._lJ_;

import flash.utils.Dictionary;

import _0K_m._D_J_;

import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.appengine.RemoteTexture;
import com.company.util.AssetLibrary;
import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.parameters.Parameters;

import com.company.assembleegameclient.appengine.*;

public class _Z_H_ {

    public function _Z_H_(_arg1:XML) {
        var _local2:XML;
        super();
        if (_arg1.hasOwnProperty("Texture")) {
            this.parse(XML(_arg1.Texture));
        } else {
            if (_arg1.hasOwnProperty("AnimatedTexture")) {
                this.parse(XML(_arg1.AnimatedTexture));
            } else {
                if (_arg1.hasOwnProperty("RemoteTexture")) {
                    this.parse(XML(_arg1.RemoteTexture));
                } else {
                    if (_arg1.hasOwnProperty("RandomTexture")) {
                        this.parse(XML(_arg1.RandomTexture));
                    } else {
                        this.parse(_arg1);
                    }
                }
            }
        }
        for each (_local2 in _arg1.AltTexture) {
            this.parse(_local2);
        }
        if (_arg1.hasOwnProperty("Mask")) {
            this.parse(XML(_arg1.Mask));
        }
        if (_arg1.hasOwnProperty("Effect")) {
            this.parse(XML(_arg1.Effect));
        }
    }
    public var texture_:BitmapData = null;
    public var mask_:BitmapData = null;
    public var _yN_:_lJ_ = null;
    public var _07_:Vector.<_Z_H_> = null;
    public var _V_N_:Dictionary = null;
    public var _0Y_:int;
    public var _0L_G_:_D_J_ = null;

    public function getTexture(_arg1:int = 0):BitmapData {
        if (this._07_ == null) {
            return (this.texture_);
        }
        var _local2:_Z_H_ = this._07_[(_arg1 % this._07_.length)];
        return (_local2.getTexture(_arg1));
    }

    public function _0K_J_(_arg1:int):_Z_H_ {
        if (this._V_N_ == null) {
            return (null);
        }
        return (this._V_N_[_arg1]);
    }

    private function parse(_arg1:XML):void {
        var _local2:_J_H_;
        var _local3:RemoteTexture;
        var _local4:XML;
        switch (_arg1.name().toString()) {
            case "Texture":
                this.texture_ = AssetLibrary._xK_(String(_arg1.File), int(_arg1.Index));
                return;
            case "Mask":
                this.mask_ = AssetLibrary._xK_(String(_arg1.File), int(_arg1.Index));
                return;
            case "Effect":
                this._0L_G_ = new _D_J_(_arg1);
                return;
            case "AnimatedTexture":
                this._yN_ = _0B_c._J_v(String(_arg1.File), int(_arg1.Index));
                _local2 = this._yN_._l8(0, _lJ_._sS_, 0);
                this.texture_ = _local2.image_;
                this.mask_ = _local2.mask_;
                return;
            case "RemoteTexture":
                this.texture_ = AssetLibrary._xK_("lofiObj3", 0xFF);
                if (Parameters._I_O_()) {
                    _local3 = new RemoteTexture(_arg1.Id, _arg1.Instance, this._Z_v);
                    _local3.run();
                }
                this._0Y_ = ((_arg1.hasOwnProperty("Right")) ? _lJ_.RIGHT : _lJ_.DOWN);
                return;
            case "RandomTexture":
                this._07_ = new Vector.<_Z_H_>();
                for each (_local4 in _arg1.children()) {
                    this._07_.push(new _Z_H_(_local4));
                }
                return;
            case "AltTexture":
                if (this._V_N_ == null) {
                    this._V_N_ = new Dictionary();
                }
                this._V_N_[int(_arg1.@id)] = new _Z_H_(_arg1);
                return;
        }
    }

    private function _Z_v(_arg1:BitmapData):void {
        if (_arg1.width > 16) {
            _0B_c.add("remoteTexture", _arg1, null, (_arg1.width / 7), _arg1.height, _arg1.width, _arg1.height, this._0Y_);
            this._yN_ = _0B_c._J_v("remoteTexture", 0);
            this.texture_ = this._yN_._l8(0, _lJ_._sS_, 0).image_;
        } else {
            this.texture_ = _arg1;
        }
    }

}
}//package com.company.assembleegameclient.objects

