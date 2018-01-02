// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._t7

package _0K_m {
public class _t7 extends _06s {

    public function _t7(_arg1:int, _arg2:int, _arg3:int, _arg4:Number, _arg5:Number, _arg6:Number, _arg7:Number) {
        this._H_s = _arg4;
        super(_arg1, _arg2, _arg3, _arg5, _arg6, _arg7);
    }
    private var _H_s:Number;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local4:Number;
        timeLeft_ = (timeLeft_ - _arg2);
        if (timeLeft_ <= 0) {
            return (false);
        }
        if (((_0H_B_.obj_) && (_0H_B_.obj_.props_.static_))) {
            return (false);
        }
        var _local3:Number = (Math.random() * this._H_s);
        _local4 = (Math.random() * this._H_s);
        x_ = (x_ + (((dx_ * _local3) * _arg2) / 1000));
        y_ = (y_ + (((dy_ * _local4) * _arg2) / 1000));
        _H_9(((timeLeft_ / lifetime_) * initialSize_));
        return (true);
    }

}
}//package _0K_m

