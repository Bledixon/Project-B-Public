// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._M_

package _05H_ {
public class _M_ extends _U_y {

    override protected function compareSlots(_arg1:XML, _arg2:XML):void {
        var _local3:XML;
        var _local4:XML;
        var _local5:Number;
        var _local6:Number;
        var _local7:int;
        var _local8:int;
        var _local9:Number;
        var _local10:Number;
        _local3 = this._od(_arg1);
        _local4 = this._od(_arg2);
        _t4 = "";
        if (((!((_local3 == null))) && (!((_local4 == null))))) {
            _local5 = Number(_local3.@radius);
            _local6 = Number(_local4.@radius);
            _local7 = int(_local3.@totalDamage);
            _local8 = int(_local4.@totalDamage);
            _local9 = ((0.5 * _local5) + (0.5 * _local7));
            _local10 = ((0.5 * _local6) + (0.5 * _local8));
            _t4 = (_t4 + ("Steal: " + _qF_((((_local7 + " HP within ") + _local5) + " sqrs\n"), _qy((_local9 - _local10)))));
            _5n[_local3.toXMLString()] = true;
        }
    }

    private function _od(xml:XML):XML {
        var matches:XMLList;
        matches = xml.Activate.(text() == "VampireBlast");
        return ((((matches.length()) >= 1) ? matches[0] : null));
    }

}
}//package _05H_

