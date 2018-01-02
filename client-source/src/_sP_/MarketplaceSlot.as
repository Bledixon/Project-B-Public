/**
 * Created by club5_000 on 9/20/2014.
 */
package _sP_ {
    import _E_7.EquipmentToolTip;

    import _ke._U_c;

    import com.company.assembleegameclient.game.GameSprite;

    import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.util.GraphicHelper;

import flash.display.Bitmap;

    import flash.display.BitmapData;
import flash.display.GraphicsPath;
import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;

import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class MarketplaceSlot extends Sprite {
        public static const WIDTH:int = 48;
        public static const HEIGHT:int = 48;

        public var gs_:GameSprite;
        public var item_:int;
        public var data_:Object;
        public var itemBitmap_:Bitmap;
        public var toolTip_:EquipmentToolTip;
        public var enabled_:Boolean;
        public var slot_:int = 0;
        public var selectItem_:Boolean;
        private var disabledOverlay_:Sprite;
        protected var fill_:GraphicsSolidFill;
        protected var path_:GraphicsPath;
        private var graphicsData_:Vector.<IGraphicsData>;

        public function MarketplaceSlot(_arg1:int, _arg2:Object, _arg3:GameSprite, _arg4:Boolean, _arg5:Boolean=false) {
            this.fill_ = new GraphicsSolidFill(0x565656);
            this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
            this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
            super();
            this.gs_ = _arg3;
            this.item_ = _arg1;
            this.data_ = _arg2;
            this.enabled_ = _arg4;
            this.selectItem_ = _arg5;
            this.addEventListener(Event.ADDED_TO_STAGE, this.addedToStage)
            this.addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStage)
            this.redraw();
        }

        public function redraw() {
            var _local1:uint = ObjectLibrary.getItemNameColor(this.item_);
            if(this.data_ != null && this.data_.hasOwnProperty("NameColor")) {
                _local1 = this.data_.NameColor;
            }
            this.fill_.color = GraphicHelper.darkenColor(_local1, 25);
            this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
            GraphicHelper._0L_6(this.path_);
            GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 6, [1, 1, 1, 1], this.path_);
            graphics.clear();
            graphics.drawGraphicsData(this.graphicsData_);
            GraphicHelper.drawUI(3, 3, WIDTH - 6, HEIGHT - 6, 6, [1, 1, 1, 1], this.path_);
            this.fill_.color = _local1;
            this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
            graphics.drawGraphicsData(this.graphicsData_);
            if(this.itemBitmap_ != null && this.contains(this.itemBitmap_)) {
                removeChild(this.itemBitmap_);
                this.itemBitmap_ = null;
            }
            if(this.item_ != -1) {
                var _local2:XML = ObjectLibrary._Q_F_[this.item_];
                var _local3:Number = 5;
                if (_local2.hasOwnProperty("ScaleValue")) {
                    _local3 = _local2.ScaleValue;
                }
                var _local4:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this.item_, 80, true, true, _local3, 0, 0);
                if(this.data_ != null && this.data_.hasOwnProperty("TextureFile") && this.data_.TextureFile != "") {
                    _local4 = ObjectLibrary.getRedrawnTextureFromTypeCustom(this.item_, 80, true, this.item_, true, _local3, 0, 0);
                }
                this.itemBitmap_ = new Bitmap(_local4);
                var _local5:Point = _H_K_(this.item_, ObjectLibrary._gf(this.item_), false);
                this.itemBitmap_.x = (-(this.itemBitmap_.width) / 2) + (WIDTH / 2) + _local5.x;
                this.itemBitmap_.y = (-(this.itemBitmap_.height) / 2) + (HEIGHT / 2) + _local5.y;
                addChild(this.itemBitmap_);
            }
            if(this.disabledOverlay_ != null && this.contains(this.disabledOverlay_)) {
                removeChild(this.disabledOverlay_);
                this.disabledOverlay_ = null;
            }
            if(!this.enabled_) {
                this.disabledOverlay_ = new Sprite();
                this.disabledOverlay_.graphics.beginFill(0, 0.5);
                this.disabledOverlay_.graphics.moveTo(6, 0);
                this.disabledOverlay_.graphics.lineTo(WIDTH - 6, 0);
                this.disabledOverlay_.graphics.lineTo(WIDTH, 6);
                this.disabledOverlay_.graphics.lineTo(WIDTH, HEIGHT - 6);
                this.disabledOverlay_.graphics.lineTo(WIDTH - 6, HEIGHT);
                this.disabledOverlay_.graphics.lineTo(6, HEIGHT);
                this.disabledOverlay_.graphics.lineTo(0, HEIGHT - 6);
                this.disabledOverlay_.graphics.lineTo(0, 6);
                this.disabledOverlay_.graphics.lineTo(6, 0);
                this.disabledOverlay_.graphics.endFill();
                addChild(this.disabledOverlay_);
            }
        }

        protected function _H_K_(_arg1:int, _arg2:int, _arg3:Boolean):Point {
            var _local4:Point = new Point();
            switch (_arg2) {
                case 9:
                    _local4.x = (((_arg1) == 2878) ? 0 : -2);
                    _local4.y = ((_arg3) ? -2 : 0);
                    break;
                case 11:
                    _local4.y = -2;
                    break;
            }
            return (_local4);
        }

        private function _9():void {
            if (toolTip_ != null) {
                if (toolTip_.parent != null) {
                    toolTip_.parent.removeChild(toolTip_);
                }
                toolTip_ = null;
            }
        }

        private function onMouseOver(e:MouseEvent):void {
            this._9();
            if(this.item_ != -1 && ObjectLibrary._6H_(this.item_) != null) {
                this.toolTip_ = new EquipmentToolTip(this.item_, this.gs_.map_.player_, -1, _U_c.NPC, 1, false, this.data_);
                stage.addChild(this.toolTip_);
            }
        }

        private function onMouseOut(e:MouseEvent):void {
            this._9();
        }

        private function addedToStage(e:Event):void {
            if(!this.selectItem_) {
                this.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
                this.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            }
        }

        private function removedFromStage(e:Event):void {
            this._9();
            if(!this.selectItem_) {
                this.removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
                this.removeEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            }
        }
    }
}
