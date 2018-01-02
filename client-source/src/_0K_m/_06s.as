// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._06s

package _0K_m {
public class _06s extends Particle {

    public function _06s(_arg1:int, _arg2:int, _arg3:int, _arg4:Number, _arg5:Number, _arg6:Number) {
        super(_arg2, _arg4, _arg1);
        this.initialSize_ = _arg1;
        this.lifetime_ = (this.timeLeft_ = _arg3);
        this.dx_ = _arg5;
        this.dy_ = _arg6;
    }
    public var lifetime_:int;
    public var timeLeft_:int;
    public var initialSize_:int;
    public var dx_:Number;
    public var dy_:Number;

    override public function update(_arg1:int, _arg2:int):Boolean {
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0) {
            return (false);
        }
        x_ = (x_ + ((this.dx_ * _arg2) / 1000));
        y_ = (y_ + ((this.dy_ * _arg2) / 1000));
        _H_9(((this.timeLeft_ / this.lifetime_) * this.initialSize_));
        return (true);
    }

}
}//package _0K_m

