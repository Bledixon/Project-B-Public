// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._Q_q

package _zD_ {
import _C__._cM_;

import _0L_C_._0D_W_;

import com.company.assembleegameclient.appengine.SavedCharacter;

import _U_5._057;

public class _Q_q extends _cM_ {

    [Inject]
    public var view:_0D_W_;
    [Inject]
    public var character:SavedCharacter;
    [Inject]
    public var deleteCharacter:_057;

    override public function initialize():void {
        this.view.deleteCharacter.add(this._pk);
        this.view.cancel.add(this._09m);
        this.view._02C_(this.character.name(), this.character._jp());
    }

    override public function destroy():void {
        this.view.deleteCharacter.add(this._pk);
        this.view.cancel.add(this._09m);
    }

    private function _09m():void {
        this.view.parent.removeChild(this.view);
    }

    private function _pk():void {
        this._09m();
        this.deleteCharacter.dispatch(this.character);
    }

}
}//package _zD_

