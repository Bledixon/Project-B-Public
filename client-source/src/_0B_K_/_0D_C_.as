// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0B_K_._0D_C_

package _0B_K_ {
import flash.utils.describeType;

import _0J_k._Q_m;

import flash.utils.Dictionary;

import _0J_k._00m;
import _0J_k._N_D_;
import _0J_k._0J_f;
import _0J_k._Z_T_;
import _0J_k._kG_;
import _0J_k._tv;

import _eZ_._N_p;

import flash.utils.*;

public class _0D_C_ extends _try implements _0I_q {

    private var _yb:XML;

    public function _G_0(cls:Class, superType:Class):Boolean {
        if (cls == superType) {
            return (true);
        }
        var factoryDescription:XML = describeType(cls).factory[0];
        return ((factoryDescription.children().(((name() == "implementsInterface")) || ((name() == "extendsClass"))).(attribute("type") == getQualifiedClassName(superType)).length() > 0));
    }

    public function _s4(_arg1:Class):_Q_m {
        this._yb = describeType(_arg1).factory[0];
        var _local2:_Q_m = new _Q_m(false);
        this._D_e(_local2, _arg1);
        this._06Z_(_local2);
        this._zc(_local2);
        this._X_J_(_local2);
        this._D_3(_local2);
        this._yb = null;
        return (_local2);
    }

    private function _D_e(description:_Q_m, cls:Class):void {
        var injectParameters:Dictionary;
        var parameters:Array;
        var node:XML = this._yb.constructor[0];
        if (!node) {
            if ((((this._yb.parent().@name == "Object")) || ((this._yb.extendsClass.length() > 0)))) {
                description.ctor = new _00m();
            }
            return;
        }
        injectParameters = this._0E_p(node.parent().metadata.arg);
        var parameterNames:Array = ((injectParameters.name) || ("")).split(",");
        var parameterNodes:XMLList = node.parameter;
        if (parameterNodes.(@type == "*").length() == parameterNodes.@type.length()) {
            this._0B_J_(node, cls);
        }
        parameters = this._R_w(parameterNodes, parameterNames);
        var requiredParameters:uint = parameters.required;
        delete parameters.required;
        description.ctor = new _N_D_(parameters, requiredParameters, injectParameters);
    }

    private function _0E_p(_arg1:XMLList):Dictionary {
        var _local5:XML;
        var _local6:String;
        var _local2:Dictionary = new Dictionary();
        var _local3:uint = _arg1.length();
        var _local4:int;
        while (_local4 < _local3) {
            _local5 = _arg1[_local4];
            _local6 = _local5.@key;
            _local2[_local6] = ((_local2[_local6]) ? ((_local2[_local6] + ",") + _local5.attribute("value")) : _local5.attribute("value"));
            _local4++;
        }
        return (_local2);
    }

    private function _06Z_(description:_Q_m):void {
        var node:XML;
        var mappingId:String;
        var propertyName:String;
        var injectParameters:Dictionary;
        var injectionPoint:_0J_f;
        for each (node in this._yb.*.(((name() == "variable")) || ((name() == "accessor"))).metadata.(@name == "Inject")) {
            mappingId = ((node.parent().@type + "|") + node.arg.(@key == "name").attribute("value"));
            propertyName = node.parent().@name;
            injectParameters = this._0E_p(node.arg);
            injectionPoint = new _0J_f(mappingId, propertyName, (injectParameters.optional == "true"), injectParameters);
            description._ph(injectionPoint);
        }
    }

    private function _zc(description:_Q_m):void {
        var node:XML;
        var injectParameters:Dictionary;
        var parameterNames:Array;
        var parameters:Array;
        var requiredParameters:uint;
        var injectionPoint:_Z_T_;
        for each (node in this._yb.method.metadata.(@name == "Inject")) {
            injectParameters = this._0E_p(node.arg);
            parameterNames = ((injectParameters.name) || ("")).split(",");
            parameters = this._R_w(node.parent().parameter, parameterNames);
            requiredParameters = parameters.required;
            delete parameters.required;
            injectionPoint = new _Z_T_(node.parent().@name, parameters, requiredParameters, (injectParameters.optional == "true"), injectParameters);
            description._ph(injectionPoint);
        }
    }

    private function _X_J_(_arg1:_Q_m):void {
        var _local2:Array = this._0K_w(_kG_, "PostConstruct");
        var _local3:int;
        var _local4:int = _local2.length;
        while (_local3 < _local4) {
            _arg1._ph(_local2[_local3]);
            _local3++;
        }
    }

    private function _D_3(_arg1:_Q_m):void {
        var _local2:Array = this._0K_w(_tv, "PreDestroy");
        if (!_local2.length) {
            return;
        }
        _arg1.__case = _local2[0];
        _arg1.__case._jO_ = _local2[0];
        var _local3:int = 1;
        var _local4:int = _local2.length;
        while (_local3 < _local4) {
            _arg1.__case._jO_.next = _local2[_local3];
            _arg1.__case._jO_ = _local2[_local3];
            _local3++;
        }
    }

    private function _R_w(_arg1:XMLList, _arg2:Array):Array {
        var _local4:uint;
        var _local7:XML;
        var _local8:String;
        var _local9:String;
        var _local10:Boolean;
        var _local3:uint;
        _local4 = _arg1.length();
        var _local5:Array = new Array(_local4);
        var _local6:int;
        while (_local6 < _local4) {
            _local7 = _arg1[_local6];
            _local8 = ((_arg2[_local6]) || (""));
            _local9 = _local7.@type;
            _local10 = (_local7.@optional == "true");
            if (_local9 == "*") {
                if (!_local10) {
                    throw (new _N_p((('Error in method definition of injectee "' + this._yb.@type) + "Required parameters can't have type \"*\".")));
                }
                _local9 = null;
            }
            if (!_local10) {
                _local3++;
            }
            _local5[_local6] = ((_local9 + "|") + _local8);
            _local6++;
        }
        _local5.required = _local3;
        return (_local5);
    }

    private function _0K_w(injectionPointType:Class, tag:String):Array {
        var node:XML;
        var injectParameters:Dictionary;
        var parameterNames:Array;
        var parameters:Array;
        var requiredParameters:uint;
        var order:Number;
        var injectionPoints:Array = [];
        for each (node in this._yb..metadata.(@name == tag)) {
            injectParameters = this._0E_p(node.arg);
            parameterNames = ((injectParameters.name) || ("")).split(",");
            parameters = this._R_w(node.parent().parameter, parameterNames);
            requiredParameters = parameters.required;
            delete parameters.required;
            order = parseInt(node.arg.(@key == "order").@value);
            injectionPoints.push(new (injectionPointType)(node.parent().@name, parameters, requiredParameters, ((isNaN(order)) ? int.MAX_VALUE : order)));
        }
        if (injectionPoints.length > 0) {
            injectionPoints.sortOn("order", Array.NUMERIC);
        }
        return (injectionPoints);
    }

    private function _0B_J_(constructorNode:XML, clazz:Class):void {
        try {
            switch (constructorNode.children().length()) {
                case 0:
                    new (clazz)();
                    break;
                case 1:
                    new (clazz)(null);
                    break;
                case 2:
                    new (clazz)(null, null);
                    break;
                case 3:
                    new (clazz)(null, null, null);
                    break;
                case 4:
                    new (clazz)(null, null, null, null);
                    break;
                case 5:
                    new (clazz)(null, null, null, null, null);
                    break;
                case 6:
                    new (clazz)(null, null, null, null, null, null);
                    break;
                case 7:
                    new (clazz)(null, null, null, null, null, null, null);
                    break;
                case 8:
                    new (clazz)(null, null, null, null, null, null, null, null);
                    break;
                case 9:
                    new (clazz)(null, null, null, null, null, null, null, null, null);
                    break;
                case 10:
                    new (clazz)(null, null, null, null, null, null, null, null, null, null);
                    break;
            }
        } catch (error:Error) {
            trace(((((("Exception caught while trying to create dummy instance for constructor " + "injection. It's almost certainly ok to ignore this exception, but you ") + "might want to restructure your constructor to prevent errors from ") + "happening. See the Swiftsuspenders documentation for more details.\n") + "The caught exception was:\n") + error));
        }
        constructorNode.setChildren(describeType(clazz).factory.constructor[0].children());
    }

}
}//package _0B_K_

