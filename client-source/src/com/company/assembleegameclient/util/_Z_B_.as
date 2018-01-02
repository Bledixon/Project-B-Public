// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util._Z_B_

package com.company.assembleegameclient.util {

import flash.geom.ColorTransform;

import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.objects.ObjectLibrary;

import flash.display.Sprite;
import flash.filters.DropShadowFilter;

import com.company.rotmg.graphics.StarGraphic;
import com.company.util.AssetLibrary;

import flash.display.BitmapData;


public class _Z_B_ {

    public static const _yJ_:Vector.<int> = new <int>[20, 150, 400, 800, 2000, 6500];
    private static const _09M_:ColorTransform = new ColorTransform((138 / 0xFF), (152 / 0xFF), (222 / 0xFF));
    private static const _03U_:ColorTransform = new ColorTransform((49 / 0xFF), (77 / 0xFF), (219 / 0xFF));
    private static const _A_k:ColorTransform = new ColorTransform((193 / 0xFF), (39 / 0xFF), (45 / 0xFF));
    private static const _tX_:ColorTransform = new ColorTransform((247 / 0xFF), (147 / 0xFF), (30 / 0xFF));
    private static const _O_G_:ColorTransform = new ColorTransform((0xFF / 0xFF), (0xFF / 0xFF), (0 / 0xFF));
    private static const _eD_:ColorTransform = new ColorTransform();
    public static const _n0:Vector.<ColorTransform> = new <ColorTransform>[_09M_, _03U_, _A_k, _tX_, _O_G_, _eD_];

    public static function _5e():int {
        return ((ObjectLibrary._tj.length * _yJ_.length));
    }

    public static function _lr(_arg1:int):int {
        var _local2:int;
        while ((((_local2 < _yJ_.length)) && ((_arg1 >= _yJ_[_local2])))) {
            _local2++;
        }
        return (_local2);
    }

    public static function _F_U_(_arg1:int, _arg2:int):int {
        var _local3:int = Math.max(_arg1, _arg2);
        var _local4:int;
        while (_local4 < _yJ_.length) {
            if (_yJ_[_local4] > _local3) {
                return (_yJ_[_local4]);
            }
            _local4++;
        }
        return (-1);
    }

    public static function _bl(_arg1:int):Sprite {
        var _local2:Sprite = _03A_(_arg1);
        _local2.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        _local2.scaleX = 1.4;
        _local2.scaleY = 1.4;
        return (_local2);
    }

    public static function _03A_(_arg1:int):Sprite {
        var _local2:Sprite = new StarGraphic();
        if (_arg1 < ObjectLibrary._tj.length) {
            _local2.transform.colorTransform = _09M_;
        } else {
            if (_arg1 < (ObjectLibrary._tj.length * 2)) {
                _local2.transform.colorTransform = _03U_;
            } else {
                if (_arg1 < (ObjectLibrary._tj.length * 3)) {
                    _local2.transform.colorTransform = _A_k;
                } else {
                    if (_arg1 < (ObjectLibrary._tj.length * 4)) {
                        _local2.transform.colorTransform = _tX_;
                    } else {
                        if (_arg1 < (ObjectLibrary._tj.length * 5)) {
                            _local2.transform.colorTransform = _O_G_;
                        } else {
                            if (_arg1 < (ObjectLibrary._tj.length * 6)) {
                                _local2.transform.colorTransform = _eD_;
                            } else {
                                    _local2.transform.colorTransform = new ColorTransform((0xFF / 0xFF), (0 / 0xFF), (0xFF / 0xFF));
                                }
                            }
                        }
                    }
                }
            }
        return (_local2);
    }

    public static function _0M_r(_arg1:int):Sprite {
        var _local2:Sprite;
        _local2 = _03A_(_arg1);
        var _local3:Sprite = new Sprite();
        _local3.graphics.beginFill(0, 0.4);
        var _local4:int = ((_local2.width / 2) + 2);
        var _local5:int = ((_local2.height / 2) + 2);
        _local3.graphics.drawCircle(_local4, _local5, _local4);
        _local2.x = 2;
        _local2.y = 1;
        _local3.addChild(_local2);
        _local3.filters = [new DropShadowFilter(0, 0, 0, 0.5, 6, 6, 1)];
        return (_local3);
    }

    public static function _qf():BitmapData {
        var _local1:BitmapData = AssetLibrary._xK_("lofiObj3", 224);
        return (TextureRedrawer.redraw(_local1, 40, true, 0, 0));
    }

}
}//package com.company.assembleegameclient.util

