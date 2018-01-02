// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_O_6._zu

package _O_6 {
import _A_G_._07A_;
import _A_G_._0H_c;

import flash.utils.getDefinitionByName;
import flash.display.DisplayObject;
import flash.events.Event;

public class _zu {

    private static const _05u:Boolean = _0F_b();

    private static var _00v:Class;

    private static function _0F_b():Boolean {
        try {
            _00v = (getDefinitionByName("mx.core::UIComponent") as Class);
        } catch (error:Error) {
        }
        return (!((_00v == null)));
    }

    public function _zu(_arg1:_07A_) {
        this._factory = _arg1;
        this._factory.addEventListener(_0H_c._00Q_, this._kS_);
        this._factory.addEventListener(_0H_c._0J__, this._cf);
    }
    private var _factory:_07A_;

    private function _eE_(_arg1:Object, _arg2:Object):void {
        if (_arg2.hasOwnProperty("viewComponent")) {
            _arg2.viewComponent = _arg1;
        }
        if (_arg2.hasOwnProperty("initialize")) {
            _arg2.initialize();
        }
    }

    private function _xp(_arg1:Object):void {
        if (_arg1.hasOwnProperty("destroy")) {
            _arg1.destroy();
        }
    }

    private function _kS_(event:_0H_c):void {
        var mediator:Object;
        var displayObject:DisplayObject;
        mediator = event.mediator;
        displayObject = (event.view as DisplayObject);
        if (!displayObject) {
            this._eE_(event.view, mediator);
            return;
        }
        displayObject.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        if (((((_05u) && ((displayObject is _00v)))) && (!(displayObject["initialized"])))) {
            displayObject.addEventListener("creationComplete", function (_arg1:Event):void {
                displayObject.removeEventListener("creationComplete", arguments.callee);
                if (_factory._ug(displayObject, event.mapping)) {
                    _eE_(displayObject, mediator);
                }
            });
        } else {
            this._eE_(displayObject, mediator);
        }
    }

    private function _cf(_arg1:_0H_c):void {
        var _local2:DisplayObject = (_arg1.view as DisplayObject);
        if (_local2) {
            _local2.removeEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        if (_arg1.mediator) {
            this._xp(_arg1.mediator);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this._factory._0_Q_(_arg1.target);
    }

}
}//package _O_6

