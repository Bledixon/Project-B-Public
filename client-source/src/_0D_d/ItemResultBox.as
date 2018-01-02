/**
 * Created by club5_000 on 9/13/2014.
 */
package _0D_d {
    import _E_7.EquipmentToolTip;

    import _ke._U_c;

    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.objects.ObjectLibrary;
    import com.company.ui.SimpleText;
    import com.company.util.BitmapUtil;

    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextFormatAlign;

    public class ItemResultBox extends Frame {

        public function ItemResultBox(_gs:GameSprite, _item:int, _type:String="acquired", _itemData:Object=null) {
            super("You " + _type, "Close", "", "/itemResult");
            this.gs_ = _gs;
            this.itemType_ = _item;
            this.itemData_ = _itemData;
            this.addIcon();
        }

        private var gs_:GameSprite;
        private var itemType_:int;
        private var itemData_:Object;
        private var itemBitmap_:Bitmap;
        private var toolTip_:EquipmentToolTip;

        private function addIcon() {
            var _local1:XML = ObjectLibrary._Q_F_[this.itemType_];
            var _local2:Number = 5;
            if (_local1.hasOwnProperty("ScaleValue")) {
                _local2 = _local1.ScaleValue;
            }
            var _local3:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this.itemType_, 60, true, true, _local2);
            if(this.itemData_ != null && this.itemData_.hasOwnProperty("TextureFile") && this.itemData_.TextureFile != "") {
                _local3 = ObjectLibrary.getRedrawnTextureFromTypeCustom(this.itemType_, 60, true, this.itemData_, true, _local2);
            }
            _local3 = BitmapUtil._Y_d(_local3, 4, 4, (_local3.width - 8), (_local3.height - 8));
            this.itemBitmap_ = new Bitmap(_local3);
            this.itemBitmap_.scaleX = this.itemBitmap_.scaleY = 3;
            //this.itemBitmap_.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            //this.itemBitmap_.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            //this.itemBitmap_.addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStage);
            this._W_z(this.itemBitmap_, this.w_ / 2 - this.itemBitmap_.width / 2 - 10);
            var _local4:SimpleText = new SimpleText(30, (this.itemData_ != null && this.itemData_.hasOwnProperty("NameColor")) ? this.itemData_.NameColor : 0xFFFFFF, false, 0, 0, "CHIP SB");
            _local4.setBold(true);
            _local4.setAlign(TextFormatAlign.CENTER);
            _local4.width = this.width - 10;
            _local4.text = ObjectLibrary._0D_N_[this.itemType_];
            _local4.wordWrap = true;
            if (this.itemData_ != null && this.itemData_.hasOwnProperty("Name") && this.itemData_.Name != "") {
                _local4.text = this.itemData_.Name;
            }
            if (this.itemData_ != null && this.itemData_.hasOwnProperty("NamePrefix") && this.itemData_.NamePrefix != "") {
                _local4.text = this.itemData_.NamePrefix + " " + _local4.text;
            }
            this.addChild(_local4);
            _local4.y = this.h_ - 66;
            _local4.x = 8;
            this.h_ += _local4.textHeight;

            Button1.addEventListener(MouseEvent.CLICK, this.onClose);
        }

        private function removeTooltip() {
            if (toolTip_ != null) {
                if (toolTip_.parent != null) {
                    toolTip_.parent.removeChild(toolTip_);
                }
                toolTip_ = null;
            }
        }

        private function onMouseOver(e:MouseEvent) {
            if(this.toolTip_ == null) {
                this.toolTip_ = new EquipmentToolTip(this.itemType_, this.gs_.map_.player_, -1, _U_c.NPC, 1, false, this.itemData_);
                stage.addChild(this.toolTip_);
            }
        }

        private function onMouseOut(e:MouseEvent) {
            this.removeTooltip();
        }

        private function onRemovedFromStage(e:Event) {
            this.removeTooltip();
        }

        private function onClose(e:Event) {
            stage.focus = null;
            dispatchEvent(new Event(Event.COMPLETE));
        }

    }
}
