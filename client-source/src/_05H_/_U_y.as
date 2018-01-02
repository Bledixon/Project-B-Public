// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._U_y

package _05H_ {
import flash.utils.Dictionary;

public class _U_y {

    internal static const _rJ_:String = "#00ff00";
    internal static const _at:String = "#ff0000";
    internal static const _iF_:String = "#FFFF8F";
    internal static const _u8:String = "#B3B3B3";
    internal static const _0C_1:String = "#8a2be2";

    public var _5n:Dictionary;
    public var _P_3:Dictionary;
    public var _t4:String;

    public function _N_Q_(_arg1:XML, _arg2:XML):void {
        this._09d();
        this.compareSlots(_arg1, _arg2);
    }

    public function _NQ_d_(_arg1:XML, _arg2:XML, _arg3:Object, _arg4:Object):void {
        this.compareSlotsData(_arg1, _arg2, _arg3, _arg4);
    }

    protected function compareSlots(_arg1:XML, _arg2:XML):void {
    }

    protected function compareSlotsData(_arg1:XML, _arg2:XML, _arg3:Object, _arg4:Object):void {
    }

    protected function _qy(_arg1:Number):String {
        if (_arg1 < 0) {
            return (_at);
        }
        if (_arg1 > 0) {
            return (_rJ_);
        }
        return (_iF_);
    }

    protected function _qF_(_arg1:String, _arg2:String = "#FFFF8F"):String {
        return ('<font color="' + _arg2 + '">' + _arg1 + "</font>");
    }

    protected function _X_C_(_arg1:String):String {
        return (this._qF_("MP Cost: ", _u8) + this._qF_(_arg1, _iF_) + "\n");
    }

    private function _09d():void {
        this._5n = new Dictionary();
        this._P_3 = new Dictionary();
    }

}
}//package _05H_

