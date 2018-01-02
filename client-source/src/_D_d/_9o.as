// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._9o

package _D_d {
import _E_7._for_;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

public class _9o extends _for_ {

    private static const _be:int = 180;

    public function _9o(_arg1:XML) {
        var _local3:XML;
        super(0x2A2A2A, 1, 0x9B9B9B, 1, true);
        this._P_V_ = new SimpleText(16, 0xFFFFFF, false, (_be - 4), 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.wordWrap = true;
        this._P_V_.text = String(_arg1.@id);
        this._P_V_._08S_();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._P_V_.x = 0;
        this._P_V_.y = 0;
        addChild(this._P_V_);
        var _local2 = "";
        if (_arg1.hasOwnProperty("Group")) {
            _local2 = (_local2 + (("Group: " + _arg1.Group) + "\n"));
        }
        if (_arg1.hasOwnProperty("Static")) {
            _local2 = (_local2 + "Static\n");
        }
        if (_arg1.hasOwnProperty("Enemy")) {
            _local2 = (_local2 + "Enemy\n");
            if (_arg1.hasOwnProperty("MaxHitPoints")) {
                _local2 = (_local2 + (("MaxHitPoints: " + _arg1.MaxHitPoints) + "\n"));
            }
            if (_arg1.hasOwnProperty("Defense")) {
                _local2 = (_local2 + (("Defense: " + _arg1.Defense) + "\n"));
            }
        }
        if (_arg1.hasOwnProperty("God")) {
            _local2 = (_local2 + "God\n");
        }
        if (_arg1.hasOwnProperty("Quest")) {
            _local2 = (_local2 + "Quest\n");
        }
        if (_arg1.hasOwnProperty("Hero")) {
            _local2 = (_local2 + "Hero\n");
        }
        if (_arg1.hasOwnProperty("Encounter")) {
            _local2 = (_local2 + "Encounter\n");
        }
        if (_arg1.hasOwnProperty("Level")) {
            _local2 = (_local2 + (("Level: " + _arg1.Level) + "\n"));
        }
        if (_arg1.hasOwnProperty("Terrain")) {
            _local2 = (_local2 + (("Terrain: " + _arg1.Terrain) + "\n"));
        }
        for each (_local3 in _arg1.Projectile) {
            _local2 = (_local2 + (((((((((("Projectile " + _local3.@id) + ": ") + _local3.ObjectId) + "\n") + "\tDamage: ") + _local3.Damage) + "\n") + "\tSpeed: ") + _local3.Speed) + "\n"));
            if (_local3.hasOwnProperty("PassesCover")) {
                _local2 = (_local2 + "\tPassesCover\n");
            }
            if (_local3.hasOwnProperty("MultiHit")) {
                _local2 = (_local2 + "\tMultiHit\n");
            }
            if (_local3.hasOwnProperty("ConditionEffect")) {
                _local2 = (_local2 + (((("\t" + _local3.ConditionEffect) + " for ") + _local3.ConditionEffect.@duration) + " secs\n"));
            }
            if (_local3.hasOwnProperty("Parametric")) {
                _local2 = (_local2 + "\tParametric\n");
            }
        }
        this._C_G_ = new SimpleText(14, 0xB3B3B3, false, _be, 0, "Myriad Pro");
        this._C_G_.wordWrap = true;
        this._C_G_.text = String(_local2);
        this._C_G_._08S_();
        this._C_G_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._C_G_.x = 0;
        this._C_G_.y = (this._P_V_.height + 2);
        addChild(this._C_G_);
    }
    private var _P_V_:SimpleText;
    private var _C_G_:SimpleText;
}
}//package _D_d

