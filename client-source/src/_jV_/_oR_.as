// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_jV_._oR_

package _jV_ {
import _0H_p._0F_H_;

import flash.events.IEventDispatcher;
import flash.events.Event;


public class _oR_ implements _0F_H_ {

    private const _N_O_:Vector.<_07L_> = new Vector.<_07L_>();
    private const _jG_:Vector.<_07L_> = new Vector.<_07L_>();

    public function _oR_(_arg1:IEventDispatcher) {
        this._eventDispatcher = _arg1;
    }
    private var _eventDispatcher:IEventDispatcher;
    private var _0G_u:Boolean = false;

    public function _08r(dispatcher:IEventDispatcher, eventString:String, listener:Function, eventClass:Class = null, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void {
        var eventConfig:_07L_;
        var callback:Function;
        eventClass = ((eventClass) || (Event));
        var currentListeners:Vector.<_07L_> = ((this._0G_u) ? this._jG_ : this._N_O_);
        var i:int = currentListeners.length - 1;
        while (i >= 0) {
            eventConfig = currentListeners[i];
            if ((((((((((eventConfig.dispatcher == dispatcher)) && ((eventConfig.eventString == eventString)))) && ((eventConfig.listener == listener)))) && ((eventConfig.useCapture == useCapture)))) && ((eventConfig.eventClass == eventClass)))) {
                return;
            }
            i--;
        }
        if (eventClass != Event) {
            callback = function (_arg1:Event):void {
                routeEventToListener(_arg1, listener, eventClass);
            };
        } else {
            callback = listener;
        }
        eventConfig = new _07L_(dispatcher, eventString, listener, eventClass, callback, useCapture);
        currentListeners.push(eventConfig);
        if (!this._0G_u) {
            dispatcher.addEventListener(eventString, callback, useCapture, priority, useWeakReference);
        }
    }

    public function _0M_v(_arg1:IEventDispatcher, _arg2:String, _arg3:Function, _arg4:Class = null, _arg5:Boolean = false):void {
        var _local6:_07L_;
        _arg4 = ((_arg4) || (Event));
        var _local7:Vector.<_07L_> = ((this._0G_u) ? this._jG_ : this._N_O_);
        var _local8:int = _local7.length;
        while (_local8--) {
            _local6 = _local7[_local8];
            if ((((((((((_local6.dispatcher == _arg1)) && ((_local6.eventString == _arg2)))) && ((_local6.listener == _arg3)))) && ((_local6.useCapture == _arg5)))) && ((_local6.eventClass == _arg4)))) {
                if (!this._0G_u) {
                    _arg1.removeEventListener(_arg2, _local6.callback, _arg5);
                }
                _local7.splice(_local8, 1);
                return;
            }
        }
    }

    public function _0I_p():void {
        var _local2:_07L_;
        var _local3:IEventDispatcher;
        var _local1:Vector.<_07L_> = ((this._0G_u) ? this._jG_ : this._N_O_);
        while ((_local2 = _local1.pop())) {
            if (!this._0G_u) {
                _local3 = _local2.dispatcher;
                _local3.removeEventListener(_local2.eventString, _local2.callback, _local2.useCapture);
            }
        }
    }

    public function suspend():void {
        var _local1:_07L_;
        var _local2:IEventDispatcher;
        if (this._0G_u) {
            return;
        }
        this._0G_u = true;
        while ((_local1 = this._N_O_.pop())) {
            _local2 = _local1.dispatcher;
            _local2.removeEventListener(_local1.eventString, _local1.callback, _local1.useCapture);
            this._jG_.push(_local1);
        }
    }

    public function resume():void {
        var _local1:_07L_;
        var _local2:IEventDispatcher;
        if (!this._0G_u) {
            return;
        }
        this._0G_u = false;
        while ((_local1 = this._jG_.pop())) {
            _local2 = _local1.dispatcher;
            _local2.addEventListener(_local1.eventString, _local1.callback, _local1.useCapture);
            this._N_O_.push(_local1);
        }
    }

    private function routeEventToListener(_arg1:Event, _arg2:Function, _arg3:Class):void {
        if ((_arg1 is _arg3)) {
            (_arg2(_arg1));
        }
    }

}
}//package _jV_

