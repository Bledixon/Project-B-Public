// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._0E_2

package _D_d {
import _E_7._for_;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

public class _0E_2 extends _for_ {

    private static const _be:int = 180;

    public function _0E_2(_arg1:XML) {
        super(0x2A2A2A, 1, 0x9B9B9B, 1, true);
        this._P_V_ = new SimpleText(16, 0xFFFFFF, false, (_be - 4), 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.wordWrap = true;
        this._P_V_.text = String(_arg1.@id);
        this._P_V_._08S_();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._P_V_.x = 0;
        this._P_V_.y = 0;
        addChild(this._P_V_);
        var _local2 = "";
        if (_arg1.hasOwnProperty("Speed")) {
            _local2 = (_local2 + (("Speed: " + Number(_arg1.Speed).toFixed(2)) + "\n"));
        } else {
            _local2 = (_local2 + "Speed: 1.00\n");
        }
        if (_arg1.hasOwnProperty("NoWalk")) {
            _local2 = (_local2 + "Unwalkable\n");
        }
        if (_arg1.hasOwnProperty("Push")) {
            _local2 = (_local2 + "Push\n");
        }
        if (_arg1.hasOwnProperty("Sink")) {
            _local2 = (_local2 + "Sink\n");
        }
        if (_arg1.hasOwnProperty("Sinking")) {
            _local2 = (_local2 + "Sinking\n");
        }
        if (_arg1.hasOwnProperty("Animate")) {
            _local2 = (_local2 + "Animated\n");
        }
        if (_arg1.hasOwnProperty("RandomOffset")) {
            _local2 = (_local2 + "Randomized\n");
        }
        this._C_G_ = new SimpleText(14, 0xB3B3B3, false, _be, 0, "Myriad Pro");
        this._C_G_.wordWrap = true;
        this._C_G_.text = String(_local2);
        this._C_G_._08S_();
        this._C_G_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._C_G_.x = 0;
        this._C_G_.y = (this._P_V_.height + 2);
        addChild(this._C_G_);
    }
    private var _P_V_:SimpleText;
    private var _C_G_:SimpleText;
}
}//package _D_d

