// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._0G_h

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._Z_B_;

public class _0G_h extends Sprite {

    public function _0G_h(_arg1:int, _arg2:Boolean, _arg3:Boolean) {
        this._0H_O_ = _arg2;
        if (_arg3) {
            this._A_2 = new SimpleText(((this._0H_O_) ? 18 : 16), 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._A_2.setBold(this._0H_O_);
            this._A_2.text = "Rank: ";
            this._A_2.updateMetrics();
            this._A_2.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this._A_2);
        }
        mouseEnabled = false;
        mouseChildren = false;
        this.draw(_arg1);
    }
    public var _Q_j:Sprite = null;
    public var _0H_O_:Boolean;
    private var numStars_:int = -1;
    private var _A_2:SimpleText = null;

    public function draw(_arg1:int):void {
        var _local3:Sprite;
        if (_arg1 == this.numStars_) {
            return;
        }
        this.numStars_ = _arg1;
        if (((!((this._Q_j == null))) && (contains(this._Q_j)))) {
            removeChild(this._Q_j);
        }
        if (this.numStars_ < 0) {
            return;
        }
        this._Q_j = new Sprite();
        var _local2:SimpleText = new SimpleText(((this._0H_O_) ? 18 : 16), 0xB3B3B3, false, 0, 0, "Myriad Pro");
        _local2.setBold(this._0H_O_);
        _local2.text = this.numStars_.toString();
        _local2.updateMetrics();
        _local2.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        this._Q_j.addChild(_local2);
        _local3 = ((this._0H_O_) ? _Z_B_._bl(this.numStars_) : _Z_B_._03A_(this.numStars_));
        _local3.x = (_local2.width + 2);
        this._Q_j.addChild(_local3);
        _local3.y = (int(((_local2.height / 2) - (_local3.height / 2))) + 1);
        var _local4:int = (_local3.x + _local3.width);
        this._Q_j.graphics.clear();
        this._Q_j.graphics.beginFill(0, 0.4);
        this._Q_j.graphics.drawRoundRect(-2, (_local3.y - 3), (_local4 + 6), (_local3.height + 8), 12, 12);
        this._Q_j.graphics.endFill();
        addChild(this._Q_j);
        if (this._A_2 != null) {
            addChild(this._A_2);
            this._Q_j.x = this._A_2.width;
        }
    }

}
}//package com.company.assembleegameclient.ui

