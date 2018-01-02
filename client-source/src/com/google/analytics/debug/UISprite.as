// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.debug.UISprite

package com.google.analytics.debug {
import flash.display.Sprite;
import flash.display.DisplayObject;
import flash.events.Event;
import flash.display.Stage;

public class UISprite extends Sprite {

    public function UISprite(_arg1:DisplayObject = null) {
        listenResize = false;
        alignement = Align.none;
        this.alignTarget = _arg1;
        margin = new Margin();
        addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
    }
    public var margin:Margin;
    public var alignement:Align;
    protected var alignTarget:DisplayObject;
    protected var listenResize:Boolean;

    private var _forcedWidth:uint;

    public function get forcedWidth():uint {
        if (_forcedWidth) {
            return (_forcedWidth);
        }
        return (width);
    }

    public function set forcedWidth(_arg1:uint):void {
        _forcedWidth = _arg1;
    }

    private var _forcedHeight:uint;

    public function get forcedHeight():uint {
        if (_forcedHeight) {
            return (_forcedHeight);
        }
        return (height);
    }

    public function set forcedHeight(_arg1:uint):void {
        _forcedHeight = _arg1;
    }

    public function alignTo(_arg1:Align, _arg2:DisplayObject = null):void {
        var _local3:uint;
        var _local4:uint;
        var _local5:uint;
        var _local6:uint;
        var _local7:UISprite;
        if (_arg2 == null) {
            if ((parent is Stage)) {
                _arg2 = this.stage;
            } else {
                _arg2 = parent;
            }
        }
        if (_arg2 == this.stage) {
            if (this.stage == null) {
                return;
            }
            this.stage;
            _local3 = 600;
            this.stage;
            _local4 = 800;
            _local5 = 0;
            _local6 = 0;
        } else {
            _local7 = (_arg2 as UISprite);
            if (_local7.forcedHeight) {
                _local3 = _local7.forcedHeight;
            } else {
                _local3 = _local7.height;
            }
            if (_local7.forcedWidth) {
                _local4 = _local7.forcedWidth;
            } else {
                _local4 = _local7.width;
            }
            _local5 = 0;
            _local6 = 0;
        }
        switch (_arg1) {
            case Align.top:
                x = ((_local4 / 2) - (forcedWidth / 2));
                y = (_local6 + margin.top);
                break;
            case Align.bottom:
                x = ((_local4 / 2) - (forcedWidth / 2));
                y = (((_local6 + _local3) - forcedHeight) - margin.bottom);
                break;
            case Align.left:
                x = (_local5 + margin.left);
                y = ((_local3 / 2) - (forcedHeight / 2));
                break;
            case Align.right:
                x = (((_local5 + _local4) - forcedWidth) - margin.right);
                y = ((_local3 / 2) - (forcedHeight / 2));
                break;
            case Align.center:
                x = ((_local4 / 2) - (forcedWidth / 2));
                y = ((_local3 / 2) - (forcedHeight / 2));
                break;
            case Align.topLeft:
                x = (_local5 + margin.left);
                y = (_local6 + margin.top);
                break;
            case Align.topRight:
                x = (((_local5 + _local4) - forcedWidth) - margin.right);
                y = (_local6 + margin.top);
                break;
            case Align.bottomLeft:
                x = (_local5 + margin.left);
                y = (((_local6 + _local3) - forcedHeight) - margin.bottom);
                break;
            case Align.bottomRight:
                x = (((_local5 + _local4) - forcedWidth) - margin.right);
                y = (((_local6 + _local3) - forcedHeight) - margin.bottom);
                break;
        }
        if (((!(listenResize)) && (!((_arg1 == Align.none))))) {
            _arg2.addEventListener(Event.RESIZE, onResize, false, 0, true);
            listenResize = true;
        }
        this.alignement = _arg1;
        this.alignTarget = _arg2;
    }

    public function resize():void {
        if (alignement != Align.none) {
            alignTo(alignement, alignTarget);
        }
    }

    protected function dispose():void {
        var _local1:DisplayObject;
        var _local2:int;
        while (_local2 < numChildren) {
            _local1 = getChildAt(_local2);
            if (_local1) {
                removeChild(_local1);
            }
            _local2++;
        }
    }

    protected function layout():void {
    }

    protected function onResize(_arg1:Event):void {
        resize();
    }

    private function _onAddedToStage(_arg1:Event):void {
        layout();
        resize();
    }

    private function _onRemovedFromStage(_arg1:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
        removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
        dispose();
    }

}
}//package com.google.analytics.debug

