// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m.XMLEffect

package _0K_m {
import com.company.assembleegameclient.objects.GameObject;

public class XMLEffect extends _I_b {

    public function XMLEffect(_arg1:GameObject, _arg2:_D_J_) {
        this.go_ = _arg1;
        this._0B_p = _0H_Y_._020[_arg2.particle];
        this._hY_ = _arg2.cooldown;
        this._0L_N_ = 0;
    }
    private var go_:GameObject;
    private var _0B_p:_7g;
    private var _hY_:Number;
    private var _0L_N_:Number;

    override public function update(_arg1:int, _arg2:int):Boolean {
        if (this.go_.map_ == null) {
            return (false);
        }
        var _local3:Number = (_arg2 / 1000);
        this._0L_N_ = (this._0L_N_ - _local3);
        if (this._0L_N_ >= 0) {
            return (true);
        }
        this._0L_N_ = this._hY_;
        map_.addObj(new _uj(this._0B_p), this.go_.x_, this.go_.y_);
        return (true);
    }

}
}//package _0K_m

