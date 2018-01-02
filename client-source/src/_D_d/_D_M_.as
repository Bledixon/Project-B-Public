// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._D_M_

package _D_d {
import _E_7._for_;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

public class _D_M_ extends _for_ {

    private static const _be:int = 180;

    public function _D_M_(_arg1:XML) {
        super(0x363636, 1, 0x9B9B9B, 1, true);
        this._P_V_ = new SimpleText(16, 0xFFFFFF, false, (_be - 4), 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.wordWrap = true;
        this._P_V_.text = String(_arg1.@id);
        this._P_V_._08S_();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._P_V_.x = 0;
        this._P_V_.y = 0;
        addChild(this._P_V_);
    }
    private var _P_V_:SimpleText;
}
}//package _D_d

