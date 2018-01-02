package _panels {
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.ui.ui_chat;

import flash.events.KeyboardEvent;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolderNoDim;

import _0D_d.Crafting;

import flash.events.MouseEvent;
import flash.events.Event;

import com.company.assembleegameclient.game.GameSprite;

public class Forge extends _X_i {

    public function Forge(param1:GameSprite, param2:GameObject) {
        super(param1, "Crafting Station", "Forge");
        this.obj_ = param2;
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemove);
    }

    public var obj_:GameObject;
    private var frame:FrameHolderNoDim;
    private var craftFrame:Crafting;

    override protected function onButtonClick(param1:MouseEvent):void {
        if (Crafting.isClosed) {
            this.open();
        }
    }

    protected function onKeyDown(param1:KeyboardEvent):void {
        if ((param1.keyCode == Parameters.data_.interact) && !(ui_chat._0G_B_) && (Crafting.isClosed)) {
            this.open();
        }
    }

    private function open():void{
        this.craftFrame = new Crafting(gs_, this.obj_);
        this.frame = new FrameHolderNoDim(this.craftFrame);
        stage.addChild(this.frame);
    }

    protected function onAdded(param1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
    }

    protected function onRemove(param1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        if ((!(parent == null) && !(this.frame == null)) && this.craftFrame.open) {
            stage.removeChild(this.frame);
        }
    }
}
}
