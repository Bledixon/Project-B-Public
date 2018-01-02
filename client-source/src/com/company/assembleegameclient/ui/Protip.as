// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui.Protip

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.utils.Timer;
import flash.filters.GlowFilter;

import com.company.assembleegameclient.parameters.Parameters;

import flash.filters.DropShadowFilter;
import flash.events.TimerEvent;

import _05R_.GTween;

public class Protip extends Sprite {

    public function Protip() {
        this.timer1_ = new Timer(5000);
        this.timer2_ = new Timer(10000);
        super();
        filters = [new GlowFilter(0, 1, 3, 3, 2, 1)];
        var _local1:int = int(Parameters.data_.protipIndex);
        var protipsXML:XML = <Protips>
            <Protip>Stay near the beach at first.  Harder monsters live inland.</Protip>
            <Protip>Other players can not hurt you</Protip>
            <Protip>Hit [O] to see all the keys and options</Protip>
            <Protip>Escape to the Nexus by clicking the temple button</Protip>
            <Protip>You earn fame when you die.  Spend it in the Nexus!</Protip>
            <Protip>Activate your special ability with either shift-click or a hotkey</Protip>
            <Protip>Shift-Click a potion to drink it</Protip>
            <Protip>Use the /tell command to talk to other players anywhere in the game.</Protip>
            <Protip>Drag an item onto the world to drop it</Protip>
            <Protip>Zoom the minimap with the mouse wheel</Protip>
            <Protip>Click a yellow or green minimap dot to teleport to another player</Protip>
            <Protip>Each inventory slot has a hotkey -- mouseover to see it</Protip>
            <Protip>You can drink potions even if they are still on the ground</Protip>
            <Protip>Rerun the tutorial by typing "/tutorial" in chat</Protip>
        </Protips>;
        if (_local1 >= protipsXML.Protip.length()) {
            _local1 = 0;
        }
        var _local2:String = protipsXML.Protip[_local1];
        Parameters.data_.protipIndex = (_local1 + 1);
        Parameters.save();
        this.text_ = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        this.text_.text = ("Tip: " + _local2);
        addChild(this.text_);
        mouseEnabled = false;
        mouseChildren = false;
        this.text_.updateMetrics();
        this.text_.x = (300 - (this.text_._c9 / 2));
        this.text_.y = 125;
        this.timer1_.addEventListener(TimerEvent.TIMER, this.onTimer1);
        this.timer1_.start();
        this.timer2_.addEventListener(TimerEvent.TIMER, this.onTimer2);
        this.timer2_.start();
    }
    private var text_:SimpleText;
    private var timer1_:Timer;
    private var timer2_:Timer;

    private function onTimer1(_arg1:TimerEvent):void {
        var _local2:GTween = new GTween(this, 5, {"alpha": 0});
    }

    private function onTimer2(_arg1:TimerEvent):void {
        if (parent != null) {
            parent.removeChild(this);
        }
    }

}
}//package com.company.assembleegameclient.ui

