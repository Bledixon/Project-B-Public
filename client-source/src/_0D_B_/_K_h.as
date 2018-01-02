// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_B_._K_h

package _0D_B_ {
import flash.geom.ColorTransform;

import com.company.assembleegameclient.objects.Player;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;

import flash.events.Event;
import flash.events.MouseEvent;

public class _K_h extends _0K_G_ {

    private static const _07W_:ColorTransform = new ColorTransform((84 / 0xFF), (84 / 0xFF), (84 / 0xFF));

    public function _K_h(_arg1:Player) {
        super(AssetLibrary._xK_("lofiInterfaceBig", 11), 0xFFFFFF, "Teleport");
        this.player_ = _arg1;
        this._N_8 = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._N_8.setBold(true);
        this._N_8.text = "Teleport";
        this._N_8.updateMetrics();
        this._N_8.x = text_.x;
        this._N_8.y = text_.y;
        this._N__ = this._N_8.width;
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var player_:Player;
    private var _68:Boolean = false;
    private var _N_8:SimpleText;
    private var _N__:int;

    override protected function onMouseOver(_arg1:MouseEvent):void {
        this._68 = true;
    }

    override protected function onMouseOut(_arg1:MouseEvent):void {
        this._68 = false;
    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(_arg1:Event):void {
        var _local2:int = this.player_._Z_C_();
        if (_local2 > 0) {
            if (!contains(this._N_8)) {
                addChild(this._N_8);
            }
            this._N_8.width = (this._N__ * (1 - (_local2 / Player._0G_S_)));
            _037(_07W_);
        } else {
            if (contains(this._N_8)) {
                removeChild(this._N_8);
            }
            if (this._68) {
                _037(_0A_8);
            } else {
                _037(null);
            }
        }
    }

}
}//package _0D_B_

