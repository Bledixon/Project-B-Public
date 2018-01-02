// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._F_o

package _05H_ {
public class _F_o extends _U_y {

    public function _F_o() {
        this._7_ = new _09A_();
    }
    private var _7_:_09A_;
    private var condition:XMLList;
    private var _0r:XMLList;

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var tagStr:String;
        var duration:Number;
        var conditionName:String;
        var compositeStr:String;
        var htmlStr:String;
        this.condition = itemXML.Projectile.ConditionEffect.(((((text() == "Slowed")) || ((text() == "Paralyzed")))) || ((text() == "Dazed")));
        this._0r = curItemXML.Projectile.ConditionEffect.(((((text() == "Slowed")) || ((text() == "Paralyzed")))) || ((text() == "Dazed")));
        this._7_._N_Q_(itemXML, curItemXML);
        _t4 = this._7_._t4;
        for (tagStr in this._7_._5n) {
            _5n[tagStr] = true;
        }
        if ((((this.condition.length() == 1)) && ((this._0r.length() == 1)))) {
            duration = Number(this.condition[0].@duration);
            conditionName = this.condition.text();
            compositeStr = ((((" " + conditionName) + " for ") + duration) + " secs\n");
            htmlStr = ("Shot Effect:\n" + _qF_(compositeStr, _iF_));
            _t4 = (_t4 + htmlStr);
            _5n[this.condition[0].toXMLString()] = htmlStr;
        }
    }

}
}//package _05H_

