// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._N_2

package _D_d {
import _060._P_2;

public class _N_2 extends _P_2 {

    public function _N_2(_arg1:_N_g, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:int) {
        this.map_ = _arg1;
        this.x_ = _arg2;
        this.y_ = _arg3;
        this._09V_ = _arg4;
        this._0A_S_ = _arg5;
        this._B_Y_ = _arg6;
    }
    private var map_:_N_g;
    private var x_:int;
    private var y_:int;
    private var _09V_:int;
    private var _0A_S_:int;
    private var _B_Y_:int;

    override public function execute():void {
        this.map_._2F_(this.x_, this.y_, this._09V_, this._B_Y_);
    }

    override public function unexecute():void {
        this.map_._2F_(this.x_, this.y_, this._09V_, this._0A_S_);
    }

}
}//package _D_d

