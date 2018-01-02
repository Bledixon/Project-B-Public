package _0D_d {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.ui.Inventory;

import flash.events.Event;
import flash.events.MouseEvent;

public class Crafting extends Frame {

    public static var isClosed:Boolean = true;
    public var open:Boolean;

    public function Crafting(param1:GameSprite, param2:GameObject) {
        Crafting.isClosed = false;
        super("Craft items", "Craft", "Close", "/craft", 250);
        this.inventory_ = new Inventory(param1, param2, "Crafting Inventory", param2._9A_, 8, false);
        var _loc3_:* = 250 / 2 - this.inventory_.width / 2 - 5;
        this.gs_ = param1;
        this.obj_ = param2;
        this._W_z(this.inventory_, _loc3_);
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemoved);
        Button1.addEventListener(MouseEvent.CLICK, this.onCraft);
        Button2.addEventListener(MouseEvent.CLICK, this.onClose);

        this.open = true;
    }
    public var inventory_:Inventory;
    private var gs_:GameSprite;
    private var obj_:GameObject;

    private function onEnterFrame(param1:Event):void {
        this.inventory_.draw(this.inventory_._iA_.equipment_);
    }

    private function onAdded(param1:Event):void {
        this.x = this.x - 97;
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemoved(param1:Event):void {
        this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        Crafting.isClosed = true;
        this.open = false;
    }

    private function onClose(param1:MouseEvent):void {
        Crafting.isClosed = true;
        this.open = false;
        stage.focus = null;
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onCraft(param1:MouseEvent):void {
        this.gs_.gsc_.craftItems(this.obj_.objectId_);
    }
}
}
