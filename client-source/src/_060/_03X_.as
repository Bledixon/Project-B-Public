// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_060._03X_

package _060 {


public class _03X_ {

    public function _03X_() {
        this._kY_ = new Vector.<_8M_>();
        super();
    }
    private var _kY_:Vector.<_8M_>;
    private var _0E_i:int = 0;

    public function _D_1(_arg1:_8M_):void {
        this._kY_.length = this._0E_i;
        _arg1.execute();
        this._kY_.push(_arg1);
        this._0E_i++;
    }

    public function _G_l():void {
        if (this._0E_i == 0) {
            return;
        }
        this._kY_[--this._0E_i].unexecute();
    }

    public function _K_N_():void {
        if (this._0E_i == this._kY_.length) {
            return;
        }
        this._kY_[this._0E_i++].execute();
    }

    public function clear():void {
        this._0E_i = 0;
        this._kY_.length = 0;
    }

}
}//package _060

