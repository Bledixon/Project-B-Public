// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_d._lx

package _0D_d {
import com.company.assembleegameclient.game.GameSprite;

import flash.events.MouseEvent;
import flash.events.Event;

import _9R_._J_F_;

public class _lx extends Frame {

    public function _lx(_arg1:GameSprite) {
        super("Create a new Guild", "Cancel", "Create", "/createGuild");
        this.gs_ = _arg1;
        this.name_ = new TextInput("Guild Name", false, "");
        this.name_.inputText_.restrict = "A-Za-z ";
        this.name_.inputText_.maxChars = 20;
        _vO_(this.name_);
        _0D_I_("Maximum 20 characters");
        _0D_I_("No numbers or punctuation");
        _0D_I_("Racism or profanity gets your guild banned");
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this._U_p);
    }
    private var name_:TextInput;
    private var gs_:GameSprite;

    private function onCancel(_arg1:MouseEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _U_p(_arg1:MouseEvent):void {
        this.gs_.addEventListener(_J_F_._hx, this._0J_I_);
        this.gs_.gsc_._S_W_(this.name_.text());
        _pW_();
    }

    private function _0J_I_(_arg1:_J_F_):void {
        this.gs_.removeEventListener(_J_F_._hx, this._0J_I_);
        if (_arg1.success_) {
            stage.focus = null;
            dispatchEvent(new Event(Event.COMPLETE));
        } else {
            this.name_._0B_T_(_arg1.errorText_);
            _for();
        }
    }

}
}//package _0D_d

