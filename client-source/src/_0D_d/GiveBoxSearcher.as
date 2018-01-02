/**
 * Created by club5_000 on 8/2/2015.
 */
package _0D_d {

  import com.company.assembleegameclient.ui.MarketplaceSlot;

  import com.company.assembleegameclient.game.GameSprite;
  import com.company.assembleegameclient.objects.ObjectLibrary;
  import com.company.assembleegameclient.ui.FrameHolder;

  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.MouseEvent;

  public class GiveBoxSearcher extends Sprite {

    public function GiveBoxSearcher(_arg1:GameSprite, _arg2:GiveBox) {
      super();
      this.gs_ = _arg1;
      this.giveBox_ = _arg2;
      this.choiceImages_ = new Vector.<MarketplaceSlot>();
      this.perRow_ = 5;
      this.build();
    }

    public var perRow_:int;
    private var giveBox_:GiveBox;
    private var gs_:GameSprite;
    private var _0A_z:Sprite;
    public var search_:TextInput;
    private var choices_:Sprite;
    private var choiceImages_:Vector.<MarketplaceSlot>;
    protected var type_:String;

    public function build():void {
      this._0A_z = new Sprite();
      this._0A_z.y = 104;
      this._0A_z.x = -26;
      this.search_ = new TextInput("", false, "");
      this.search_.x = 9;
      this._0A_z.addChild(this.search_);
      this.search_.addEventListener(Event.CHANGE, this.inputChange);
      this.choices_ = new Sprite();
      this.choices_.y = this.search_.height - 15;
      this._0A_z.addChild(this.choices_);
      this.addChild(this._0A_z);
    }

    public function itemSearch(_arg1:String):void {
      for each(var i:MarketplaceSlot in choiceImages_) {
        this.choices_.removeChild(i);
      }
      this.choiceImages_ = new Vector.<MarketplaceSlot>();
      if(_arg1 != "") {
        var _local1:Vector.<int> = ObjectLibrary.searchItems(_arg1);
        var l:int = 0;
        for(var p:int = 0; p < _local1.length; p++) {
          if(ObjectLibrary._6H_(_local1[p]) == null) {
            continue;
          }
          var _local3:XML = ObjectLibrary._Q_F_[_local1[p]];
          if(_local3.hasOwnProperty("AdminOnly") || _local3.hasOwnProperty("Soulbound")) {
            continue;
          }
          var _local2:MarketplaceSlot = new MarketplaceSlot(_local1[p], null, this.gs_, true, true);
          _local2.x = (l % perRow_) * (MarketplaceSlot.WIDTH + 4);
          _local2.y = Math.floor(l / perRow_) * (MarketplaceSlot.HEIGHT + 4);
          this.choices_.addChild(_local2);
          this.choiceImages_.push(_local2);
          _local2.addEventListener(MouseEvent.CLICK, this.onClickItem)
          l++;
        }
      }
    }

    private function inputChange(event:Event):void {
      this.itemSearch(this.search_.text());
    }

    private function onClickItem(event:MouseEvent):void {
      var _local1:MarketplaceSlot = (event.currentTarget as MarketplaceSlot);
      var _local3:XML = ObjectLibrary._Q_F_[_local1.item_];
      if(_local3 == null) {
        return;
      }
      var _local2:DataChooser = new DataChooser(this.gs_, _local1.item_);
      stage.addChild(new FrameHolder(_local2));
      this.giveBox_.parent.alpha = 0;
      _local2.addEventListener(Event.COMPLETE, this.onItemAdd);
    }

    private function onItemAdd(event:Event):void {
      this.giveBox_.parent.alpha = 1;
      var _local1:DataChooser = (event.currentTarget as DataChooser);
      if(!_local1.canceled_) {
        this.giveItem(_local1.itemType_, _local1.itemData_);
      }
    }

    public function setType(_arg1:String):void {
      this.type_ = _arg1;
    }

    private function giveItem(_arg1:int, _arg2:Object) {
      this.gs_.gsc_.giveItem(_arg1, _arg2);
      this.giveBox_.close();
    }
  }
}


