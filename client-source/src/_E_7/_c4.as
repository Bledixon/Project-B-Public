// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._c4

package _E_7 {
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui.ui_playerslist;
import com.company.assembleegameclient.ui._0G_h;
import com.company.assembleegameclient.ui._L_N_;
import com.company.assembleegameclient.ui._0M_Y_;
import com.company.assembleegameclient.ui.Inventory;
import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

public class _c4 extends _for_ {

    public function _c4(_arg1:Player) {
        var _local2:int;
        super(0x2A2A2A, 0.5, 0xFFFFFF, 1);
        this.player_ = _arg1;
        this._02y = new ui_playerslist(0xB3B3B3, true, this.player_);
        addChild(this._02y);
        _local2 = 34;
        this._pg = new _0G_h(this.player_.numStars_, false, true);
        this._pg.x = 6;
        this._pg.y = _local2;
        addChild(this._pg);
        _local2 = (_local2 + 30);
        if (((!((_arg1.guildName_ == null))) && (!((_arg1.guildName_ == ""))))) {
            this._4v = new _L_N_(this.player_.guildName_, this.player_.guildRank_, 136);
            this._4v.x = 6;
            this._4v.y = (_local2 - 2);
            addChild(this._4v);
            _local2 = (_local2 + 30);
        }
        this._023 = new _0M_Y_(176, 16, 14693428, 0x2D2D2D, "HP");
        this._023.x = 6;
        this._023.y = _local2;
        addChild(this._023);
        _local2 = (_local2 + 24);
        this._F_C_ = new _0M_Y_(176, 16, 6325472, 0x2D2D2D, "MP");
        this._F_C_.x = 6;
        this._F_C_.y = _local2;
        addChild(this._F_C_);
        _local2 = (_local2 + 24);
        this._e9 = new Inventory(null, this.player_, "Other Player Inventory", this.player_._9A_, 4, false);
        this._e9.x = 8;
        this._e9.y = _local2;
        addChild(this._e9);
        _local2 = (_local2 + 52);
        this._xi = new SimpleText(12, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._xi.text = "(Click to open menu)";
        this._xi.updateMetrics();
        this._xi.filters = [new DropShadowFilter(0, 0, 0)];
        this._xi.x = ((width / 2) - (this._xi.width / 2));
        this._xi.y = _local2;
        addChild(this._xi);
    }
    public var player_:Player;
    private var _02y:ui_playerslist;
    private var _pg:_0G_h;
    private var _4v:_L_N_;
    private var _023:_0M_Y_;
    private var _F_C_:_0M_Y_;
    private var _e9:Inventory;
    private var _xi:SimpleText;

    override public function draw():void {
        this._023.draw(this.player_.HP_, this.player_.maxHP_, this.player_._P_7, this.player_._uR_);
        this._F_C_.draw(this.player_.MP_, this.player_.maxMP_, this.player_._0D_G_, this.player_._dt);
        this._e9.draw(this.player_.equipment_);
        this._pg.draw(this.player_.numStars_);
        super.draw();
    }

}
}//package _E_7

