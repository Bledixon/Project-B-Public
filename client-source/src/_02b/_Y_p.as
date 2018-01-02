// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_02b._Y_p

package _02b {
import _4X_._zU_;

import com.company.assembleegameclient.appengine._0B_u;
import com.company.util._str954;

import flash.utils.Timer;

import com.company.assembleegameclient.parameters.Parameters;

import _zo._8C_;
import _zo._mS_;

import flash.events.TimerEvent;

import mx.formatters.DateFormatter;

public class _Y_p extends _zU_ {

    public var accountId:int;
    public var charId:int;
    public var xml:XML;
    public var name:String;
    public var level:int;
    public var _type:int;
    public var _0N__:String;
    public var _pp:String;
    public var _P_9:int;
    public var character:XML;
    private var _01S_:_0B_u;
    private var _Z_w:Timer;

    override protected function startTask():void {
        this._zB_();
    }

    private function _zB_():void {
        this._01S_ = new _0B_u(Parameters._fK_(), "/char", true);
        this._01S_.addEventListener(_8C_.GENERIC_DATA, this._00C_);
        this._01S_.addEventListener(_mS_.TEXT_ERROR, this._C_I_);
        this._01S_.sendRequest("fame", this._2N_());
    }

    private function _2N_():Object {
        var _local1:Object = {};
        _local1.accountId = this.accountId;
        _local1.charId = (((this.accountId == -1)) ? -1 : this.charId);
        return (_local1);
    }

    private function _7N_():void {
        this.character = this.xml.Char.(@id == charId)[0];
        this.name = this.character.Account.Name;
        this.level = this.character.Level;
        this._type = this.character.ObjectType;
        this._0N__ = this._H_p();
        this._pp = (this.xml.KilledBy) || ("");
        this._P_9 = this.xml.TotalFame;
    }

    private function _eG_():void {
        this._01S_.removeEventListener(_8C_.GENERIC_DATA, this._00C_);
        this._01S_.removeEventListener(_mS_.TEXT_ERROR, this._C_I_);
        this._01S_ = null;
    }

    private function _H_p():String {
        var _local1:Number = Number(this.xml.CreatedOn) * 1000;
        var _local2:Date = new Date(_local1);
        var _local3:_str954 = new _str954();
        _local3._str4106 = "MMMM D, YYYY";
        return _local3.format(_local2);
    }

    private function _00C_(_arg1:_8C_):void {
        this.xml = new XML(_arg1.data_);
        this._7N_();
        this._eG_();
        _C_t(true);
    }

    private function _C_I_(_arg1:_mS_):void {
        this._eG_();
        this._Z_w = new Timer(1000, 1);
        this._Z_w.addEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w.start();
    }

    private function _F_z(_arg1:TimerEvent):void {
        this._Z_w.removeEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w = null;
        this._zB_();
    }

}
}//package _02b

