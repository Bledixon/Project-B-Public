package com.company.assembleegameclient.util {
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;
import flash.events.Event;
import flash.events.IEventDispatcher;

    public class Dispatcher implements IEventDispatcher {

        //private static var stage3D:_SafeStr_426 = null;

        protected var display_:DisplayObject;

        public function Dispatcher(_arg_1:DisplayObject){
            this.display_ = _arg_1;
        }
        public function getStage():DisplayObjectContainer{
            return (this.display_.stage);
        }
        public function getStageWidth():Number{
            return (this.display_.stage.stageWidth);
        }
        public function getStageHeight():Number{
            return (this.display_.stage.stageHeight);
        }
        public function getStageFocus():InteractiveObject{
            return (this.display_.stage.focus);
        }
        public function getStageQuality():String{
            return (this.display_.stage.quality);
        }
        public function setFocus(_arg_1:InteractiveObject):void{
            this.display_.stage.focus = _arg_1;
        }
        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void{
            this.display_.stage.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }
        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void{
            this.display_.stage.removeEventListener(_arg_1, _arg_2, _arg_3);
        }
        public function dispatchEvent(_arg_1:Event):Boolean{
            return (this.display_.stage.dispatchEvent(_arg_1));
        }
        public function hasEventListener(_arg_1:String):Boolean{
            return (this.display_.stage.hasEventListener(_arg_1));
        }
        public function willTrigger(_arg_1:String):Boolean{
            return (this.display_.stage.willTrigger(_arg_1));
        }
        public function setStageQuality(_arg_1:String):void{
            this.display_.stage.quality = _arg_1;
        }
        /*public function getStage3Ds(_arg_1:int):_SafeStr_426{
            if (stage3D == null){
                stage3D = new _SafeStr_426(this.display_.stage.stage3Ds[_arg_1]);
            };
            return (stage3D);
        }*/
    }
}
