package com.company.assembleegameclient.map {
import _015._0C_Q_;

import MapBackgrounds.Background;

import _fh._zh;

import _vf._gs;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.BasicObject;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.objects._ez;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.ConditionEffect;

import flash.display.Graphics;
import flash.display.IGraphicsData;
import flash.display.Sprite;
import flash.filters.BlurFilter;
import flash.filters.ColorMatrixFilter;
import flash.geom.ColorTransform;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.Dictionary;

public class MapHandler extends Sprite {

    public function MapHandler() {
        this.goDict_ = new Dictionary();
        this.map_ = new Sprite();
        this._0K_A_ = new Vector.<Square>;
        this.squares_ = new Vector.<Square>;
        this._cl = new Dictionary();
        this.merchLookup_ = {};
        //this.signalRenderSwitch = new (Boolean);
        super();
    }
    public var goDict_:Dictionary;
    public var gs_:GameSprite;
    public var name_:String;
    public var player_:Player = null;
    public var showDisplays_:Boolean;
    public var music_:String;
    public var width_:int;
    public var height_:int;
    public var _vv:int;
    public var allowPlayerTeleport_:Boolean;
    public var background_:Background = null;
    public var map_:Sprite;
    public var weatherBackground_:Background = null;
    public var _063:_M_9 = null;
    public var _C_K_:_3m = null;
    public var mapOverlay_:_0C_Q_ = null;
    public var partyOverlay_:_zh = null;
    public var _0K_A_:Vector.<Square>;
    public var squares_:Vector.<Square>;
    public var _cl:Dictionary;
    public var merchLookup_:Object;
    public var party_:_ez = null;
    // public var signalRenderSwitch:?;
    public var quest_:Quest = null;
    public var weather_:int;
    protected var _1fF_:Boolean = false;

    public function setProps(_arg1:int, _arg2:int, _arg3:String, _arg4:int, _arg5:Boolean, _arg6:Boolean, _arg7:String, _arg8:int):void {
    }

    public function addObj(_arg1:BasicObject, _arg2:Number, _arg3:Number):void {
    }

    public function setGroundTile(_arg1:int, _arg2:int, _arg3:uint):void {
    }

    public function initialize():void {
    }

    public function dispose():void {
    }

    public function update(_arg1:int, _arg2:int):void {
    }

    public function pSTopW(_arg1:Number, _arg2:Number):Point {
        return (null);
    }

    public function removeObj(_arg1:int):void {
    }

    public function draw(_arg1:_0D_v, _arg2:int):void {
    }
}
}