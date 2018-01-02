// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._vi

package com.company.assembleegameclient.ui {
    import com.company.assembleegameclient.objects.Player;
    import flash.text.engine.ElementFormat;
import flash.text.engine.FontDescription;
import flash.text.engine.FontWeight;
import flash.text.engine.FontPosture;
import flash.text.engine.FontLookup;
import flash.text.engine.RenderingMode;
import flash.text.engine.CFFHinting;

public class _vi {

    public function _vi() {
        this.TextColour = this._yz();
        this.TextColour.color = 0xFF0000;
        this.TextColour.color = 0xFFFFFF;
        this.InfoColour = this._yz();
        this.InfoColour.color = 0xFFFF00;
        this.ClientColour = this._yz();
        this.ClientColour.color = 0xFF;
        this.HelpColour = this._yz();
        this.HelpColour.color = 16734981;
        this.ErrorColour = this._yz();
        this.ErrorColour.color = 0xFF0000;
        this.AdminColour = this._yz();
        this.AdminColour.color = 0xFFFFFF;
        this.BledixonColour = this._yz();
        this.BledixonColour.color = 0xFF00FF;
        this.EnemyColour = this._yz();
        this.EnemyColour.color = 0xFFA800;
        this.PlayerColour = this._yz();
        this.PlayerColour.color = 0xFF00;
        this._cK_ = this._yz();
        this._cK_.color = 0x363636;
        this.TellColour = this._yz();
        this.TellColour.color = 0x00F0FF;
        this.GuildColour = this._yz();
        this.GuildColour.color = 0xA6FF5D;
        this.PartyNameColour = this._yz();
        this.PartyNameColour.color = 0x7474F7;
        this.PartyTextColour = this._yz();
        this.PartyTextColour.color = 0xABABF4;
    }
    public var TextColour:ElementFormat = null;
    public var InfoColour:ElementFormat = null;
    public var ClientColour:ElementFormat = null;
    public var HelpColour:ElementFormat = null;
    public var ErrorColour:ElementFormat = null;
    public var AdminColour:ElementFormat = null;
    public var BledixonColour:ElementFormat = null;
    public var EnemyColour:ElementFormat = null;
    public var PlayerColour:ElementFormat = null;
    public var _cK_:ElementFormat = null;
    public var TellColour:ElementFormat = null;
    public var GuildColour:ElementFormat = null;
    public var PartyNameColour:ElementFormat = null;
    public var PartyTextColour:ElementFormat = null;

    private function _yz():ElementFormat {
        var _local1:ElementFormat = new ElementFormat();
        var _T_s:String = "MyriadProCFF,_sans";
        _local1.fontDescription = new FontDescription(_T_s, FontWeight.BOLD, FontPosture.NORMAL, FontLookup.EMBEDDED_CFF, RenderingMode.CFF, CFFHinting.HORIZONTAL_STEM);
        _local1.fontSize = 13;
        return (_local1);
    }

    public static function createColor(color:uint):ElementFormat {
        var _local1:ElementFormat = new ElementFormat();
        var _T_s:String = "MyriadProCFF,_sans";
        _local1.fontDescription = new FontDescription(_T_s, FontWeight.BOLD, FontPosture.NORMAL, FontLookup.EMBEDDED_CFF, RenderingMode.CFF, CFFHinting.HORIZONTAL_STEM);
        _local1.fontSize = 14;
        _local1.color = color;
        return _local1;
    }

}
}//package com.company.assembleegameclient.ui

