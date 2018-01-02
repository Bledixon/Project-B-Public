// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._X_7

package _05H_ {
public class _X_7 extends _U_y {

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var trap:XML;
        var otherTrap:XML;
        var tag:XML;
        var text:String;
        var radius:Number;
        var otherRadius:Number;
        var damage:int;
        var otherDamage:int;
        var duration:int;
        var otherDuration:int;
        var avg:Number;
        var otherAvg:Number;
        var textColor:String;
        var compositeHtml:String;
        trap = this._sZ_(itemXML);
        otherTrap = this._sZ_(curItemXML);
        _t4 = "";
        if (((!((trap == null))) && (!((otherTrap == null))))) {
            if (itemXML.@id == "Coral Venom Trap") {
                tag = itemXML.Activate.(text() == "Trap")[0];
                text = ((((((tag.@totalDamage + " HP within ") + tag.@radius) + " sqrs\n") + "Paralyzed for ") + tag.@condDuration) + " seconds\n");
                _t4 = (_t4 + ("Trap: " + _qF_(text, _0C_1)));
                _5n[tag.toXMLString()] = true;
            } else {
                radius = Number(trap.@radius);
                otherRadius = Number(otherTrap.@radius);
                damage = int(trap.@totalDamage);
                otherDamage = int(otherTrap.@totalDamage);
                duration = int(trap.@condDuration);
                otherDuration = int(otherTrap.@condDuration);
                avg = (((0.33 * radius) + (0.33 * damage)) + (0.33 * duration));
                otherAvg = (((0.33 * otherRadius) + (0.33 * otherDamage)) + (0.33 * otherDuration));
                textColor = _qy((avg - otherAvg));
                compositeHtml = ((((((damage + " HP within ") + radius) + " sqrs\n") + " Slowed for ") + duration) + " seconds\n");
                _t4 = (_t4 + ("Trap: " + _qF_(compositeHtml, textColor)));
                _5n[trap.toXMLString()] = true;
            }
        }
    }

    private function _sZ_(xml:XML):XML {
        var matches:XMLList;
        matches = xml.Activate.(text() == "Trap");
        if (matches.length() >= 1) {
            return (matches[0]);
        }
        return (null);
    }

}
}//package _05H_

