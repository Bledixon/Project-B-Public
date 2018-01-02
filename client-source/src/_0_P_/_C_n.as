// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_P_._C_n

package _0_P_ {
import com.company.assembleegameclient.objects._Z_H_;

public class _C_n {

    public function _C_n(_arg1:XML) {
        this.time_ = int((Number(_arg1.@time) * 1000));
        this._Y_D_ = new _Z_H_(_arg1);
    }
    public var time_:int;
    public var _Y_D_:_Z_H_;
}
}//package _0_P_

