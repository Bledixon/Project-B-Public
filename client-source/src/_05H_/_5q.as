// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._5q

package _05H_ {
public class _5q extends _U_y {

    private var _S_y:XMLList;
    private var _1Q_:XMLList;

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var duration:Number;
        var otherDuration:Number;
        this._S_y = itemXML.Activate.(text() == "Decoy");
        this._1Q_ = curItemXML.Activate.(text() == "Decoy");
        _t4 = "";
        if ((((this._S_y.length() == 1)) && ((this._1Q_.length() == 1)))) {
            duration = Number(this._S_y[0].@duration);
            otherDuration = Number(this._1Q_[0].@duration);
            _t4 = (_t4 + ("Decoy: " + _qF_((duration.toString() + " secs\n"), _qy((duration - otherDuration)))));
            _5n[this._S_y[0].toXMLString()] = true;
        }
    }

}
}//package _05H_

