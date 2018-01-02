// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_4X_._0G_R_

package _4X_ {
public class _0G_R_ extends _zU_ {

    public function _0G_R_(_arg1:Function, ..._args) {
        this.callback = _arg1;
        this._wR_ = _args;
    }
    private var callback:Function;
    private var _wR_:Array;

    override protected function startTask():void {
        this.callback.apply(this._wR_);
        _C_t(true);
    }

}
}//package _4X_

