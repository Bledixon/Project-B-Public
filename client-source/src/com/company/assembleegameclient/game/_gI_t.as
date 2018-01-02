package com.company.assembleegameclient.game {
import _011.MapInfo;

import com.company.assembleegameclient.map.MapHandler;
import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.map._X_l;
import com.company.assembleegameclient.net.PacketManager;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.tutorial.Tutorial;

import flash.display.Sprite;

public class _gI_t extends Sprite {

    public var isEditor:Boolean;
    public var tutorial_:Tutorial;
    public var mui_:_07a;
    public var lastUpdate_:int = 0;
    public var moveRecords_:_uw;
    //public var map:MapHandler;
    public var camera_:_0D_v;
    public var gsc_:PacketManager;

    public function _gI_t() {
        this.moveRecords_ = new _uw();
        this.camera_ = new _0D_v();
        super();
    }
    public function initialize():void{
    }
    public function setFocus(_arg1:GameObject):void{
    }
    public function applyMapInfo(_arg1:MapInfo):void{
    }
    public function evalIsNotInCombatMapArea():Boolean{
        return (false);
    }
}
}
