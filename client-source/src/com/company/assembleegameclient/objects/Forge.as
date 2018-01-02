package com.company.assembleegameclient.objects {
import _panels.Panel;

import com.company.assembleegameclient.game.GameSprite;

import _panels.Forge;

public class Forge extends GameObject implements _G_4 {

    public function Forge(param1:XML) {
        super(param1);
        _064 = true;
    }

    public function getPanel(param1:GameSprite):Panel {
        return new _panels.Forge(param1, this);
    }
}
}
