// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._jn

package _0K_m {
import com.company.assembleegameclient.util._wW_;

public class _jn extends Particle {

    private const _4j:Number = 0.0025;

    public static function create(_arg1:*, _arg2:uint, _arg3:Number, _arg4:Number, _arg5:Number, _arg6:Number, _arg7:Number):_jn {
        var _local8:_jn = (_wW_.getObject(_arg1) as _jn);
        if (!_local8) {
            _local8 = new _jn(_arg2, _arg3, _arg4, _arg5, _arg6, _arg7);
        }
        return (_local8);
    }

    public function _jn(_arg1:uint, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number, _arg6:Number) {
        super(_arg1, 0, (75 + (Math.random() * 50)));
        this._ll = _arg2;
        this.life = (_arg3 * 1000);
        this.lifeVariance = _arg4;
        this.speedVariance = _arg5;
        this.spread = _arg6;
        this._01x = 0;
        this._M__ = 0;
    }
    public var _hB_:int;
    public var speed:Number;
    public var spread:Number;
    public var _ll:Number;
    public var life:Number;
    public var lifeVariance:Number;
    public var speedVariance:Number;
    public var _G_n:Number;
    public var _01x:Number;
    public var _M__:Number;

    override public function removeFromMap():void {
        super.removeFromMap();
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Number = ((_arg1 - this._hB_) / 1000);
        this._G_n = (this._G_n - _arg2);
        if (this._G_n <= 0) {
            return (false);
        }
        z_ = (this.speed * _local3);
        if (this.spread > 0) {
            moveTo((x_ + ((this._01x * _arg2) * this._4j)), (y_ + ((this._M__ * _arg2) * this._4j)));
        }
        return (true);
    }

    public function restart(_arg1:int, _arg2:int):void {
        this._hB_ = _arg1;
        var _local3:Number = Math.random();
        this.speed = ((this._ll - (this._ll * (_local3 * (1 - this.speedVariance)))) * 10);
        if (this.spread > 0) {
            this._01x = ((Math.random() * this.spread) - 0.1);
            this._M__ = ((Math.random() * this.spread) - 0.1);
        }
        var _local4:Number = ((_arg2 - _arg1) / 1000);
        this._G_n = (this.life - (this.life * (_local3 * (1 - this.lifeVariance))));
        z_ = (this.speed * _local4);
    }

}
}//package _0K_m

