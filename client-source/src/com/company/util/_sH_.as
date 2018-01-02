// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._sH_

package com.company.util {
import flash.xml.XMLDocument;
import flash.xml.XMLNode;
import flash.xml.XMLNodeType;

public class _sH_ {

    public static function unescape(_arg1:String):String {
        return (new XMLDocument(_arg1).firstChild.nodeValue);
    }

    public static function _M_6(_arg1:String):String {
        return (XML(new XMLNode(XMLNodeType.TEXT_NODE, _arg1)).toXMLString());
    }

}
}//package com.company.util

