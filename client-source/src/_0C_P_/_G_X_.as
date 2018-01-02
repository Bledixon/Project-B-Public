// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0C_P_._G_X_

package _0C_P_ {
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

import com.company.util.MoreColorUtil;

public class _G_X_ extends _0_i {

    public function _G_X_(_arg1:String, _arg2:String, _arg3:String, _arg4:Boolean = false) {
        super(_arg1, _arg2, _arg3);
        this._wK_ = new _N_9(Parameters.data_[_W_Y_]);
        this._wK_.addEventListener(Event.CHANGE, this._bR_);
        addChild(this._wK_);
        this._J_r(_arg4);
    }
    private var _wK_:_N_9;
    private var _0F_N_:Boolean;

    override public function refresh():void {
        this._wK_._09q(Parameters.data_[_W_Y_]);
    }

    public function _J_r(_arg1:Boolean):void {
        this._0F_N_ = _arg1;
        transform.colorTransform = ((this._0F_N_) ? MoreColorUtil._3f : MoreColorUtil.identity);
        mouseEnabled = !(this._0F_N_);
        mouseChildren = !(this._0F_N_);
    }

    private function _bR_(_arg1:Event):void {
        Parameters.setKey(_W_Y_, this._wK_.value());
        Parameters.save();
    }

}
}//package _0C_P_

