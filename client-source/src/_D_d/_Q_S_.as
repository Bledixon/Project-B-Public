// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._Q_S_

package _D_d {
import _D_d._P_u;

import flash.display.Shape;
import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;

import flash.geom.Rectangle;

import com.company.assembleegameclient.map._pf;

import flash.display.BitmapData;

import com.company.assembleegameclient.map._ik;
import com.company.assembleegameclient.map._M_X_;

import _D_d._0E_2;

import _E_7._for_;

import _D_d.*;

internal class _Q_S_ extends _P_u {

    private static const _J_c:Vector.<Number> = new <Number>[0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0];
    private static const _0L_L_:Number = 0.6;

    public function _Q_S_(_arg1:XML) {
        super(int(_arg1.@type));
        this._5b = _arg1;
        var _local2:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();
        var _local3:_0D_v = new _0D_v();
        _local3._K_(0.5, 0.5, 12, (Math.PI / 4), new Rectangle(-100, -100, 200, 200), false);
        var _local4:BitmapData = _pf.getBitmapData(type_);
        var _local5:_ik = new _ik(_local4, _J_c, 0, 0, _M_X_._0I_7, 0, 0);
        _local5.draw(_local2, _local3, 0);
        this._G_m = new Shape();
        this._G_m.graphics.drawGraphicsData(_local2);
        this._G_m.scaleX = (this._G_m.scaleY = _0L_L_);
        this._G_m.x = (WIDTH / 2);
        this._G_m.y = (HEIGHT / 2);
        addChild(this._G_m);
    }
    public var _5b:XML;
    private var _G_m:Shape;

    override protected function getToolTip():_for_ {
        return (new _0E_2(this._5b));
    }

}
}//package _D_d

