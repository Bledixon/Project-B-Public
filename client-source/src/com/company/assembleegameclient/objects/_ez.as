// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects._ez

package com.company.assembleegameclient.objects {
import com.company.assembleegameclient.map._X_l;

import flash.utils.Dictionary;

import com.company.util.PointUtil;

import _011._0K_U_;

public class _ez {

    public static const _tn:int = 8;
    private static const _0B_h:Array = ["starred_", "distSqFromThisPlayer_", "objectId_"];
    private static const _h_:Array = [(Array.NUMERIC | Array.DESCENDING), Array.NUMERIC, Array.NUMERIC];
    private static const _1b:int = (50 * 50);//2500

    public function _ez(_arg1:_X_l) {
        this._X_e = [];
        this.starred_ = new Dictionary(true);
        this._0M_w = new Dictionary(true);
        super();
        this.map_ = _arg1;
    }
    public var map_:_X_l;
    public var _X_e:Array;
    private var lastUpdate_:int = -2147483648;
    private var starred_:Dictionary;
    private var _0M_w:Dictionary;

    public function update(_arg1:int, _arg2:int):void {
        var _local4:GameObject;
        var _local5:Player;
        if (_arg1 < (this.lastUpdate_ + 500)) {
            return;
        }
        this.lastUpdate_ = _arg1;
        this._X_e.length = 0;
        var _local3:Player = this.map_.player_;
        if (_local3 == null) {
            return;
        }
        for each (_local4 in this.map_.goDict_) {
            _local5 = (_local4 as Player);
            if (!(((_local5 == null)) || ((_local5 == _local3)))) {
                if (this.starred_[_local5.accountId_] != undefined) {
                    _local5.starred_ = true;
                }
                _local5._0M_w = !((this._0M_w[_local5.accountId_] == undefined));
                _local5.distSqFromThisPlayer_ = PointUtil._bm(_local3.x_, _local3.y_, _local5.x_, _local5.y_);
                if (!(((_local5.distSqFromThisPlayer_ > _1b)) && (!(_local5.starred_)))) {
                    if (_local3.canBeHitBy(_local5)) {
                        if (!_local5._di()) {
                            this._X_e.push(_local5);
                        }
                    } else {
                        this._X_e.push(_local5);
                    }
                }
            }
        }
        this._X_e.sortOn(_0B_h, _h_);
        if (this._X_e.length > _tn) {
            this._X_e.length = _tn;
        }
    }

    public function lockPlayer(_arg1:Player):void {
        this.starred_[_arg1.accountId_] = 1;
        this.lastUpdate_ = int.MIN_VALUE;
        this.map_.gs_.gsc_._eH_(0, true, _arg1.objectId_);
    }

    public function unlockPlayer(_arg1:Player):void {
        delete this.starred_[_arg1.accountId_];
        _arg1.starred_ = false;
        this.lastUpdate_ = int.MIN_VALUE;
        this.map_.gs_.gsc_._eH_(0, false, _arg1.objectId_);
    }

    public function setStars(_arg1:_0K_U_):void {
        var _local3:int;
        var _local2:int;
        while (_local2 < _arg1.accountIds_.length) {
            _local3 = _arg1.accountIds_[_local2];
            this.starred_[_local3] = 1;
            this.lastUpdate_ = int.MIN_VALUE;
            _local2++;
        }
    }

    public function ignorePlayer(_arg1:Player):void {
        this._0M_w[_arg1.accountId_] = 1;
        this.lastUpdate_ = int.MIN_VALUE;
        this.map_.gs_.gsc_._eH_(1, true, _arg1.objectId_);
    }

    public function unignorePlayer(_arg1:Player):void {
        delete this._0M_w[_arg1.accountId_];
        _arg1._0M_w = false;
        this.lastUpdate_ = int.MIN_VALUE;
        this.map_.gs_.gsc_._eH_(1, false, _arg1.objectId_);
    }

    public function setIgnores(_arg1:_0K_U_):void {
        var _local3:int;
        this._0M_w = new Dictionary(true);
        var _local2:int;
        while (_local2 < _arg1.accountIds_.length) {
            _local3 = _arg1.accountIds_[_local2];
            this._0M_w[_local3] = 1;
            this.lastUpdate_ = int.MIN_VALUE;
            _local2++;
        }
    }

}
}//package com.company.assembleegameclient.objects

