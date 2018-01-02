// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_d._8x

package _0D_d {
import com.company.assembleegameclient.game.GameSprite;
import com.company.util._H_V_;

import flash.events.KeyboardEvent;

import flash.events.MouseEvent;
import flash.events.Event;

import _9R_._3E_;

import com.company.googleanalytics.GA;
import com.company.assembleegameclient.parameters.Parameters;

public class _8x extends Frame {

    public function _8x(_arg1:GameSprite, _arg2:Boolean) {
        super("Choose a unique account name", "Cancel", "Choose", "/chooseName");
        this.gs_ = _arg1;
        this._B_E_ = _arg2;
        this.name_ = new TextInput("Name", false, "");
        this.name_.inputText_.restrict = "A-Za-z";
        this.name_.inputText_.maxChars = 10;
        _vO_(this.name_);
        _0D_I_("Maximum 10 characters");
        _0D_I_("No numbers, spaces or punctuation");
        _0D_I_("Racism or profanity gets you banned");
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this._J_p);
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemoved);
    }
    private var name_:TextInput;
    private var gs_:GameSprite;
    private var _B_E_:Boolean;

    public function _0D_s(_arg1:_3E_):void {
        this.gs_.removeEventListener(_3E_.NAMERESULTEVENT, this._0D_s);
        if (_arg1._yS_.success_) {
            /*if (this._B_E_) {
                GA.global().trackEvent("credits", ((this.gs_.charList_.converted_) ? "buyConverted" : "buy"), "Name Change", Parameters._0u);
            }*/
            this.gs_.charList_.name_ = this.name_.text();
            this.gs_._V_1._02y.setName(this.name_.text());
            stage.focus = null;
            dispatchEvent(new Event(Event.COMPLETE));
        } else {
            this.name_._0B_T_(_arg1._yS_.errorText_);
            _for();
        }
    }

    private function onCancel(_arg1:MouseEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _J_p(_arg1:MouseEvent):void {
        this.gs_.addEventListener(_3E_.NAMERESULTEVENT, this._0D_s);
        this.gs_.gsc_._K_Q_(this.name_.text());
        _pW_();
    }

    private function onAdded(e:Event):void {
        this.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
    }

    private function onRemoved(e:Event):void {
        this.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
    }

    private function onKeyPressed(e:KeyboardEvent):void {

        if (e.keyCode == _H_V_.ENTER) {
            this._J_p(null);
        }
    }

}
}//package _0D_d

