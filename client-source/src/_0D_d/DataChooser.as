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
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.text.TextFormatAlign;

  public class DataChooser extends Frame {

    public function DataChooser(_gs:GameSprite, _item:int) {
      super("Add item to trade", "Cancel", "OK", "/itemResult");
      this.gs_ = _gs;
      this.itemType_ = _item;
      this.canceled_ = false;
      this.addIcon();
    }

    public var canceled_:Boolean;
    public var itemType_:int;
    public var itemData_:Object;
    private var gs_:GameSprite;
    public var itemSprite_:Sprite;
    private var itemBitmap_:Bitmap;
    private var toolTip_:EquipmentToolTip;
    private var strangePart_:TextInput;
    private var strangifier_:TextInput;
    private var strange_:_zb;
    private var unusual_:_zb;
    private var effect_:TextInput;

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
      this.itemSprite_ = new Sprite();
      this.itemBitmap_ = new Bitmap(_local3);
      this.itemBitmap_.scaleX = this.itemBitmap_.scaleY = 2;
      this.itemSprite_.addChild(itemBitmap_);
      this.itemSprite_.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
      this.itemSprite_.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
      this.itemSprite_.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
      this._W_z(this.itemSprite_, this.w_ / 2 - this.itemSprite_.width / 2 - 10);

      this.strangePart_ = new TextInput("Strange Part", false, "");
      this.strangifier_ = new TextInput("Item Name", false, "");
      this.strange_ = new _zb("Strange", false, "");
      this.unusual_ = new _zb("Unusual", false, "");
      this.effect_ = new TextInput("Unusual Effect", false, "");

      if(_local1.@id == "Strange Part") {
        this._vO_(this.strangePart_);
      }
      if(_local1.@id == "Strangifier") {
        this._vO_(this.strangifier_);
      }
      if(_local1.hasOwnProperty("Projectile")) {
        this._O_1(this.strange_);
      }
      if(_local1.hasOwnProperty("Activate") && _local1.Activate == "UnlockSkin") {
        this._O_1(this.unusual_);
        this._vO_(this.effect_);
      }

      Button1.addEventListener(MouseEvent.CLICK, this.onClose);
      Button2.addEventListener(MouseEvent.CLICK, this.onComplete)
    }

    private function removeTooltip() {
      if (toolTip_ != null) {
        if (toolTip_.parent != null) {
          toolTip_.parent.removeChild(toolTip_);
        }
        toolTip_ = null;
      }
    }

    private function onMouseOver(e:MouseEvent):void {
      this.removeTooltip();
      if(this.itemType_ != -1 && ObjectLibrary._6H_(this.itemType_) != null) {
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
      this.canceled_ = true;
      dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onComplete(event:MouseEvent):void {
      stage.focus = null;
      this.itemData_ = {};
      if(this.strangePart_.parent != null) {
        this.itemData_.NamePrefix = this.strangePart_.text();
      }
      if(this.strangifier_.parent != null) {
        this.itemData_.NamePrefix = this.strangifier_.text();
        this.itemData_.NameColor = 0xFF5A28;
      }
      if(this.strange_.parent != null) {
        if(this.strange_._u6()) {
          this.itemData_.NamePrefix = "Strange";
          this.itemData_.NameColor = 0xFF5A28;
          this.itemData_.Strange = true;
          this.itemData_.Kills = 0;
        }
      }
      if(this.unusual_.parent != null && this.unusual_._u6()) {
        this.itemData_.NamePrefix = "Unusual";
        this.itemData_.NameColor = 0x8000FF;
        if(this.effect_.parent != null && this.effect_.text() != "") {
          this.itemData_.Effect = this.effect_.text();
        }
      }
      dispatchEvent(new Event(Event.COMPLETE));
    }
  }
}


