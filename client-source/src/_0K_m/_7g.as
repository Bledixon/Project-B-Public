// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._7g

package _0K_m {
import com.company.assembleegameclient.objects._Z_H_;

import _0_P_._0F_7;

public class _7g {

    public function _7g(_arg1:XML) {
        this.id_ = _arg1.@id;
        this._Y_D_ = new _Z_H_(_arg1);
        if (_arg1.hasOwnProperty("Size")) {
            this.size_ = Number(_arg1.Size);
        }
        if (_arg1.hasOwnProperty("Z")) {
            this.z_ = Number(_arg1.Z);
        }
        if (_arg1.hasOwnProperty("Duration")) {
            this.duration_ = Number(_arg1.Duration);
        }
        if (_arg1.hasOwnProperty("Animation")) {
            this._fe = new _0F_7(_arg1);
        }
    }
    public var id_:String;
    public var _Y_D_:_Z_H_;
    public var size_:int = 100;
    public var z_:Number = 0;
    public var duration_:Number = 0;
    public var _fe:_0F_7 = null;
}
}//package _0K_m

