// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7.EquipmentToolTip

package _E_7 {


  import _ke._U_c;

  import com.company.assembleegameclient.net.messages.data.StatData;
  import com.company.assembleegameclient.objects.GameObject;
  import com.company.assembleegameclient.objects.GameObject;
  import com.company.assembleegameclient.objects.ObjectLibrary;
  import com.company.assembleegameclient.objects.Player;
  import com.company.assembleegameclient.parameters.Parameters;
  import com.company.assembleegameclient.ui._return;
  import com.company.ui.SimpleText;
  import com.company.util.BitmapUtil;
  import com.company.util._H_V_;
  import com.hurlant.util.der.Integer;

  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.filters.DropShadowFilter;
  import flash.text.StyleSheet;
  import flash.utils.Dictionary;

  import flashx.textLayout.formats.Float;

  public class EquipmentToolTip extends _for_ {

    private static const _be:int = 286;
    private static const _K_z:String = ".in { margin-left:10px; text-indent: -10px; }";
    private static const fontName:String = "CHIP SB";
    private static const fontSize:int = 13;

    private static function _N_W_(_arg1:Vector.<Restriction>):String {
      var _local4:Restriction;
      var _local5:String;
      var _local2:String = "";
      var _local3:Boolean = true;
      for each (_local4 in _arg1) {
        if (!_local3) {
          _local2 = (_local2 + "\n");
        } else {
          _local3 = false;
        }
        _local5 = (((('<font color="#' + _local4.color_.toString(16)) + '">') + _local4.text_) + "</font>");
        if (_local4.bold_) {
          _local5 = (("<b>" + _local5) + "</b>");
        }
        _local2 = (_local2 + _local5);
      }
      return (_local2);
    }

    public function EquipmentToolTip(_arg1:int, _arg2:Player, _arg3:int, _arg4:String, _arg5:uint = 1, _arg6:Boolean = false, _arg7:Object = null) {
      var _local9:uint;
      this.player_ = _arg2;
      this._J_9 = _arg4;
      this._G_H_ = _arg5;
      this._bs = _arg6;
      this.itemData_ = _arg7;
      this._0G_J_ = (_arg2 != null ? ObjectLibrary._d1(_arg1, _arg2) : false);
      this.meetsLevel = ObjectLibrary.checkLevelRequirement(_arg1, _arg2);
      var _local7:uint = ((((this._0G_J_ && this.meetsLevel) || ((this.player_ == null)))) ? 0x2A2A2A : 5578255);
      var _local8:uint = ((((this._0G_J_ && this.meetsLevel) || ((_arg2 == null)))) ? 0x9B9B9B : 10965039);
      super(_local7, 1, _local8, 1, true);
      this._uW_ = new _fM_();
      this.objectType_ = _arg1;
      this._I_z = ObjectLibrary._Q_F_[_arg1];
      this._Y_X_ = this.player_ != null ? ObjectLibrary._01j(this.objectType_, this.player_) : false;
      this._a2 = new Vector.<Effect>();
      this._sJ_ = _arg3;
      this._0A_f = int(this._I_z.SlotType);
      if (this.player_ == null) {
        this.curItemXML = this._I_z;
        this.curItemData = this.itemData_;
      } else {
        if (this._Y_X_) {
          _local9 = 0;
          while (_local9 < 4) {
            if ((((this._0A_f == this.player_._9A_[_local9])) && (!((this.player_.equipment_[_local9] == -1))))) {
              this.curItemXML = ObjectLibrary._Q_F_[this.player_.equipment_[_local9]];
              this.curItemData = this.player_.equipData_[_local9];
              break;
            }
            _local9++;
          }
        }
      }
      this.init();
    }
    private var _5U_:Bitmap;
    private var _P_V_:SimpleText;
    private var _g1_:SimpleText;
    private var _V_0:SimpleText;
    private var rank_:SimpleText;
    private var _C_G_:SimpleText;
    private var level_:SimpleText;
    private var actualName_:SimpleText;
    private var line_:_return;
    private var line1_:_return;
    private var line2_:_return;
    private var line3_:_return;
    private var _f8:SimpleText;
    private var _tF_:SimpleText;
    private var _fT_:SimpleText;
    private var player_:Player;
    private var _Y_X_:Boolean = false;
    private var objectType_:int;
    private var curItemXML:XML = null;
    private var curItemData:Object = null;
    private var _I_z:XML = null;
    private var _uW_:_fM_;
    private var _0G_J_:Boolean;
    private var meetsLevel:Boolean;
    private var _Q_O_:Vector.<Restriction>;
    private var _O_Q_:Vector.<Restriction>;
    private var _a2:Vector.<Effect>;
    private var _0A_f:int;
    private var _sJ_:int;
    private var _J_9:String;
    private var _G_H_:uint;
    private var _bs:Boolean;
    private var _02N_:int;
    private var _gE_:_R_N_;
    private var itemData_:Object;

    private var lineNum:int;
    private var lineArray:Array;

    private function init():void {
      this.initHead();
      this.setData(); // ??
      this.initBody();
      if (this._C_G_ != null) this.addLine(((this._C_G_.y + this._C_G_.height) + 4), 0); // Separator 1 ((Under Icon))
      this.addElem(); // Add Body Elements (Item Stats)
      if (this._f8 != null) this.addLine(((this._f8.y + this._f8.height) + 4), 2); // Separator 2 ((Under Info))
      this.initFoot();
      this.addElem3(); // Add Foot Elements (Restrictions)
      if (this._fT_ != null) this.addLine(((this._fT_.y + this._fT_.height) + 4), 3); // Separator 3 ((Under Special Info))
      this.addElem2(); // Add Head Elements (Restrictions)
    }

    private function initHead():void {
      this.initIcon(); // Icon
      this.initName(); // Name - Color - Prefix
      this.initTier(); // Tier
      this.initDesc(); // Description
      this.initActualName();
      this.initLevel();
    }
    private function initBody():void {
      this.extraToolData_(); // Extra Tooltip Data ((Shurikens))
      this.initProjs(); // NumProjectiles ((Shots))
      this.initBase(); // Projectile - Damage - Range - Shot Effect
      this.initAbility(); // Ability Type
      this.initStats(); // On Equip
      this.initDoses(); // Doses
      this.initMpCost(); // MP Cost
      this.initFame(); // Fame Bonus
    }
    private function initFoot():void {
      this.initSInfo();
      this.initInfo(); // Item Type - Level Requirement
    }

    private function extraToolData_():void {
      var _local1:XMLList;
      var _local2:XML;
      if (this._I_z.hasOwnProperty("ExtraTooltipData")) {
        _local1 = this._I_z.ExtraTooltipData.EffectInfo;
        for each (_local2 in _local1) {
          this._a2.push(new Effect(_local2.attribute("name"), _local2.attribute("description")));
        }
      }
    }

    private function _02c():Boolean {
      return (((this._Y_X_) && ((this.curItemXML == null))));
    }

    public static function getIconFromValue(_arg1:uint):Bitmap{
      return (new Bitmap(ObjectLibrary.getRedrawnTextureFromType(_arg1, 80, true)));
    }

    private function initIcon():void {
      var _local1:XML = ObjectLibrary._Q_F_[this.objectType_];
      var _local2:Number = 5;
      if (_local1.hasOwnProperty("ScaleValue")) {
        _local2 = _local1.ScaleValue;
      }
      var _local3:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this.objectType_, 60, true, true, _local2);
      if(this.itemData_ != null && this.itemData_.hasOwnProperty("TextureFile") && this.itemData_.TextureFile != "") {
        _local3 = ObjectLibrary.getRedrawnTextureFromTypeCustom(this.objectType_, 60, true, this.itemData_, true, _local2);
      }
      _local3 = BitmapUtil._Y_d(_local3, 4, 4, (_local3.width - 8), (_local3.height - 8));
      this._5U_ = new Bitmap(_local3);
      addChild(this._5U_);
    }

    private function initTier():void {
      this._V_0 = new SimpleText(fontSize + 2, 0xFFFFFF, false, 30, 0, fontName);
      this.rank_ = new SimpleText(fontSize + 2, 0xFFFFFF, false, 30, 0, fontName);
      this._P_V_.setBold(true);
      this._V_0.y = ((this._5U_.height / 2) - (this._P_V_._I_x / 2) - 8);
      this._V_0.x = (_be - 28);
      this.rank_.y = ((this._5U_.height / 2) - (this._P_V_._I_x / 2) + this._V_0.y);
      this.rank_.x = (_be - 28);
      if (this._I_z.hasOwnProperty("Consumable") == false && this._I_z.hasOwnProperty("Material") == false && this._tO_() == false) {
        if (this._I_z.hasOwnProperty("Tier")) {
          if (int(this._I_z.Tier).valueOf() <= 3)
            this._V_0.setColor(0xFFFFFF);
          else if (int(this._I_z.Tier).valueOf() <= 7)
            this._V_0.setColor(0xFFD700);
          else if (int(this._I_z.Tier).valueOf() <= 11)
            this._V_0.setColor(0xFF12C9);
          else
            this._V_0.setColor(0xAB9CE1);
          this._V_0.text = ("T" + this._I_z.Tier);
          if (int(this._I_z.Tier).valueOf() == 33)
          {
            this._V_0.setColor(0xFFA500);
            this._V_0.text = "HT";
          }
        } else {
          this._V_0.setColor(9055202);
          this._V_0.text = "UT";
        }
        this._V_0.updateMetrics();
        addChild(this._V_0);
      }
      this.rank_.setColor(ObjectLibrary.getItemNameColor(this.objectType_));
      this.rank_.text = ObjectLibrary.getRarity(this.objectType_);
      this.rank_.updateMetrics();
    }

    private function _tO_():Boolean {
      var activateTags:XMLList;
      activateTags = this._I_z.Activate.(text() == "PermaPet");
      return ((activateTags.length() >= 1));
    }

    private function initName():void {
      var _local1:int = ((this._0G_J_ && this.meetsLevel) || this.player_ == null) ? 0xFFFFFF : 16549442;
      if(this.itemData_ != null && this.itemData_.hasOwnProperty("NameColor") && this.itemData_.NameColor != 0xFFFFFF) {
        _local1 = int(this.itemData_.NameColor);
      }
      this._g1_ = new SimpleText(fontSize + 2, _local1, false, (((_be - this._5U_.width) - 4) - 30), 0, fontName);
      this._g1_.setBold(true);
      this._g1_.wordWrap = true;
      if(this.itemData_ != null && this.itemData_.hasOwnProperty("NamePrefix") && this.itemData_.NamePrefix != "") {
        this._g1_.text = this.itemData_.NamePrefix;
      }
      this._g1_.updateMetrics();
      this._g1_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
      this._g1_.x = (this._5U_.width + 4);
      this._g1_.y = ((this._5U_.height / 2) - (this._g1_._I_x / 2) - (fontSize / 2));
      if (this._g1_.text != "") addChild(this._g1_);
      this._P_V_ = new SimpleText(fontSize + 2, _local1, false, (((_be - this._5U_.width) - 4) - 30), 0, fontName);
      this._P_V_.setBold(true);
      this._P_V_.wordWrap = true;
      this._P_V_.text = ObjectLibrary._0D_N_[this.objectType_];
      if(this.itemData_ != null && this.itemData_.hasOwnProperty("Name") && this.itemData_.Name != "") {
        this._P_V_.text = this.itemData_.Name;
      }
      this._P_V_.updateMetrics();
      this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
      this._P_V_.x = (this._5U_.width + 4);
      this._P_V_.y = ((this._5U_.height / 2) - (this._P_V_._I_x / 2) + ((this._g1_.text != "") ? (fontSize / 2) : 0));
      addChild(this._P_V_);
    }

    private function addLine(_arg1:int, _arg2:int):void {
      switch (_arg2) {
        case 0:
          this.line_ = new _return((_be - 12), 0x2D2D2D);
          this.line_.x = 8;
          this.line_.y = _arg1;
          addChild(this.line_);
          return;
        case 1:
          this.line1_ = new _return((_be - 12), 0x2D2D2D);
          this.line1_.x = 8;
          this.line1_.y = _arg1;
          addChild(this.line1_);
          return;
        case 2:
          this.line2_ = new _return((_be - 12), 0x2D2D2D);
          this.line2_.x = 8;
          this.line2_.y = _arg1;
          addChild(this.line2_);
          return;
        case 3:
          this.line3_ = new _return((_be - 12), 0x2D2D2D);
          this.line3_.x = 8;
          this.line3_.y = _arg1;
          addChild(this.line3_);
          return;
      }
    }

    private function addElem():void {
      //this._02N_ = ((this._C_G_.y + this._C_G_.height) + 8);
      if (((!((this._a2.length == 0))) || (!((this._gE_.text == ""))))) {
        /*this.line1_ = new _return((_be - 12), 0x2D2D2D);
         this.line1_.x = 8;
         this.line1_.y = this._02N_;
         addChild(this.line1_);*/
        this._f8 = new SimpleText(fontSize, 0xB3B3B3, false, ((_be - 4)), 0, fontName);
        this._f8.wordWrap = true;
        this._f8.htmlText = (this._gE_.text + this._41(this._a2));
        this._f8._08S_();
        this._f8.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._f8.x = 4;
        this._f8.y = (this.level_.text != "" || this.actualName_.text != "") ? (this.line1_.y + 4) : (this.line_.y + 4);
        addChild(this._f8);
        //this._02N_ = ((this._f8.y + this._f8.height) + 8);
      }
    }

    private function initProjs():void {
      if (((this._I_z.hasOwnProperty("NumProjectiles")) && (!((this._gE_._5n.hasOwnProperty(this._I_z.NumProjectiles.toXMLString()) == true))))) {
        this._a2.push(new Effect("Number of Shots", this._I_z.NumProjectiles));
      }
    }

    private function initFame():void {
      var _local1:int;
      var _local2:String;
      var _local3:String;
      var _local4:int;
      if (this._I_z.hasOwnProperty("FameBonus")) {
        _local1 = int(this._I_z.FameBonus);
        _local2 = (_local1 + "%");
        _local3 = ((this._0G_J_ && this.meetsLevel) ? _0J_n._rJ_ : _0J_n._iF_);
        if (((!((this.curItemXML == null))) && (this.curItemXML.hasOwnProperty("FameBonus")))) {
          _local4 = int(this.curItemXML.FameBonus.text());
          _local3 = _0J_n._qy((_local1 - _local4));
        }
        this._a2.push(new Effect("Fame Bonus", _0J_n._M_w(_local2, _local3)));
      }
    }

    private function initMpCost():void {
      if (this._I_z.hasOwnProperty("MpCost") && !this._gE_._5n[this._I_z.MpCost[0].toXMLString()]) {
        if (this._I_z.hasOwnProperty("MpEndCost"))
          this._a2.push(new Effect("MP Cost", this._I_z.MpEndCost));
        else
          this._a2.push(new Effect("MP Cost", this._I_z.MpCost));
      }
    }

    private function initDoses():void {
      if (this._I_z.hasOwnProperty("Doses")) {
        this._a2.push(new Effect("Doses", this._I_z.Doses));
      }
    }

    private function initBase():void {
      var _local1:XML;
      var _local2:int;
      var _local3:int;
      var _local4:Number;
      var _local5:XML;
      var _local6:Boolean;
      var _local7:int;
      if (((this._I_z.hasOwnProperty("Projectile")) && ((this._gE_._5n.hasOwnProperty(this._I_z.Projectile.toXMLString()) == false)))) {
        _local1 = XML(this._I_z.Projectile);
        _local2 = int(_local1.MinDamage);
        _local3 = int(_local1.MaxDamage);
        _local6 = false;
        var customMin:int = (this.itemData_ != null && this.itemData_.hasOwnProperty("MinDamage")) ? int(this.itemData_.MinDamage) : 0;
        var customMax:int = (this.itemData_ != null && this.itemData_.hasOwnProperty("MaxDamage")) ? int(this.itemData_.MaxDamage) : 0;
        var addString:String = (customMin != 0 && customMax != 0) ? " <font color=\"#" + (customMin > 0 || customMax > 0 ? "1CABFF" : "FF6863") + "\">(" + (customMin > 0 ? "+" : "-") + customMin + "-" + customMax + " DMG)</font>"
            : customMin != 0 ? " <font color=\"#" + (customMin > 0 ? "1CABFF" : "FF6863") + "\">(" + (customMin > 0 ? "+" : "-") + customMin + " Minimum DMG)</font>"
                : customMax != 0 ? " <font color=\"#" + (customMax > 0 ? "1CABFF" : "FF6863") + "\">(" + (customMax > 0 ? "+" : "-") + customMax + " Maximum DMG)</font>"
                    : "";
        _local2 += customMin;
        _local3 += customMax;
        if(this.itemData_ != null && this.itemData_.hasOwnProperty("DmgPercentage") && this.itemData_.DmgPercentage != 0) {
          _local6 = true;
          _local7 = int(this.itemData_.DmgPercentage);
          _local2 += (_local2 * (_local7 / 100));
          _local3 += (_local3 * (_local7 / 100));
        }
        this._a2.push(new Effect("Attack Damage", (_local2 == _local3 ? _local2 : _local2 + " - " + _local3).toString() + addString));
        if(_local6) {
          this._a2.push(new Effect("Damage Multiplier", (_local7 < 0 ? "-" : "+") + _local7.toString() + "%"));
        }
        _local4 = ((Number(_local1.Speed) * Number(_local1.LifetimeMS)) / 10000);
        this._a2.push(new Effect("Projectile Range", _0J_n._A_l(_local4)));
        if (this._I_z.Projectile.hasOwnProperty("MultiHit")) {
          this._a2.push(new Effect("", "Shots hit multiple targets"));
        }
        if (this._I_z.Projectile.hasOwnProperty("PassesCover")) {
          this._a2.push(new Effect("", "Shots pass through obstacles"));
        }
        for each (_local5 in _local1.ConditionEffect) {
          if (this._gE_._5n[_local5.toXMLString()] == null) {
            this._a2.push(new Effect("Projectile Effect", (((this._I_z.Projectile.ConditionEffect + " for ") + this._I_z.Projectile.ConditionEffect.@duration) + " secs")));
          }
        }
      }
    }

    private function initAbility():void {
      var _local1:XML;
      var _local2:String;
      var _local3:int;
      var _local4:int;
      for each (_local1 in this._I_z.Activate) {
        if (this._gE_._5n[_local1.toXMLString()] != true) {
          var _local6:String = _local1.toString();
          switch (_local6) {
            case "ConditionEffectAura":
              this._a2.push(new Effect("Party Effect", (("Within " + _local1.@range) + " sqrs")));
              this._a2.push(new Effect("", (((("  " + _local1.@effect) + " for ") + _local1.@duration) + " secs")));
              break;
            case "ConditionEffectSelf":
              this._a2.push(new Effect("Effect on Self", ""));
              this._a2.push(new Effect("", (((("  " + _local1.@effect) + " for ") + _local1.@duration) + " secs")));
              break;
            case "Heal":
              this._a2.push(new Effect("", (("+" + _local1.@amount) + " HP")));
              break;
            case "HealNova":
              this._a2.push(new Effect("Party Heal", (((_local1.@amount + " HP at ") + _local1.@range) + " sqrs")));
              break;
            case "Magic":
              this._a2.push(new Effect("", (("+" + _local1.@amount) + " MP")));
              break;
            case "MagicNova":
              this._a2.push(new Effect("Fill Party Magic", (((_local1.@amount + " MP at ") + _local1.@range) + " sqrs")));
              break;
            case "Teleport":
              this._a2.push(new Effect("", "Teleport to Target"));
              break;
            case "VampireBlast":
              this._a2.push(new Effect("Steal", (((_local1.@totalDamage + " HP within ") + _local1.@radius) + " sqrs")));
              break;
            case "Trap":
              this._a2.push(new Effect("Trap", (((_local1.@totalDamage + " HP within ") + _local1.@radius) + " sqrs")));
              this._a2.push(new Effect("", (((("  " + ((_local1.hasOwnProperty("@condEffect")) ? _local1.@condEffect : "Slowed")) + " for ") + ((_local1.hasOwnProperty("@condDuration")) ? _local1.@condDuration : "5")) + " secs")));
              break;
            case "StasisBlast":
              this._a2.push(new Effect("Stasis on Group", (_local1.@duration + " secs")));
              break;
            case "Decoy":
              this._a2.push(new Effect("Decoy", (_local1.@duration + " secs")));
              break;
            case "Lightning":
              this._a2.push(new Effect("Lightning", ""));
              this._a2.push(new Effect("", ((((" " + _local1.@totalDamage) + " to ") + _local1.@maxTargets) + " targets")));
              break;
            case "PoisonGrenade":
              this._a2.push(new Effect("Poison Grenade", ""));
              this._a2.push(new Effect("", ((((((" " + _local1.@totalDamage) + " HP over ") + _local1.@duration) + " secs within ") + _local1.@radius) + " sqrs\n")));
              break;
            case "RemoveNegativeConditions":
              this._a2.push(new Effect("", "Removes negative conditions"));
              break;
            case "RemoveNegativeConditionsSelf":
              this._a2.push(new Effect("", "Removes negative conditions"));
              break;
            case "IncrementStat":
              _local3 = int(_local1.@stat);
              _local4 = int(_local1.@amount);
              if (((!((_local3 == StatData._V_A_))) && (!((_local3 == StatData._aC_))))) {
                _local2 = ("Permanently increases " + StatData._W_H_(_local3));
              } else {
                _local2 = ((("+" + _local4) + " ") + StatData._W_H_(_local3));
              }
              this._a2.push(new Effect("", _local2));
              break;
            case "OpenCrate":
              this._a2.push(new Effect("", "Opens a crate"));
              break;
          }
        }
      }
    }

    private function initStats():void {
      var _local1:XML;
      var _local3:String;
      var _local2:Boolean = true;
      for each (_local1 in this._I_z.ActivateOnEquip) {
        if (_local2) {
          this._a2.push(new Effect("On Equip", ""));
          _local2 = false;
        }
        _local3 = this._gE_._P_3[_local1.toXMLString()];
        if (_local3 != null) {
          this._a2.push(new Effect("", (_local3)));
        } else {
          if (_local1.toString() == "IncrementStat") {
            this._a2.push(new Effect("", this.statHandler(_local1)));
          }
        }
      }
    }

    private function statHandler(_arg1:XML):String {
      var _local2:int = int(_arg1.@stat);
      var _local3:int = int(_arg1.@amount);
      var _local4:String = (_local3 > -1) ? "+" : "";
      return ('<font color="' + textColour(_arg1) + '">' + (_local4 + String(_local3) + " ") + StatData._W_H_(_local2) + '</font>');
    }

    private function textColour(activateXML:XML):String {
      var match:XML;
      var otherAmount:int;
      var stat:int = int(activateXML.@stat);
      var amount:int = int(activateXML.@amount);
      var textColor:String = ((this._0G_J_ && this.meetsLevel) ? "#00FF00" : "#FFFF8F");
      var otherMatches:XMLList;
      if (this.curItemXML != null) {
        otherMatches = this.curItemXML.ActivateOnEquip.(@stat == stat);
      }
      if (((!((otherMatches == null))) && ((otherMatches.length() == 1)))) {
        match = XML(otherMatches[0]);
        otherAmount = int(match.@amount);
        textColor = _0J_n._qy((amount - otherAmount));
      }
      if (amount < 0) {
        textColor = "#FF0000";
      }
      return (textColor);
    }

    private function initUse():void {
      this._Q_O_.push(new Restriction("Must be equipped to use", 0xB3B3B3, false));
      if (((this._bs) || ((this._J_9 == _U_c.CURRENT_PLAYER)))) {
        this._Q_O_.push(new Restriction("Double-Click to equip", 0xB3B3B3, false));
      } else {
        this._Q_O_.push(new Restriction("Double-Click to take", 0xB3B3B3, false));
      }
    }

    private function initUse2():void {
      this._Q_O_.push(new Restriction((("Press [" + _H_V_._in[Parameters.data_.useSpecial]) + "] in world to use"), 0xFFFFFF, false));
    }

    private function initUse3():void {
      this._Q_O_.push(new Restriction("Consumed with use", 0xB3B3B3, false));
      if (((this._bs) || ((this._J_9 == _U_c.CURRENT_PLAYER)))) {
        this._Q_O_.push(new Restriction("Double-Click or Shift-Click on item to use", 0xFFFFFF, false));
      } else {
        this._Q_O_.push(new Restriction("Double-Click to take & Shift-Click to use", 0xFFFFFF, false));
      }
    }

    private function initUse4():void {
      this._Q_O_.push(new Restriction("Can be used multiple times", 0xB3B3B3, false));
      this._Q_O_.push(new Restriction("Double-Click or Shift-Click on item to use", 0xFFFFFF, false));
    }

    private function initSInfo():void {
      this._O_Q_ = new Vector.<Restriction>();
      if (this.itemData_ != null && this.itemData_.hasOwnProperty("Strange") && Boolean(this.itemData_.Strange)) {
        if(this.itemData_.hasOwnProperty("Kills")) {
          this._O_Q_.push(new Restriction("Kills: " + int(this.itemData_.Kills).toString(), 0xB3B3B3, false));
        }
        if(this.itemData_.hasOwnProperty("StrangeParts")) {
          var _sDict:Object = this.itemData_.StrangeParts;
          for (var _k:Object in _sDict) {
            this._O_Q_.push(new Restriction(_k + ": " + _sDict[_k], 0xB3B3B3, false));
          }
        }
      }
      if (this.itemData_ != null && this.itemData_.hasOwnProperty("Effect") && this.itemData_.Effect != "") {
        this._O_Q_.push(new Restriction("Effect: " + this.itemData_.Effect, 0xB3B3B3, false));
      }
      if (this._I_z.hasOwnProperty("Material") && !(this._sJ_ == ObjectLibrary._pb["Crafting Station"])) {
        this._O_Q_.push(new Restriction("Crafting Material", 16549442, true));
      }
      if (this._I_z.hasOwnProperty("Soulbound") || (this.itemData_ != null && this.itemData_.hasOwnProperty("Soulbound") && this.itemData_.Soulbound == true)) {
        this._O_Q_.push(new Restriction("Soulbound", 0xB141FF, false));
      }
    }

    private function initInfo():void {
      var _local2:XML;
      var _local3:Boolean;
      var _local4:int;
      var _local5:int;
      this._Q_O_ = new Vector.<Restriction>();
      var _local6:Boolean = (this.itemData_ != null && this.itemData_.hasOwnProperty("MultiUse") && Boolean(this.itemData_.MultiUse));
      if ((this._I_z.hasOwnProperty("VaultItem") || _local6) && !(this._sJ_ == -1) && !(this._sJ_ == ObjectLibrary._pb["Vault Chest"])) {
        this._Q_O_.push(new Restriction("Store this item in your Vault to avoid losing it!", 16549442, true));
      }
      if (this._I_z.hasOwnProperty("HalloweenItem"))
        this._Q_O_.push(new Restriction("This item is a Halloween special drop!", 0xFFA500, true));
      if (this._0G_J_ && this.meetsLevel) {
        if (this._I_z.hasOwnProperty("Usable")) {
          this.initUse2();
          this.initUse();
        } else {
          if (this._I_z.hasOwnProperty("Consumable") && !_local6) {
            this.initUse3();
          } else {
            if (this._I_z.hasOwnProperty("InvUse") || _local6) {
              this.initUse4();
            } else {
              this.initUse();
            }
          }
        }
      } else {
        if (this.player_ != null) {
          if(!this._0G_J_) {
            this._Q_O_.push(new Restriction(("Not usable by " + ObjectLibrary._0D_N_[this.player_.objectType_]), 16549442, true));
          }
        }
      }
      var _local1:Vector.<String> = ObjectLibrary._7S_(this.objectType_);
      if (_local1 != null) {
        this._Q_O_.push(new Restriction(("Usable by: " + _local1.join(", ")), 0xB3B3B3, false));
      }
      for each (_local2 in this._I_z.EquipRequirement) {
        _local3 = ObjectLibrary._get(_local2, this.player_);
        if (_local2.toString() == "Stat") {
          _local4 = int(_local2.@stat);
          _local5 = int(_local2.@value);
          this._Q_O_.push(new Restriction("Requires " + StatData._W_H_(_local4) + " of " + _local5, (_local3 ? 0xB3B3B3 : 16549442), !_local3));
        }
      }
    }

    private function addElem2():void {
      var _local1:StyleSheet;
      if (this._Q_O_.length != 0) {
        /*this.line2_ = new _return((_be - 12), 0x2D2D2D);
         this.line2_.x = 8;
         this.line2_.y = this._02N_;
         addChild(this.line2_);*/
        _local1 = new StyleSheet();
        _local1.parseCSS(_K_z);
        this._tF_ = new SimpleText(fontSize, 0xB3B3B3, false, (_be - 4), 0, fontName);
        this._tF_.styleSheet = _local1;
        this._tF_.wordWrap = true;
        this._tF_.htmlText = (("<span class='in'>" + _N_W_(this._Q_O_)) + "</span>");
        this._tF_._08S_();
        this._tF_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._tF_.x = 4;
        this._tF_.y = (this.line3_ != null) ? (this.line3_.y + 4) : (this.line2_ != null) ? (this.line2_.y + 4) : (this.line1_ != null) ? (this.line1_.y + 4) : (this.line_ != null) ? (this.line_.y + 4) : 4;
        addChild(this._tF_);
      }
    }

    private function addElem3():void {
      var _local1:StyleSheet;
      if (this._O_Q_.length != 0) {
        _local1 = new StyleSheet();
        _local1.parseCSS(_K_z);
        this._fT_ = new SimpleText(fontSize, 0xB3B3B3, false, (_be - 4), 0, fontName);
        this._fT_.styleSheet = _local1;
        this._fT_.wordWrap = true;
        this._fT_.htmlText = (("<span class='in'>" + _N_W_(this._O_Q_)) + "</span>");
        this._fT_._08S_();
        this._fT_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._fT_.x = 4;
        this._fT_.y = (this.line2_ != null) ? (this.line2_.y + 4) : (this.line1_ != null) ? (this.line1_.y + 4) : (this.line_ != null) ? (this.line_.y + 4) : 4;
        addChild(this._fT_);
      }
    }

    private function initDesc():void {
      this._C_G_ = new SimpleText(fontSize, 0xB3B3B3, false, _be, 0, fontName);
      this._C_G_.wordWrap = true;
      this._C_G_.text = String(this._I_z.Description);
      this._C_G_.updateMetrics();
      this._C_G_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
      this._C_G_.x = 4;
      this._C_G_.y = (this._5U_.y + this._5U_.height);
      addChild(this._C_G_);
    }

    private function initActualName():void {
      this.actualName_ = new SimpleText(fontSize, 0xB3B3B3, false, _be, 0, fontName);
      this.actualName_.setBold(true);
      this.actualName_.wordWrap = true;
      if (this.itemData_ != null && this.itemData_.hasOwnProperty("Name") && this.itemData_.Name != "") {
        this.actualName_.text = ObjectLibrary._0D_N_[this.objectType_];
      } else {
        this.actualName_.text = "";
      }
      this.actualName_.x = 4;
      this.actualName_.y = ((this._C_G_.y + this._C_G_.height) + 8);
      if (this.actualName_.text != "") {
        addChild(this.actualName_);
        //this.addLine(((this.actualName_.y + fontSize) + 8), 1);
      }
    }

    private function initLevel():void {
      this.level_ = new SimpleText(fontSize, 0xB3B3B3, false, _be, 0, fontName);
      this.level_.setBold(true);
      this.level_.wordWrap = true;
      if (this._I_z.hasOwnProperty("LevelReq")) {
        if (String(this._I_z.LevelReq) != "") {
          this.level_.text = "Level Required: " + String(this._I_z.LevelReq);
        } else {
          this.level_.text = "";
        }
      } else {
        this.level_.text = "";
      }
      this.level_.x = 4;
      this.level_.y = (this.actualName_.text != "") ? (this.actualName_.y + this.actualName_.textHeight) : ((this._C_G_.y + this._C_G_.height) + 8);
      if (this.level_.text != "") {
        addChild(this.level_);
        this.addLine(((this.level_.y + fontSize) + 8), 1);
      } else if (this.actualName_.text != "") {
        this.addLine(((this.actualName_.y + fontSize) + 8), 1);
      }
    }

    private function setData():void {
      if (this.curItemXML != null) {
        this._gE_ = this._uW_._hS_(this._I_z, this.curItemXML, this.itemData_, this.curItemData);
      } else {
        this._gE_ = new _R_N_();
      }
    }

    private function _41(_arg1:Vector.<Effect>):String {
      var _local4:Effect;
      var _local5:String;
      var _local2:String = "";
      var _local3:Boolean = true;
      for each (_local4 in _arg1) {
        _local5 = "#FFFF8F";
        if (!_local3) {
          _local2 = (_local2 + "\n");
        } else {
          _local3 = false;
        }
        if (_local4.name_ != "") {
          _local2 = (_local2 + (_local4.name_ + ": "));
        }
        if (this._02c()) {
          _local5 = "#00ff00";
        }
        _local2 = (_local2 + (((('<font color="' + _local5) + '">') + _local4.value_) + "</font>"));
      }
      return (_local2);
    }

  }
}//package _E_7

class Effect {

  public var name_:String;
  public var value_:String;

  public function Effect(_arg1:String, _arg2:String) {
    this.name_ = _arg1;
    this.value_ = _arg2;
  }
}
class Restriction {

  public var text_:String;
  public var color_:uint;
  public var bold_:Boolean;

  public function Restriction(_arg1:String, _arg2:uint, _arg3:Boolean) {
    this.text_ = _arg1;
    this.color_ = _arg2;
    this.bold_ = _arg3;
  }
}

