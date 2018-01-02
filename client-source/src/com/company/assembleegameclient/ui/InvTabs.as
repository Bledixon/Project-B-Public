package com.company.assembleegameclient.ui {

  import _011.ItemSelectStart;

  import _0C_P_.Options;

  import _F_1._H_o;

  import com.company.assembleegameclient.game.GameSprite;
  import com.company.assembleegameclient.objects.Player;
  import com.company.assembleegameclient.parameters.Parameters;
  import com.company.ui.SimpleText;
  import com.company.util.AssetLibrary;

  import flash.display.Bitmap;
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.filters.DropShadowFilter;

  public class InvTabs extends Sprite {

    public function InvTabs(_arg1:GameSprite, _arg2:Player, _arg3:int, _arg4:int) {
      this.gs_ = _arg1;
      this.go_ = _arg2;
      this.w_ = _arg3;
      this.h_ = _arg4;
      this._tm = new Bitmap(null);
      this._tm.x = -2;
      this._tm.y = -10;
      addChild(this._tm);
      this.nameText_ = new SimpleText(20, 0xB3B3B3, false, 0, 0, "Myriad Pro");
      this.nameText_.setBold(true);
      this.nameText_.x = 36;
      this.nameText_.y = -2;
      if (this.gs_.charList_.name_ == null) {
        this.nameText_.text = this.go_.name_;
      } else {
        this.nameText_.text = this.gs_.charList_.name_;
      }
      this.nameText_.updateMetrics();
      this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
      addChild(this.nameText_);
      if (this.gs_.gsc_.gameId_ != Parameters.NEXUS_ID) {
        this._nw = new _rN_(AssetLibrary._xK_("lofiInterfaceBig", 6), "Nexus", "escapeToNexus");
        this._nw.addEventListener(MouseEvent.CLICK, this._Q_C_);
        this._nw.x = 172;
        this._nw.y = 2;
        addChild(this._nw);
      } else {
        this._nw = new _rN_(AssetLibrary._xK_("lofiInterfaceBig", 5), "Options", "options");
        this._nw.addEventListener(MouseEvent.CLICK, this._nD_);
        this._nw.x = 172;
        this._nw.y = 2;
        addChild(this._nw);
      }
      this.Level_bar = new _0M_Y_(176, 16, 5931045, 0x2D2D2D, "Lvl X");
      this.Level_bar.x = 12;
      this.Level_bar.y = 30;
      addChild(this.Level_bar);
      this.Level_bar.visible = true;
      this.Fame_bar = new _0M_Y_(176, 16, 0xE25F00, 0x2D2D2D, "Fame");
      this.Fame_bar.x = 12;
      this.Fame_bar.y = 30;
      addChild(this.Fame_bar);
      this.Fame_bar.visible = false;
      this.Health_bar = new _0M_Y_(176, 16, 14693428, 0x2D2D2D, "HP");
      this.Health_bar.x = 12;
      this.Health_bar.y = 54;
      addChild(this.Health_bar);
      this.Magic_bar = new _0M_Y_(176, 16, 6325472, 0x2D2D2D, "MP");
      this.Magic_bar.x = 12;
      this.Magic_bar.y = 78;
      addChild(this.Magic_bar);
      this.equips_ = new Inventory(_arg1, _arg2, "Inventory", _arg2._9A_.slice(0, 4), 4, true, 0, true);
      this.equips_.x = 14;
      this.equips_.y = 104;
      addChild(this.equips_);
      this.tabList_ = [];
      this.invTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x20), true, 0);
      this.invTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
      this.invTab_.x = 7;
      this.invTab_.y = 152;
      addChild(this.invTab_);
      this.tabList_[0] = this.invTab_;
      this.statTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x21), false, 1);
      this.statTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
      this.statTab_.x = 35;
      this.statTab_.y = 152;
      addChild(this.statTab_);
      this.tabList_[1] = this.statTab_;
      this._086 = new Stats(191, 45);
      this._086.x = 6;
      this._086.y = 7;
      this.statTab_.holder_.addChild(this._086);
      this._e9 = new Inventory(_arg1, _arg2, "Inventory", _arg2._9A_.slice(4), 8, true, 4);
      this._e9.x = 7;
      this._e9.y = 7;
      this.invTab_.holder_.addChild(this._e9);
      this.teleportTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x27), false, 2);
      this.teleportTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
      this.teleportTab_.x = 35 + 28;
      this.teleportTab_.y = 152;
      addChild(this.teleportTab_);
      this.tabList_[2] = this.teleportTab_;
      this.vault_ = new _H_o("Vault", 11, false);
      this.vault_.addEventListener(MouseEvent.CLICK, Command_vault);
      this.vault_.x = 7;
      this.vault_.y = 10;
      this.vault_.buttonMode = true;
      this.vault_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.vault_);
      this.nexus_ = new _H_o("Nexus", 11, false);
      this.nexus_.addEventListener(MouseEvent.CLICK, Command_nexus);
      this.nexus_.x = 7;
      this.nexus_.y = 25;
      this.nexus_.buttonMode = true;
      this.nexus_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.nexus_);
      this.shop_ = new _H_o("Shop", 11, false);
      this.shop_.addEventListener(MouseEvent.CLICK, Command_shop);
      this.shop_.x = 7;
      this.shop_.y = 40;
      this.shop_.buttonMode = true;
      this.shop_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.shop_);
      this.goldshop_ = new _H_o("Gold Shop", 11, false);
      this.goldshop_.addEventListener(MouseEvent.CLICK, Command_gshop);
      this.goldshop_.x = 7;
      this.goldshop_.y = 55;
      this.goldshop_.buttonMode = true;
      this.goldshop_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.goldshop_);
      this.xpgift_ = new _H_o("XP Farm", 11, false);
      this.xpgift_.addEventListener(MouseEvent.CLICK, Command_xpgift);
      this.xpgift_.x = 7;
      this.xpgift_.y = 70;
      this.xpgift_.buttonMode = true;
      this.xpgift_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.xpgift_);
      this.erealm_ = new _H_o("Elder Realm", 11, false);
      this.erealm_.addEventListener(MouseEvent.CLICK, Command_erealm);
      this.erealm_.x = 70;
      this.erealm_.y = 55;
      this.erealm_.buttonMode = true;
      this.erealm_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.erealm_);
      this.earena_ = new _H_o("Event Arena", 11, false);
      this.earena_.addEventListener(MouseEvent.CLICK, Command_earena);
      this.earena_.x = 70;
      this.earena_.y = 10;
      this.earena_.buttonMode = true;
      this.earena_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.earena_);
      this.arena_ = new _H_o("Arena", 11, false);
      this.arena_.addEventListener(MouseEvent.CLICK, Command_arena);
      this.arena_.x = 70;
      this.arena_.y = 25;
      this.arena_.buttonMode = true;
      this.arena_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.arena_);
      this.eglands_ = new _H_o("Godlands", 11, false);
      this.eglands_.addEventListener(MouseEvent.CLICK, Command_eglands);
      this.eglands_.x = 70;
      this.eglands_.y = 40;
      this.eglands_.buttonMode = true;
      this.eglands_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.eglands_);
      this.clothmarket_ = new _H_o("Cloth Market", 11, false);
      this.clothmarket_.addEventListener(MouseEvent.CLICK, Command_clothmarket);
      this.clothmarket_.x = 70;
      this.clothmarket_.y = 70;
      this.clothmarket_.buttonMode = true;
      this.clothmarket_.useHandCursor = true;
      this.teleportTab_.holder_.addChild(this.clothmarket_);
      if (Player._e_D)
      {
        this.adminTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x26), false, 3);
        this.adminTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
        this.adminTab_.x = 35 + 56;
        this.adminTab_.y = 152;
        addChild(this.adminTab_);
        this.tabList_[3] = this.adminTab_;
        this.max_ = new _H_o("Max this Character!", 11, false);
        this.max_.addEventListener(MouseEvent.CLICK, Command_max);
        this.max_.x = 7;
        this.max_.y = 10;
        this.max_.buttonMode = true;
        this.max_.useHandCursor = true;
        this.adminTab_.holder_.addChild(this.max_);
        this.restart_ = new _H_o("Restart the server!", 11, false);
        this.restart_.addEventListener(MouseEvent.CLICK, Command_restart);
        this.restart_.x = 7;
        this.restart_.y = 25;
        this.restart_.buttonMode = true;
        this.restart_.useHandCursor = true;
        this.adminTab_.holder_.addChild(this.restart_);
        this.summonall_ = new _H_o("Summon all players!", 11, false);
        this.summonall_.addEventListener(MouseEvent.CLICK, Command_summonall);
        this.summonall_.x = 7;
        this.summonall_.y = 40;
        this.summonall_.buttonMode = true;
        this.summonall_.useHandCursor = true;
        this.adminTab_.holder_.addChild(this.summonall_);
        this.maxlvl_ = new _H_o("Max Level!", 11, false);
        this.maxlvl_.addEventListener(MouseEvent.CLICK, Command_maxlvl);
        this.maxlvl_.x = 7;
        this.maxlvl_.y = 55;
        this.maxlvl_.buttonMode = true;
        this.maxlvl_.useHandCursor = true;
        this.adminTab_.holder_.addChild(this.maxlvl_);
      }
      mouseEnabled = false;
      this.setChildIndex(this.invTab_, this.numChildren - 1);
      this.draw();
    }
    public var equips_:Inventory;
    public var _e9:Inventory;
    public var pack_:Inventory;
    public var _0E__:int;
    public var itemSelect_:ItemSelect;
    private var gs_:GameSprite;
    private var go_:Player;
    private var w_:int;
    private var h_:int;
    private var _tm:Bitmap;
    private var nameText_:SimpleText;
    private var _L_P_:Sprite;
    private var _nw:_rN_ = null;
    private var Level_bar:_0M_Y_;
    private var Fame_bar:_0M_Y_;
    private var Health_bar:_0M_Y_;
    private var Magic_bar:_0M_Y_;
    private var _086:Stats;
    private var invTab_:TabButton;
    private var statTab_:TabButton;
    private var teleportTab_:TabButton;
    private var vault_:_H_o;
    private var nexus_:_H_o;
    private var shop_:_H_o;
    private var goldshop_:_H_o;
    private var xpgift_:_H_o;
    private var earena_:_H_o;
    private var arena_:_H_o;
    private var eglands_:_H_o;
    private var erealm_:_H_o;
    private var clothmarket_:_H_o;
    private var adminTab_:TabButton;
    private var max_:_H_o;
    private var restart_:_H_o;
    private var summonall_:_H_o;
    private var maxlvl_:_H_o;
    private var tabBG_:TabBackground;
    private var tabList_:Array;
    private var selectedTab_:int = 0;
    private var stackPots:Boolean = false;
    public var CommandID:int = 0;

    public function setName(_arg1:String):void {
      this.nameText_.text = _arg1;
      this.nameText_.updateMetrics();
    }

    public function nextTab():void {
      if (this.selectedTab_ + 1 == this.tabList_.length) {
        this.switchTab(this.tabList_[0] as TabButton);
      } else {
        this.switchTab(this.tabList_[this.selectedTab_ + 1] as TabButton);
      }
    }

    public function switchTab(_tab:TabButton):void {
      if (_tab.selected_) return;
      for each(var _i:TabButton in this.tabList_) {
        _i.setSelected(false);
      }
      _tab.setSelected(true);
      this.selectedTab_ = _tab.tabId_;
      this.setChildIndex(_tab, this.numChildren - 1);
    }

    public function draw():void {
      this._tm.bitmapData = this.go_.getPortrait();
      var _local1:String = ("Lvl " + this.go_.level_);
      if (_local1 != this.Level_bar.labelText_.text) {
        this.Level_bar.labelText_.text = _local1;
        this.Level_bar.labelText_.updateMetrics();
      }
      if (this.go_.level_ != 120) {
        if (!this.Level_bar.visible) {
          this.Level_bar.visible = true;
          this.Fame_bar.visible = false;
        }
        this.Level_bar.draw((this.go_.exp_), this.go_._7V_, 0);
        if (this._0E__ != this.go_._gz) {
          this._0E__ = this.go_._gz;
          this.Level_bar._Y_r(this._0E__, this.go_._gz);
        }
      } else {
        if (!this.Fame_bar.visible) {
          this.Fame_bar.visible = true;
          this.Level_bar.visible = false;
        }
        this.Fame_bar.draw(this.go_._0L_o, this.go_._n8, 0);
      }
      //this.tabBG_.draw(this.invTab_.selected_);
      this.Health_bar.draw(this.go_.HP_, this.go_.maxHP_, this.go_._P_7, this.go_._uR_);
      this.Magic_bar.draw(this.go_.MP_, this.go_.maxMP_, this.go_._0D_G_, this.go_._dt);
      this._086.draw(this.go_);
      this.equips_.draw(this.go_.equipment_.slice(0, 4));
      this._e9.draw(this.go_.equipment_.slice(4));
    }

    public function destroy():void {
    }

    private function _Q_C_(_arg1:MouseEvent):void {
      this.gs_.gsc_._M_6();
      //GA.global().trackEvent("enterPortal", "Nexus Button");
      Parameters.data_.needsRandomRealm = false;
      Parameters.save();
    }

    private function _nD_(_arg1:MouseEvent):void {
      this.gs_.mui_.clearInput();
      //GA.global().trackEvent("options", "Options Button");
      this.gs_.addChild(new Options(this.gs_));
    }

    private function onTabClick(me:MouseEvent):void {
      if (me.target is TabButton) {
        this.switchTab(me.target as TabButton);
      }
    }

    public function selectItems(_arg1:ItemSelectStart) {
      if(this.itemSelect_ != null) {
        return;
      }
      this.equips_.visible = false;
      this.statTab_.visible = false;
      this.invTab_.visible = false;
      this.itemSelect_ = new ItemSelect(this.gs_, _arg1);
      this.itemSelect_.y = 62;
      addChild(this.itemSelect_);
      this.itemSelect_.addEventListener(Event.CANCEL, this.cancelSelect)
    }

    public function cancelSelect(event:Event=null):void {
      this.equips_.visible = true;
      this.statTab_.visible = true;
      this.invTab_.visible = true;
      if(this.itemSelect_ != null) {
        this.itemSelect_.removeEventListener(Event.CANCEL, this.cancelSelect);
        removeChild(this.itemSelect_);
        this.itemSelect_ = null;
      }
    }

    public function Command_max(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/m");
    }
    public function Command_restart(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/restart");
    }
    public function Command_nexus(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/nexus");
    }
    public function Command_vault(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/vault");
    }
    public function Command_earena(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/earena");
    }
    public function Command_arena(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/arena");
    }
    public function Command_shop(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/shop");
    }
    public function Command_gshop(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/goldshop");
    }
    public function Command_xpgift(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/xpgift");
    }
    public function Command_eglands(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/eglands");
    }
    public function Command_summonall(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/summonall");
    }
    public function Command_erealm(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/realm");
    }
    public function Command_clothmarket(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/clothmarket");
    }
    public function Command_maxlvl(_arg1:Event): void
    {
      this.gs_.gsc_.playerText("/stats lvl 120");
    }

    /* public function xSvrCmds(_arg1:Event): void {
     switch (CommandID) {
     case 0: this.gs_.gsc_.playerText("/m");
     case 1: this.gs_.gsc_.playerText("/restart");
     case 2: this.gs_.gsc_.playerText("/nexus");
     case 3: this.gs_.gsc_.playerText("/vault");
     }
     } */

  }
}