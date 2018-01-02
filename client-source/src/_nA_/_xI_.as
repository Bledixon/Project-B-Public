package _nA_ {

  import UpdateFrame.UpdatePanel;

  import _0L_C_._qO_;

  import _E_7._aS_;

  import _F_1._C_Q_;

  import _G_A_._8P_;

  import _O_6._xd;

  import _panels.Panel;

  import _U_5._01W_;

import _qN_.Account;

import _vf._5T_;

  import air.net.URLMonitor;

  import com.company.assembleegameclient.game.GameSprite;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;

import flash.display.Bitmap;

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.net.navigateToURL;

public class _xI_ extends Sprite {

    private var file_:String = "lofiInterface2";
    private var index_:int;

    public static const WIDTH:int = 280;
    public static const HEIGH:int = 185;

    private var icon_:Bitmap;
    private var background_:Sprite;
    private var image_:BitmapData;
    private var text_:SimpleText;
    private var useImg_:Boolean;
    private var _xd_:_aS_ = new _aS_(0x2A2A2A, 0x9B9B9B, "Halloween Raid", "To access it simply type /raid hw!", 200);

    private var action_:String;
    private var actions:Array = ['UPDATE', 'DONATE', 'DISCORD', 'RAID'];

    public function _xI_(_arg1:Boolean=true, _arg2:int=15, _arg3:String="Updates", _arg4:String="UPDATE", _arg5:int=0xFFFFFF, _arg6:int=89) {
        this.useImg_ = _arg1;
        this.index_ = _arg2;
        if (this.useImg_) {
            this.image_ = TextureRedrawer.redraw(AssetLibrary._xK_(file_, index_), 40, true, 0, 0);
            this.icon_ = new Bitmap(this.image_);
            this.icon_.x = -5;
            this.icon_.y = -8;
        }
        this.background_ = _eX_1_._c9_9(_arg6);
        this.background_.mouseChildren = false;
        this.background_.mouseEnabled = true;
        this.text_ = new SimpleText(16, _arg5, false, 0, 0, "Myriad Pro");
        this.text_.text = _arg3;
        this.text_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        this.draw();
        this.text_.x = this.useImg_ ? 28 : 10;
        this.text_.y = 3;
        this.action_ = _arg4.toUpperCase();
        this.background_.addEventListener(MouseEvent.CLICK, this.openUI);
        this.background_.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        this.background_.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
    }
    public function openUI(_arg1:MouseEvent):void {
        switch (this.action_) {
          case actions[0]:
                break;
            case actions[1]:
                navigateToURL(new URLRequest("http://bledixon.com/donate"));
                break;
            case actions[2]:
                navigateToURL(new URLRequest("https://discord.gg/kUBTYRm"));
                break;
            case actions[3]:
                break;
            default:
            break;
        }
        _5T_.play("button_click");
    }
    private function onMouseOver(_arg1:MouseEvent):void {
      stage.addChild(_xd_);
    }
    private function onMouseOut(_arg1:MouseEvent):void {
      stage.removeChild(_xd_);
    }
    public function draw():void{
        addChild(this.background_);
        addChild(this.text_);
        if (this.useImg_)
            addChild(this.icon_);
    }
}
}
