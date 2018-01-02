// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._W_C_

package _05H_ {
public class _W_C_ extends _U_y {

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var result:XMLList;
        var otherResult:XMLList;
        var damage:int;
        var otherDamage:int;
        var textColor:String;
        var targets:int;
        var otherTargets:int;
        var condition:String;
        var duration:Number;
        var compositeStr:String;
        var htmlStr:String;
        result = itemXML.Activate.(text() == "Lightning");
        otherResult = curItemXML.Activate.(text() == "Lightning");
        _t4 = "";
        if ((((result.length() == 1)) && ((otherResult.length() == 1)))) {
            damage = int(result[0].@totalDamage);
            otherDamage = int(otherResult[0].@totalDamage);
            textColor = _qy((damage - otherDamage));
            targets = int(result[0].@maxTargets);
            otherTargets = int(otherResult[0].@maxTargets);
            _t4 = (_t4 + ("Lightning: " + _qF_((((damage + " to ") + targets) + " targets\n"), _qy((damage - otherDamage)))));
            _5n[result[0].toXMLString()] = true;
        }
        if (itemXML.Activate.@condEffect) {
            condition = itemXML.Activate.@condEffect;
            duration = itemXML.Activate.@condDuration;
            compositeStr = ((((" " + condition) + " for ") + duration) + " secs\n");
            htmlStr = ("Shot Effect:\n" + _qF_(compositeStr, _iF_));
            _t4 = (_t4 + htmlStr);
        }
    }

}
}//package _05H_

