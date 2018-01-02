// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_4X_._o8

package _4X_ {


public class _o8 extends _zU_ {

    public function _o8() {
        this._A_X_ = new Vector.<_zU_>();
    }
    private var _A_X_:Vector.<_zU_>;
    private var _0_S_:int;

    override protected function startTask():void {
        this._0_S_ = 0;
        this._0J_4();
    }

    override protected function onReset():void {
        var _local1:_zU_;
        for each (_local1 in this._A_X_) {
            _local1.reset();
        }
    }

    public function add(_arg1:_zU_):void {
        this._A_X_.push(_arg1);
    }

    private function _0J_4():void {
        if (this._hs()) {
            this._9q();
        } else {
            _C_t(true);
        }
    }

    private function _hs():Boolean {
        return ((this._0_S_ < this._A_X_.length));
    }

    private function _9q():void {
        var _local1:_zU_ = this._A_X_[this._0_S_++];
        _local1._0B_O_.addOnce(this._T_T_);
        _local1.start();
    }

    private function _T_T_(_arg1:_zU_, _arg2:Boolean, _arg3:String):void {
        if (_arg2) {
            this._0J_4();
        } else {
            _C_t(false, _arg3);
        }
    }

}
}//package _4X_

