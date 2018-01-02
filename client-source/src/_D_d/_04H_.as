// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._04H_

package _D_d {
import _060._P_2;

public class _04H_ extends _P_2 {

    public function _04H_(_arg1:_N_g, _arg2:int, _arg3:int, _arg4:_11) {
        this.map_ = _arg1;
        this.x_ = _arg2;
        this.y_ = _arg3;
        this._W_R_ = _arg4.clone();
    }
    private var map_:_N_g;
    private var x_:int;
    private var y_:int;
    private var _W_R_:_11;

    override public function execute():void {
        this.map_._cg(this.x_, this.y_);
    }

    override public function unexecute():void {
        this.map_._y5(this.x_, this.y_, this._W_R_);
    }

}
}//package _D_d

