// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._zr

package _05H_ {
public class _zr extends _U_y {

    public function _zr() {
        this._7_ = new _09A_();
    }
    private var _7_:_09A_;

    override protected function compareSlots(_arg1:XML, _arg2:XML):void {
        var _local3:String;
        this._7_._N_Q_(_arg1, _arg2);
        _t4 = this._7_._t4;
        for (_local3 in this._7_._5n) {
            _5n[_local3] = this._7_._5n[_local3];
        }
        this._04S_(_arg1);
    }

    private function _04S_(itemXML:XML):void {
        var tag:XML;
        var str:String;
        if (itemXML.@id == "Shield of Ogmur") {
            tag = itemXML.ConditionEffect.(text() == "Armor Broken")[0];
            str = (("Armor Broken for " + tag.@duration) + " secs\n");
            str = ("Party Effect: " + _qF_(str, _0C_1));
            _t4 = (_t4 + str);
            _5n[tag.toXMLString()] = str;
        }
    }

}
}//package _05H_

