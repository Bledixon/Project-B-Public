// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._M_K_

package _05H_ {
public class _M_K_ extends _U_y {

    private static const _sw:String = "21";

    public function _M_K_() {
        _t4 = "";
    }
    private var _1R_:XMLList;
    private var _W_6:XMLList;

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var defense:int;
        var otherDefense:int;
        this._1R_ = itemXML.ActivateOnEquip.(@stat == _sw);
        this._W_6 = curItemXML.ActivateOnEquip.(@stat == _sw);
        if ((((this._1R_.length() == 1)) && ((this._W_6.length() == 1)))) {
            defense = int(this._1R_.@amount);
            otherDefense = int(this._W_6.@amount);
            _P_3[this._1R_[0].toXMLString()] = this._iN_(defense, otherDefense);
        }
    }

    private function _iN_(_arg1:int, _arg2:int):String {
        var _local3:String = _qy((_arg1 - _arg2));
        return (_qF_((("+" + _arg1) + " Defense"), _local3));
    }

}
}//package _05H_

