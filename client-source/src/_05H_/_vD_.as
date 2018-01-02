// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._vD_

package _05H_ {
public class _vD_ extends _U_y {

    override protected function compareSlots(_arg1:XML, _arg2:XML):void {
        var _local3:XML;
        var _local4:XML;
        var _local5:int;
        var _local6:int;
        var _local7:String;
        _local3 = this._kc(_arg1);
        _local4 = this._kc(_arg2);
        _t4 = "";
        if (((!((_local3 == null))) && (!((_local4 == null))))) {
            _local5 = int(_local3.@duration);
            _local6 = int(_local4.@duration);
            _local7 = _qy((_local5 - _local6));
            _t4 = (_t4 + ("Stasis on group: " + _qF_((_local5 + " secs\n"), _local7)));
            _5n[_local3.toXMLString()] = true;
            this._O_J_(_arg1);
        }
    }

    private function _kc(orbXML:XML):XML {
        var matches:XMLList;
        matches = orbXML.Activate.(text() == "StasisBlast");
        return ((((matches.length()) == 1) ? matches[0] : null));
    }

    private function _O_J_(itemXML:XML):void {
        var selfTags:XMLList;
        var speedy:XML;
        var damaging:XML;
        if (itemXML.@id == "Orb of Conflict") {
            selfTags = itemXML.Activate.(text() == "ConditionEffectSelf");
            speedy = selfTags.(@effect == "Speedy")[0];
            damaging = selfTags.(@effect == "Damaging")[0];
            _t4 = (_t4 + ("Effect on Self:\n" + _qF_((("Speedy for " + speedy.@duration) + " secs\n"), _0C_1)));
            _t4 = (_t4 + ("Effect on Self:\n" + _qF_((("Damaging for " + damaging.@duration) + "secs\n"), _0C_1)));
            _5n[speedy.toXMLString()] = true;
            _5n[damaging.toXMLString()] = true;
        }
    }

}
}//package _05H_

