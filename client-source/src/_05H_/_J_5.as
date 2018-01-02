// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._J_5

package _05H_ {
public class _J_5 extends _U_y {

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var activate:XMLList;
        var otherActivate:XMLList;
        var damage:int;
        var otherDamage:int;
        var radius:Number;
        var otherRadius:Number;
        var duration:Number;
        var otherDuration:Number;
        var avg:Number;
        var otherAvg:Number;
        var text:String;
        activate = itemXML.Activate.(text() == "PoisonGrenade");
        otherActivate = curItemXML.Activate.(text() == "PoisonGrenade");
        _t4 = "";
        if ((((activate.length() == 1)) && ((otherActivate.length() == 1)))) {
            damage = int(activate[0].@totalDamage);
            otherDamage = int(otherActivate[0].@totalDamage);
            radius = Number(activate[0].@radius);
            otherRadius = Number(otherActivate[0].@radius);
            duration = Number(activate[0].@duration);
            otherDuration = Number(otherActivate[0].@duration);
            avg = (((0.33 * damage) + (0.33 * radius)) + (0.33 * duration));
            otherAvg = (((0.33 * otherDamage) + (0.33 * otherRadius)) + (0.33 * otherDuration));
            text = (((((damage + " HP over ") + duration) + " secs within ") + radius) + " sqrs\n");
            _t4 = (_t4 + ("Poison Grenade: " + _qF_(text, _qy((avg - otherAvg)))));
            _5n[activate[0].toXMLString()] = true;
        }
    }

}
}//package _05H_

