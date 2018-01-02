// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._0M_k

package _E_7 {
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui.ui_playerslist;
import com.company.assembleegameclient.ui._0M_Y_;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui._return;
import com.company.ui.SimpleText;
import com.company.assembleegameclient.objects.ObjectLibrary;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._Z_B_;
import com.company.assembleegameclient.appengine._0A_H_;

public class _0M_k extends _for_ {

    public function _0M_k(_arg1:String, _arg2:XML, _arg3:_0A_H_) {
        super(0x2A2A2A, 1, 0xFFFFFF, 1);
        var _local4:int = int(_arg2.ObjectType);
        var _local5:XML = ObjectLibrary._Q_F_[_local4];
        this.player_ = Player._D_U_(_arg1, _arg2);
        this._02y = new ui_playerslist(0xB3B3B3, true, this.player_);
        addChild(this._02y);
        this._023 = new _0M_Y_(176, 16, 14693428, 0x2D2D2D, "HP");
        this._023.x = 6;
        this._023.y = 40;
        addChild(this._023);
        this._F_C_ = new _0M_Y_(176, 16, 6325472, 0x2D2D2D, "MP");
        this._F_C_.x = 6;
        this._F_C_.y = 64;
        addChild(this._F_C_);
        this._e9 = new Inventory(null, this.player_, "Player Inventory", this.player_._9A_, 12, false);
        this._e9.x = 8;
        this._e9.y = 88;
        addChild(this._e9);
        this._qc = new _return(90, 0x2D2D2D);
        this._qc.x = 6;
        this._qc.y = 228;
        addChild(this._qc);
        var _local6:int = (((_arg3 == null)) ? 0 : _arg3._lr());
        this._05h = new SimpleText(12, 6206769, false, 0, 0, "CHIP SB");
        this._05h.text = ((((((_local6 + " of " + _Z_B_._yJ_.length + " C-Quests Completed\n") + "Best Level Achieved: ") + (((_arg3) != null) ? _arg3.bestLevel() : 0)) + "\n") + "Best Fame Achieved: ") + (((_arg3) != null) ? _arg3._0D_E_() : 0));
        this._05h.updateMetrics();
        this._05h.filters = [new DropShadowFilter(0, 0, 0)];
        this._05h.x = 8;
        this._05h.y = (height - 2);
        addChild(this._05h);
        var _local7:int = _Z_B_._F_U_((((_arg3 == null)) ? 0 : _arg3._0D_E_()), 0);
        if (_local7 > 0) {
            this._U_n = new SimpleText(10, 16549442, false, 174, 0, "CHIP SB");
            this._U_n.text = (((("Next Goal: Earn " + _local7) + " Fame\n") + "  with a ") + _local5.@id);
            this._U_n.updateMetrics();
            this._U_n.filters = [new DropShadowFilter(0, 0, 0)];
            this._U_n.x = 8;
            this._U_n.y = (height - 2);
            addChild(this._U_n);
        }
    }
    public var player_:Player;
    private var _02y:ui_playerslist;
    private var _023:_0M_Y_;
    private var _F_C_:_0M_Y_;
    private var _e9:Inventory;
    private var _qc:_return;
    private var _05h:SimpleText;
    private var _U_n:SimpleText;

    override public function draw():void {
        this._023.draw(this.player_.HP_, this.player_.maxHP_, this.player_._P_7, this.player_._uR_);
        this._F_C_.draw(this.player_.MP_, this.player_.maxMP_, this.player_._0D_G_, this.player_._dt);
        this._e9.draw(this.player_.equipment_);
        this._qc._rs((width - 10), 0x2D2D2D);
        super.draw();
    }

}
}//package _E_7

