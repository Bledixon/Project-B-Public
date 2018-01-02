// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._04E_

package _05H_ {
public class _04E_ extends _U_y {

    private var itemXML:XML;
    private var curItemXML:XML;
    private var _E_y:XML;
    private var _0F_j:XML;

    override protected function compareSlots(_arg1:XML, _arg2:XML):void {
        this.itemXML = _arg1;
        this.curItemXML = _arg2;
        this._E_y = _arg1.Projectile[0];
        this._0F_j = _arg2.Projectile[0];
        _t4 = this._wD_();
        _t4 = (_t4 + this._M_l());
        _5n[this._E_y.toXMLString()] = true;
    }

    private function _wD_():String {
        var _local1:int = int(this._E_y.MinDamage);
        var _local2:int = int(this._E_y.MaxDamage);
        var _local3:int = int(this._0F_j.MinDamage);
        var _local4:int = int(this._0F_j.MaxDamage);
        var _local5:Number = ((_local1 + _local2) / 2);
        var _local6:Number = ((_local3 + _local4) / 2);
        var _local7:String = _qy((_local5 - _local6));
        var _local8:String = (( _local1 == _local2) ? _local2.toString() : _local1 + " - " + _local2);
        return ('Damage: <font color="' + _local7 + '">' + _local8 + "</font>\n");
    }

    private function _M_l():String {
        var _local1:Number = ((Number(this._E_y.Speed) * Number(this._E_y.LifetimeMS)) / 10000);
        var _local2:Number = ((Number(this._0F_j.Speed) * Number(this._0F_j.LifetimeMS)) / 10000);
        var _local3:String = _qy(_local1 - _local2);
        return ('Range: <font color="' + _local3 + '">' + _local1 + "</font>\n");
    }

}
}//package _05H_

