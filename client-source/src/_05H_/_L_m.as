// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._L_m

package _05H_ {
public class _L_m extends _U_y {

    override protected function compareSlots(_arg1:XML, _arg2:XML):void {
        var _local3:XML;
        var _local4:XML;
        var _local5:Number;
        var _local6:Number;
        _local3 = this._06O_(_arg1);
        _local4 = this._06O_(_arg2);
        _t4 = "";
        if (((!((_local3 == null))) && (!((_local4 == null))))) {
            _local5 = Number(_local3.@duration);
            _local6 = Number(_local4.@duration);
            _t4 = (_t4 + this._it(_local5, _local6));
            _5n[_local3.toXMLString()] = true;
        }
        this._O_J_(_arg1);
    }

    private function _O_J_(itemXML:XML):void {
        var teleportTag:XML;
        if (itemXML.@id == "Cloak of the Planewalker") {
            _t4 = (_t4 + _qF_("Teleport to Target\n", _0C_1));
            teleportTag = XML(itemXML.Activate.(text() == "Teleport"))[0];
            _5n[teleportTag.toXMLString()] = true;
        }
    }

    private function _06O_(xml:XML):XML {
        var matches:XMLList;
        var conditionTag:XML;
        matches = xml.Activate.(text() == "ConditionEffectSelf");
        for each (conditionTag in matches) {
            if (conditionTag.(@effect == "Invisible")) {
                return (conditionTag);
            }
        }
        return (null);
    }

    private function _it(_arg1:Number, _arg2:Number):String {
        var _local3 = "";
        var _local4:String = _qy((_arg1 - _arg2));
        _local3 = "Effect on Self:\n";
        return ((_local3 + _qF_((("Invisible for " + _arg1) + " secs\n"), _local4)));
    }

}
}//package _05H_

