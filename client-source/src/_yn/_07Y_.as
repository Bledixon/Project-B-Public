package _yn {
public class _07Y_ {

    internal static const string:Array = [
        [311666135, -1457012600, 1552169150, 1761191443, 1317508674, 776738430, -1588178005, 2029631727, 1338972486, -1620444119, -1672367595, 292871495, 1709420458, -1341532070, -326175999, 1170165485, 1041343832, -1739450444, 86835192, -125443488, 124298107, -1950121449, -1071334808, 1777136119],
        [1223547426, 762788121, 539506893, 558537430, -1337053415, -1980376921, -1842993949, -1535713587, -1843842466, 259163649, 84883348, 134678728, -1806385275, -462877814, 629882654, 1428761042, 1941445202, 1892194447, 1719792257, -1038147660, -387118588, -1208698572, -1748832475, -1307519590, 1404560975, -1027492309, -186894239, 138167820]
    ];
    internal static const key:Array = [
        [-2092417980, -1030642233, 816173022, 924850519],
        [1308192631, 1658084656, 1258542666, -1098201067]
    ];

    public static function decrypt(_arg1:int, _arg2:int):String {
        var _local3:String;
        var _local4:int;
        var _local5:int;
        var _local6:int;
        var _local7:int;
        var _local8:int;
        var _local9:int;
        _local3 = "";
        _local4 = 0;
        _local5 = string[((_arg1 - 5) ^ -797)].length;
        while (_local4 < _local5) {
            _local6 = int(string[((_arg1 - 5) ^ -797)][_local4]);
            _local4++;
            _local7 = int(string[((_arg1 - 5) ^ -797)][_local4]);
            _local8 = 2654435769;
            _local9 = 84941944608;
            while (_local9 != 0) {
                _local7 -= ((((_local6 << 4) ^ (_local6 >>> 5)) + _local6) ^ (_local9 + int(key[((_arg2 + 3) ^ -505)][((_local9 >>> 11) & 3)])));
                _local9 -= _local8;
                _local6 -= ((((_local7 << 4) ^ (_local7 >>> 5)) + _local7) ^ (_local9 + int(key[((_arg2 + 3) ^ -505)][(_local9 & 3)])));
            }
            _local3 += (String.fromCharCode(_local6) + String.fromCharCode(_local7));
            _local4++;
        }
        if (_local3.charCodeAt((_local3.length - 1)) == 0) {
            _local3 = _local3.substring(0, (_local3.length - 1));
        }
        return (_local3);
    }
}
}//package _yn