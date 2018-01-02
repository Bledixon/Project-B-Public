/**
 * Created by club5_000 on 9/21/2014.
 */
package _sP_ {
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.objects.ObjectLibrary;

    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class MarketplaceInventory extends Sprite {

        public function MarketplaceInventory(_arg1:Vector.<int>, _arg2:Vector.<Object>, _arg3:GameSprite, _arg4:int) {
            super();
            this.equipment_ = _arg1;
            this.equipData_ = _arg2;
            this.mode_ = _arg4;
            this.gs_ = _arg3;
            this.build();
        }

        public var gs_:GameSprite
        public var equipment_:Vector.<int>;
        public var equipData_:Vector.<Object>;
        public var mode_:int;
        public var slots_:Vector.<MarketplaceSlot>;

        public function build():void {
            slots_ = new Vector.<MarketplaceSlot>();
            for(var i:int = 0; i < this.equipment_.length; i++) {
                var _local1:MarketplaceSlot = new MarketplaceSlot(this.equipment_[i], this.equipData_[i], this.gs_, this.mode_ != 1);
                _local1.x = (i % 4) * (MarketplaceSlot.WIDTH + 4);
                _local1.y = (Math.floor(i / 4)) * (MarketplaceSlot.HEIGHT + 4);
                _local1.slot_ = i;
                this.slots_.push(_local1);
                addChild(_local1);
                _local1.addEventListener(MouseEvent.CLICK, this.onClickSlot);
            }
        }

        public function rebuild():void {
            for each (var i:MarketplaceSlot in this.slots_) {
                this.removeChild(i);
            }
            this.build();
            this.dispatchEvent(new Event(Event.CHANGE));
        }

        public function addItem(_arg1:int, _arg2:Object):void {
            this.equipment_.push(_arg1);
            this.equipData_.push(_arg2);
            this.rebuild();
        }

        private function onClickSlot(event:MouseEvent):void {
            var _local1:MarketplaceSlot = (event.currentTarget as MarketplaceSlot);
            if(_local1.item_ == -1) {
                return;
            }
            if(this.mode_ == 1) {
                var _local2:XML = ObjectLibrary._Q_F_[_local1.item_];
                if (_local2.hasOwnProperty("Soulbound") || (_local1.data_ != null && _local1.data_.Soulbound)) {
                    return;
                }
                _local1.enabled_ = !_local1.enabled_;
                _local1.redraw();
            } else if (this.mode_ == 2) {
                this.equipment_.splice(this.slots_.indexOf(_local1), 1);
                this.equipData_.splice(this.slots_.indexOf(_local1), 1);
                this.rebuild();
            }
        }

        public function getIncludedSlots():Vector.<int> {
            var ret:Vector.<int> = new Vector.<int>();
            for each(var i:MarketplaceSlot in this.slots_) {
                if(i.enabled_) {
                    ret.push(i.slot_);
                }
            }
            return ret;
        }
    }
}
