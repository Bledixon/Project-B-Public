// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util.loadEmbeds

package com.company.assembleegameclient.util {
  import _vf._5T_;
  import _vf._Q_P_;
  import _vf._str434;
  import com.company.assembleegameclient.engine3d._B_5;
  import com.company.assembleegameclient.map._pf;
  import com.company.assembleegameclient.map._sn;
  import com.company.assembleegameclient.objects.ObjectLibrary;
  import com.company.assembleegameclient.parameters.Parameters;
  import com.company.util.AssetLibrary;
  import com.company.util._str437;

  import flash.display.BitmapData;
  import flash.utils.ByteArray;

  import zerorealms.rotmg.assets.AssetEmbeds;
  import zerorealms.rotmg.assets.DataEmbeds;
  import _0C_P_.Options;

  public class loadEmbeds {
    public var _str8553:_str434;

    public function loadEmbeds() {
      this._str8553 = new _str437();
      super();
    }

    public function load():void {
      this.initFile();
      this.initIndex();
      this.initAudio();
      this.initModels();
      this.initParticles();
      this.initTiles();
      this.initObjects();
      this.initRegions();
      Parameters.load();
      Options.refreshCursor();
      this._str8553.load();
      _Q_P_.load();
    }

    private function initFile():void{
      AssetLibrary._05q("lofiChar8x8", new AssetEmbeds.lofiCharEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiChar16x8", new AssetEmbeds.lofiCharEmbed_().bitmapData, 16, 8);
      AssetLibrary._05q("lofiChar16x16", new AssetEmbeds.lofiCharEmbed_().bitmapData, 16, 16);
      AssetLibrary._05q("lofiChar28x8", new AssetEmbeds.lofiChar2Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiChar216x8", new AssetEmbeds.lofiChar2Embed_().bitmapData, 16, 8);
      AssetLibrary._05q("lofiChar216x16", new AssetEmbeds.lofiChar2Embed_().bitmapData, 16, 16);
      AssetLibrary._05q("lofiCharBig", new AssetEmbeds.lofiCharBigEmbed_().bitmapData, 16, 16);
      AssetLibrary._05q("lofiEnvironment", new AssetEmbeds.lofiEnvironmentEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiEnvironment2", new AssetEmbeds.lofiEnvironment2Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiEnvironment3", new AssetEmbeds.lofiEnvironment3Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiInterface", new AssetEmbeds.lofiInterfaceEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("redLootBag", new AssetEmbeds.redLootBagEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiInterfaceBig", new AssetEmbeds.lofiInterfaceBigEmbed_().bitmapData, 32, 32);
      AssetLibrary._05q("lofiInterface2", new AssetEmbeds.lofiInterface2Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiObj", new AssetEmbeds.lofiObjEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiObj2", new AssetEmbeds.lofiObj2Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiObj3", new AssetEmbeds.lofiObj3Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiObj4", new AssetEmbeds.lofiObj4Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiObj5", new AssetEmbeds.lofiObj5Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiObj6", new AssetEmbeds.lofiObj6Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiObjBig", new AssetEmbeds.lofiObjBigEmbed_().bitmapData, 16, 16);
      AssetLibrary._05q("lofiObj40x40", new AssetEmbeds.lofiObj40x40Embed_().bitmapData, 40, 40);
      AssetLibrary._05q("lofiProjs", new AssetEmbeds.lofiProjsEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("lofiProjsBig", new AssetEmbeds.lofiProjsBigEmbed_().bitmapData, 16, 16);
      AssetLibrary._05q("lofiParts", new AssetEmbeds.lofiPartsEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("stars", new AssetEmbeds.starsEmbed_().bitmapData, 5, 5);
      AssetLibrary._05q("rain", new AssetEmbeds.rainEmbed_().bitmapData, 5, 5);
      AssetLibrary._05q("lava", new AssetEmbeds.lavaEmbed_().bitmapData, 5, 5);
      AssetLibrary._05q("ghosts", new AssetEmbeds.ghostsEmbed_().bitmapData, 16, 16);
      AssetLibrary._05q("textile4x4", new AssetEmbeds.textile4x4Embed_().bitmapData, 4, 4);
      AssetLibrary._05q("textile5x5", new AssetEmbeds.textile5x5Embed_().bitmapData, 5, 5);
      AssetLibrary._05q("textile9x9", new AssetEmbeds.textile9x9Embed_().bitmapData, 9, 9);
      AssetLibrary._05q("textile10x10", new AssetEmbeds.textile10x10Embed_().bitmapData, 10, 10);
      AssetLibrary._05q("inner_mask", new AssetEmbeds.innerMaskEmbed_().bitmapData, 4, 4);
      AssetLibrary._05q("sides_mask", new AssetEmbeds.sidesMaskEmbed_().bitmapData, 4, 4);
      AssetLibrary._05q("outer_mask", new AssetEmbeds.outerMaskEmbed_().bitmapData, 4, 4);
      AssetLibrary._05q("innerP1_mask", new AssetEmbeds.innerP1MaskEmbed_().bitmapData, 4, 4);
      AssetLibrary._05q("innerP2_mask", new AssetEmbeds.innerP2MaskEmbed_().bitmapData, 4, 4);
      AssetLibrary._05q("extraEnvironment", new AssetEmbeds.extraEnvironmentEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("portals8x8", new AssetEmbeds.portals8x8Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("essences", new AssetEmbeds.essencesEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("HalloweenEffects16x16", new AssetEmbeds.HalloweenEffects16x16Embed_().bitmapData, 16, 16);
      AssetLibrary._05q("customEffects16x16", new AssetEmbeds.customEffects16x16Embed_().bitmapData, 16, 16);
      AssetLibrary._05q("customEffects8x8", new AssetEmbeds.customEffects8x8Embed_().bitmapData, 8, 8);
      AssetLibrary._05q("invisible", new BitmapData(8, 8, true, 0), 8, 8);
      AssetLibrary._05q("animatedWeapoTest", new AssetEmbeds.animatedWeapoTestEmbed_().bitmapData, 8, 8);
      AssetLibrary._05q("customitems", new AssetEmbeds.customitems_().bitmapData, 8, 8);
      AssetLibrary._05q("cursorsEmbed", new AssetEmbeds.cursorsEmbed_().bitmapData, 32, 32);
    }
    private function initIndex():void{
      _0B_c.add("chars8x8rBeach", new AssetEmbeds.chars8x8rBeachEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8dBeach", new AssetEmbeds.chars8x8dBeachEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.DOWN);
      _0B_c.add("chars8x8rLow1", new AssetEmbeds.chars8x8rLow1Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8rLow2", new AssetEmbeds.chars8x8rLow2Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8rMid", new AssetEmbeds.chars8x8rMidEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8rMid2", new AssetEmbeds.chars8x8rMid2Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8rHigh", new AssetEmbeds.chars8x8rHighEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8rHero1", new AssetEmbeds.chars8x8rHero1Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8rHero2", new AssetEmbeds.chars8x8rHero2Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars8x8dHero1", new AssetEmbeds.chars8x8dHero1Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.DOWN);
      _0B_c.add("chars16x16dMountains1", new AssetEmbeds.chars16x16dMountains1Embed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
      _0B_c.add("chars16x16dMountains2", new AssetEmbeds.chars16x16dMountains2Embed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
      _0B_c.add("chars8x8dEncounters", new AssetEmbeds.chars8x8dEncountersEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.DOWN);
      _0B_c.add("chars8x8rEncounters", new AssetEmbeds.chars8x8rEncountersEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
      _0B_c.add("chars16x8dEncounters", new AssetEmbeds.chars16x8dEncountersEmbed_().bitmapData, null, 16, 8, 112, 8, _lJ_.DOWN);
      _0B_c.add("chars16x8rEncounters", new AssetEmbeds.chars16x8rEncountersEmbed_().bitmapData, null, 16, 8, 112, 8, _lJ_.DOWN);
      _0B_c.add("chars16x16dEncounters", new AssetEmbeds.chars16x16dEncountersEmbed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
      _0B_c.add("chars16x16dEncounters2", new AssetEmbeds.chars16x16dEncounters2Embed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
      _0B_c.add("chars16x16rEncounters", new AssetEmbeds.chars16x16rEncountersEmbed_().bitmapData, null, 16, 16, 112, 16, _lJ_.RIGHT);
      _0B_c.add("chars16x16custom", new AssetEmbeds.chars16x16customEmbed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
      _0B_c.add("custom16x16", new AssetEmbeds.custom16x16Embed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
      _0B_c.add("players", new AssetEmbeds.playersEmbed_().bitmapData, new AssetEmbeds.playersMaskEmbed_().bitmapData, 8, 8, 56, 24, _lJ_.RIGHT);
      _0B_c.add("playerskins", new AssetEmbeds.playerSkinsEmbed_().bitmapData, new AssetEmbeds.playerSkinsMaskEmbed_().bitmapData, 8, 8, 56, 24, _lJ_.RIGHT);
      _0B_c.add("playerskins16x16", new AssetEmbeds.playerSkins16x16Embed_().bitmapData, new AssetEmbeds.playerSkins16x16MaskEmbed_().bitmapData, 16, 16, 112, 48, _lJ_.RIGHT);
      _0B_c.add("playerskins32x32", new AssetEmbeds.playerSkins32x32Embed_().bitmapData, new AssetEmbeds.playerSkins32x32MaskEmbed_().bitmapData, 32, 32, 224, 32, _lJ_.RIGHT);
      _0B_c.add("chars8x8rPets1", new AssetEmbeds.chars8x8rPets1Embed_().bitmapData, new AssetEmbeds.chars8x8rPets1MaskEmbed_().bitmapData, 8, 8, 56, 8, _lJ_.RIGHT);
    }
    private function initAudio():void{
      _5T_.load("button_click");
      _5T_.load("death_screen");
      _5T_.load("enter_realm");
      _5T_.load("error");
      _5T_.load("inventory_move_item");
      _5T_.load("level_up");
      _5T_.load("loot_appears");
      _5T_.load("no_mana");
      _5T_.load("use_key");
      _5T_.load("use_potion");
    }
    private function initModels():void{
      var _local1:String;
      var _local2:ByteArray;
      var _local3:String;
      for (_local1 in AssetEmbeds.models_) {
        _local2 = AssetEmbeds.models_[_local1];
        _local3 = _local2.readUTFBytes(_local2.length);
        _B_5._08y(_local1, _local3);
      }
    }
    private function initParticles():void{
      var _local1:XML = XML(new AssetEmbeds.particlesEmbed_());
      _pf._nY_(_local1);
    }
    private function initTiles():void{
      var _local1:*;
      for each (_local1 in DataEmbeds._R_k) {
        _pf._nY_(XML(_local1));
      }
    }
    private function initObjects():void{
      var _local1:*;
      for each (_local1 in DataEmbeds._use) {
        ObjectLibrary._nY_(XML(_local1));
      }
    }
    private function initRegions():void{
      var _local1:*;
      for each (_local1 in DataEmbeds._l5) {
        _sn._nY_(XML(_local1));
      }
    }
  }
}