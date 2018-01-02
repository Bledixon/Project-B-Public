// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05H_._oE_

package _05H_ {
public class _oE_ extends _U_y {

    private var _0F_P_:XML;
    private var speedy:XML;
    private var _0N_4:XML;
    private var _vs:XML;
    private var _08L_:XML;
    private var _dw:XML;

    override protected function compareSlots(_arg1:XML, _arg2:XML):void {
        this._fH_(_arg1, _arg2);
        _t4 = "";
        this._gU_();
        this._0I_P_();
        this._G_q();
    }

    private function _fH_(_arg1:XML, _arg2:XML):void {
        this._0F_P_ = this._jZ_(_arg1, "Berserk");
        this.speedy = this._H_1(_arg1, "Speedy");
        this._08L_ = this._H_1(_arg1, "Armored");

        this._0N_4 = this._jZ_(_arg2, "Berserk");
        this._vs = this._H_1(_arg2, "Speedy");
        this._dw = this._H_1(_arg2, "Armored");
    }

    private function _jZ_(xml:XML, typeName:String):XML {
        var matches:XMLList;
        var tag:XML;
        matches = xml.Activate.(text() == "ConditionEffectAura");
        for each (tag in matches) {
            if (tag.@effect == typeName) {
                return (tag);
            }
        }
        return (null);
    }

    private function _H_1(xml:XML, typeName:String):XML {
        var matches:XMLList;
        var tag:XML;
        matches = xml.Activate.(text() == "ConditionEffectSelf");
        for each (tag in matches) {
            if (tag.@effect == typeName) {
                return (tag);
            }
        }
        return (null);
    }

    private function _gU_():void {
        if ((((this._0F_P_ == null)) || ((this._0N_4 == null)))) {
            return;
        }
        var _local1:Number = Number(this._0F_P_.@range);
        var _local2:Number = Number(this._0N_4.@range);
        var _local3:Number = Number(this._0F_P_.@duration);
        var _local4:Number = Number(this._0N_4.@duration);
        var _local5:Number = ((0.5 * _local1) + (0.5 * _local3));
        var _local6:Number = ((0.5 * _local2) + (0.5 * _local4));
        var _local7 = (((("Within " + _local1) + " sqrs\nBerserk for ") + _local3) + " secs\n");
        _t4 = (_t4 + ("Party Effect: " + _qF_(_local7, _qy((_local5 - _local6)))));
        _5n[this._0F_P_.toXMLString()] = true;
    }

    private function _0I_P_():void {
        var _local1:Number;
        var _local2:Number;
        var _local3:String;
        if (((!((this.speedy == null))) && (!((this._vs == null))))) {
            _local1 = Number(this.speedy.@duration);
            _local2 = Number(this._vs.@duration);
            _local3 = (("Speedy for " + _local1) + " secs\n");
            _t4 = (_t4 + ("Effect on Self:\n" + _qF_(_local3, _qy((_local1 - _local2)))));
            _5n[this.speedy.toXMLString()] = true;
        } else {
            if (((!((this.speedy == null))) && ((this._vs == null)))) {
                _t4 = (_t4 + ("Effect on Self:\n" + _qF_((("Speedy for " + this.speedy.@duration) + " secs\n"), _rJ_)));
                _5n[this.speedy.toXMLString()] = true;
            }
        }
    }

    private function _G_q():void {
        if (this._08L_ != null) {
            _t4 = (_t4 + ("Effect on Self:\n" + _qF_((("Armored for " + this._08L_.@duration) + " secs\n"), _0C_1)));
            _5n[this._08L_.toXMLString()] = true;
        }
    }

}
}//package _05H_

