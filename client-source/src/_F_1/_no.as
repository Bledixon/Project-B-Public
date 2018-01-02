// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._no

package _F_1 {
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.display.Shape;

import com.company.assembleegameclient.ui._0K_B_;

import flash.events.Event;

import com.company.assembleegameclient.util._Z_B_;

import flash.display.BitmapData;

import com.company.util.BitmapUtil;

import flash.display.Bitmap;
import flash.utils.getTimer;
import flash.display.DisplayObject;


public class _no extends Sprite {

    public function _no(_arg1:Rectangle, _arg2:XML) {
        var _local4:XML;
        this.mask_ = new Shape();
        this._8g = new Sprite();
        this._Q_k = new Vector.<_2Z_>();
        super();
        this.rect_ = _arg1;
        graphics.lineStyle(1, 0x494949, 2);
        graphics.drawRect((this.rect_.x + 1), (this.rect_.y + 1), (this.rect_.width - 2), (this.rect_.height - 2));
        graphics.lineStyle();
        this._V__ = new _0K_B_(16, this.rect_.height);
        this._V__.addEventListener(Event.CHANGE, this._I_v);
        this.mask_.graphics.beginFill(0xFFFFFF, 1);
        this.mask_.graphics.drawRect(this.rect_.x, this.rect_.y, this.rect_.width, this.rect_.height);
        this.mask_.graphics.endFill();
        addChild(this.mask_);
        mask = this.mask_;
        addChild(this._8g);
        this._yQ_("Shots", null, _arg2.Shots, false, 5746018);
        if (int(_arg2.Shots) != 0) {
            this._yQ_("Accuracy", null, ((100 * Number(_arg2.ShotsThatDamage)) / Number(_arg2.Shots)), true, 5746018, "", "%");
        }
        this._yQ_("Tiles Seen", null, _arg2.TilesUncovered, false, 5746018);
        this._yQ_("Monster Kills", null, _arg2.MonsterKills, false, 5746018);
        this._yQ_("God Kills", null, _arg2.GodKills, false, 5746018);
        this._yQ_("Oryx Kills", null, _arg2.OryxKills, false, 5746018);
        this._yQ_("Quests Completed", null, _arg2.QuestsCompleted, false, 5746018);
        this._yQ_("Dungeons Completed", null, ((((((int(_arg2.PirateCavesCompleted) + int(_arg2.UndeadLairsCompleted)) + int(_arg2.AbyssOfDemonsCompleted)) + int(_arg2.SnakePitsCompleted)) + int(_arg2.SpiderDensCompleted)) + int(_arg2.SpriteWorldsCompleted)) + int(_arg2.TombsCompleted)), false, 5746018);
        this._yQ_("Party Member Level Ups", null, _arg2.LevelUpAssists, false, 5746018);
        var _local3:BitmapData = _Z_B_._qf();
        _local3 = BitmapUtil._Y_d(_local3, 6, 6, (_local3.width - 12), (_local3.height - 12));
        this._yQ_("Base Fame Earned", null, _arg2.BaseFame, true, 0xFFC800, "", "", new Bitmap(_local3));
        for each (_local4 in _arg2.Bonus) {
            this._yQ_(("Bonus: " + _local4.@id), _local4.@desc, int(_local4), true, 0xFFC800, "+", "", new Bitmap(_local3));
        }
    }
    private var rect_:Rectangle;
    private var mask_:Shape;
    private var _8g:Sprite;
    private var _Q_k:Vector.<_2Z_>;
    private var _V__:_0K_B_;
    private var startTime_:int;

    public function _3s():void {
        var _local1:_2Z_;
        this._D_G_();
        this.startTime_ = -(int.MAX_VALUE);
        for each (_local1 in this._Q_k) {
            _local1._0_v();
        }
    }

    public function _D_G_():void {
        this.startTime_ = getTimer();
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function _yQ_(_arg1:String, _arg2:String, _arg3:int, _arg4:Boolean, _arg5:uint, _arg6:String = "", _arg7:String = "", _arg8:DisplayObject = null):void {
        if ((((_arg3 == 0)) && (!(_arg4)))) {
            return;
        }
        this._Q_k.push(new _2Z_(20, 0xB3B3B3, _arg5, _arg1, _arg2, _arg3, _arg6, _arg7, _arg8));
    }

    private function _z4():void {
        graphics.clear();
        graphics.lineStyle(1, 0x494949, 2);
        graphics.drawRect((this.rect_.x + 1), (this.rect_.y + 1), (this.rect_.width - 26), (this.rect_.height - 2));
        graphics.lineStyle();
        this._V__.x = (this.rect_.width - 16);
        this._V__._fA_(this.mask_.height, this._8g.height);
        this._V__._0D__(1);
        addChild(this._V__);
    }

    private function _I_v(_arg1:Event):void {
        var _local2:Number = this._V__._Q_D_();
        this._8g.y = ((_local2 * ((this.rect_.height - this._8g.height) - 15)) + 5);
    }

    private function onEnterFrame(_arg1:Event):void {
        var _local6:_2Z_;
        var _local2:Number = (this.startTime_ + ((2000 * (this._Q_k.length - 1)) / 2));
        var _local3:Number = getTimer();
        var _local4:int = Math.min(this._Q_k.length, (((2 * (getTimer() - this.startTime_)) / 2000) + 1));
        var _local5:int;
        while (_local5 < _local4) {
            _local6 = this._Q_k[_local5];
            _local6.y = (28 * _local5);
            this._8g.addChild(_local6);
            _local5++;
        }
        this._8g.y = ((this.rect_.height - this._8g.height) - 10);
        if (_local3 > (_local2 + 1000)) {
            this._z4();
            dispatchEvent(new Event(Event.COMPLETE));
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

}
}//package _F_1

