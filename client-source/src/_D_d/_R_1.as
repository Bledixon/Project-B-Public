// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._R_1

package _D_d {
import _060._P_2;

public class _R_1 extends _P_2 {

    public function _R_1(_arg1:_N_g, _arg2:int, _arg3:int, _arg4:String, _arg5:String) {
        this.map_ = _arg1;
        this.x_ = _arg2;
        this.y_ = _arg3;
        this._0K_O_ = _arg4;
        this._08v = _arg5;
    }
    private var map_:_N_g;
    private var x_:int;
    private var y_:int;
    private var _0K_O_:String;
    private var _08v:String;

    override public function execute():void {
        this.map_._N_F_(this.x_, this.y_, this._08v);
    }

    override public function unexecute():void {
        this.map_._N_F_(this.x_, this.y_, this._0K_O_);
    }

}
}//package _D_d

