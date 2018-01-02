// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_P_._3Y_

package _0_P_ {


public class _3Y_ {

    public function _3Y_(_arg1:XML) {
        var _local2:XML;
        this._2_ = new Vector.<_C_n>();
        super();
        if (("@prob" in _arg1)) {
            this._01D_ = Number(_arg1.@prob);
        }
        this.period_ = int((Number(_arg1.@period) * 1000));
        this._oB_ = int((Number(_arg1.@periodJitter) * 1000));
        this._0E_7 = (String(_arg1.@sync) == "true");
        for each (_local2 in _arg1.Frame) {
            this._2_.push(new _C_n(_local2));
        }
    }
    public var _01D_:Number = 1;
    public var period_:int;
    public var _oB_:int;
    public var _0E_7:Boolean = false;
    public var _2_:Vector.<_C_n>;

    public function _tu(_arg1:int):int {
        if (this._0E_7) {
            return ((int((_arg1 / this.period_)) * this.period_));
        }
        return (((_arg1 + this._04j()) + (200 * Math.random())));
    }

    public function _gr(_arg1:int):int {
        if (this._0E_7) {
            return (((int((_arg1 / this.period_)) * this.period_) + this.period_));
        }
        return ((_arg1 + this._04j()));
    }

    private function _04j():int {
        if (this._oB_ == 0) {
            return (this.period_);
        }
        return (((this.period_ - this._oB_) + ((2 * Math.random()) * this._oB_)));
    }

}
}//package _0_P_

