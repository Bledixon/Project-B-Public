#region

using System;
using System.Collections.Generic;

#endregion

namespace wServer.realm.entities
{
    internal class MerchantList
    {
        public static Dictionary<int, Tuple<int, CurrencyType>> prices = new Dictionary<int, Tuple<int, CurrencyType>>
        {
            //////////////PRICES ONLY\\\\\\\\\\\\\
                
            //Pots
            {0xa20, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Defense
            {0xa1f, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Attack
            {0xa21, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Speed
            {0xa34, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Vitality
            {0xa35, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Wisdom
            {0xa4c, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Dexterity
            {0xae9, new Tuple<int, CurrencyType>(2000000, CurrencyType.Fame)}, //Life
            {0xaea, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Mana
            
            //Armor t13
            {0xb05, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Robe
            {0xafc, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Heavy
            {0xaf9, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Leather
            
            //weapons t10
            {0xaff, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Dagger
            {0xb0b, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Sword
            {0xb02, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Bow
            {0xb08, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Staff
            {0xaf6, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Wand
            
            //Abilities t6
            {0xb24, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, // Spell
            {0xb25, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Tome
            {0xb28, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Quiver
            {0xb27, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Cloak
            {0xb29, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Helm
            {0xb22, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Shield
            {0xb26, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Seal
            {0xb2a, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Poison
            {0xb2b, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Skull
            {0xb2c, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Trap
            {0xb2d, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Orb
            {0xb23, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Prism
            {0xb33, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, //Scepter

            // Effusions
            {0xaef, new Tuple<int, CurrencyType>(500, CurrencyType.Fame)}, // Defense
            {0xaf0, new Tuple<int, CurrencyType>(400, CurrencyType.Fame)}, // Defense
            {0xaf1, new Tuple<int, CurrencyType>(400, CurrencyType.Fame)}, // Defense
            {0xaf2, new Tuple<int, CurrencyType>(400, CurrencyType.Fame)}, // Defense
            {0xaf3, new Tuple<int, CurrencyType>(400, CurrencyType.Fame)}, // Defense

            //randum stuff
           // {0xb3e, new Tuple<int, CurrencyType>(20, CurrencyType.Fame)}, //Amulet of Resurrection
            {0xaeb, new Tuple<int, CurrencyType>(20, CurrencyType.Fame)}, //Greater Health Potion
            {0xaec, new Tuple<int, CurrencyType>(20, CurrencyType.Fame)}, //Greater Magic Potion
            {0x161f, new Tuple<int, CurrencyType>(2000, CurrencyType.Gold)}, //Valentine

            // dyes (For now)
            // Clothing
            {0x1007, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Black
            {0x1009, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Blue
            {0x100b, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Brown
            {0x1010, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Coral
            {0x1012, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Cornsilk
            {0x1015, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Dark Blue
            {0x101f, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Dark Red
            {0x1002, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Aqua
            {0x1004, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Azure
            {0x1033, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Green
            {0x102f, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Ghost White
            {0x1079, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Sienna
            {0x1030, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Gold

            //Accessory
            {0x1107, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Black
            {0x1109, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Blue
            {0x110b, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Brown
            {0x1110, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Coral
            {0x1112, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Cornsilk
            {0x1115, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Dark Blue
            {0x111f, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Dark Red
            {0x1102, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Aqua
            {0x1104, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Azure
            {0x1133, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Green
            {0x112f, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Ghost White
            {0x1179, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Sienna
            {0x1130, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)}, //Gold

            //Special Cloths Large
            {0x1200, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1201, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1202, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1203, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1204, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1205, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1206, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1207, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1208, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1209, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1210, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1211, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1212, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1213, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1214, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1215, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1216, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1217, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1218, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1219, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1220, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1221, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1222, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1223, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1224, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1225, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1226, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1227, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1228, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1229, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1230, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1231, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1232, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1233, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1234, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1235, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1236, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1237, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1238, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1239, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1240, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1241, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1242, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1243, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1244, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1245, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1246, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},

            //Special Cloths Small
            {0x1300, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1301, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1302, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1303, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1304, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1305, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1306, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1307, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1308, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1309, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1310, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1311, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1312, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1313, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1314, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1315, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1316, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1317, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1318, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1319, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1320, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1321, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1322, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1323, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1324, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1325, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1326, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1327, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1328, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1329, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1330, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1331, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1332, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1333, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1334, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1335, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1336, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1337, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1338, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1339, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1340, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1341, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1342, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1343, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1344, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1345, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},
            {0x1346, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)},

            {0xc0a, new Tuple<int, CurrencyType>(20, CurrencyType.Fame)}, //cronus
			
            {0x1508, new Tuple<int, CurrencyType>(5000, CurrencyType.Gold)}, //Pet
            
            {0x230c, new Tuple<int, CurrencyType>(5, CurrencyType.Keys)}, //Supply Key
            {0x2317, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)}, //Premium Crate
            {0xb3e, new Tuple<int, CurrencyType>(0, CurrencyType.Fame)}, // Ammy 
            {0x2018, new Tuple<int, CurrencyType>(0, CurrencyType.Gold)},
            
            {0x70b, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, //Snake key
            {0x70a, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, //Abyss Key
            {0x71f, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, // Sprit eKey
            {0x710, new Tuple<int, CurrencyType>(4, CurrencyType.Keys)}, // Tomb Key
            {0x701, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, // UDL Key 
            {0x247b, new Tuple<int, CurrencyType>(3, CurrencyType.Keys)}, // Cland Key
            {0x247d, new Tuple<int, CurrencyType>(2, CurrencyType.Keys)}, //Halloween Key
            {0x2522, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, //Elder Snake Key
            {0x2524, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, //Elder Abyss Key
            {0x2526, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, //Elder Undead Key
            {0x2529, new Tuple<int, CurrencyType>(2, CurrencyType.Keys)}, //Hive Key
            {0x2564, new Tuple<int, CurrencyType>(2, CurrencyType.Keys)}, //Pirate Treasure Key
            {0x2573, new Tuple<int, CurrencyType>(2, CurrencyType.Keys)}, //Shaitan's Key
            {0x2419, new Tuple<int, CurrencyType>(2, CurrencyType.Keys)}, //Ghostly Caverns
            {0xc11, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, //Ocean Trench
            {0xc23, new Tuple<int, CurrencyType>(1, CurrencyType.Keys)}, // Manor
            {0x22ff, new Tuple<int, CurrencyType>(3, CurrencyType.Keys)}, // Wine Cellar
            {0x23b1, new Tuple<int, CurrencyType>(500, CurrencyType.Gold)}, //Paper

            // <-- Old Tops --> \\
            {0xa30, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xa5b, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xa65, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xae1, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xa55, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xa46, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xaa8, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xaaf, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xab6, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xb20, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},
            {0xb32, new Tuple<int, CurrencyType>(5, CurrencyType.Gold)},

            // <-- Gold Items --> \\

            {0x236d, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x236f, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2371, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2376, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2377, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2378, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2379, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x237a, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x237b, new Tuple<int, CurrencyType>(2000, CurrencyType.Gold)}, //Rainbow Amulet
            {0x237c, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2398, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x23cd, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x240e, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2410, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2428, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2429, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2441, new Tuple<int, CurrencyType>(20, CurrencyType.Gold)},
            {0x2445, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2367, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2369, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x236a, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x236b, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x236c, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2373, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2374, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x23c6, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x23c8, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x242a, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x242b, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0xba2, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)}, //nile
            {0xba1, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)}, //sphinx
            {0xba0, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)}, //pyra
            {0xc02, new Tuple<int, CurrencyType>(250, CurrencyType.Gold)},
            {0x2701, new Tuple<int, CurrencyType>(100, CurrencyType.Gold)}, // christmas Oryx Key



        };

        public static int[] store1List =
        {
            0x1007, 0x1009, 0x100b, 0x1010, 0x1012, 0x1015, 0x101f, 0x1002, 0x1004, 0x1033,
            0x102f, 0x1079, 0x1030, 0x1107, 0x1109, 0x110b, 0x1110, 0x1112, 0x1115, 0x111f, 0x1102, 0x1104, 0x1133,
            0x112f, 0x1179, 0x1130
        }; //random dyes

        public static int[] store2List = 
        {
        	0xa96, 0xa93, 0xa90, 0xacd, 0xac8, 0x23f4, 0x23fb
        }; //armor

        public static int[] store3List = 
        {
        	0xa8a, 0xa47, 0xa8d, 0xaa2, 0xa87, 0x23f3
        }; // weapons
        public static int[] store4List = 
        {
            0xa30, 0xa5b, 0xa65, 0xae1, 0xa6b, 0xa55, 0xa46, 0xaa8, 0xaaf, 0xab6, 0xb20, 0xb32
        }; // abilitys
        public static int[] store5List = 
        {
            0x236d, 0x236f, 0x2371, 0x2376, 0x2377, 0x2378, 0x2379, 0x237a,
            0x237c, 0x2398, 0x23cd, 0x240e, 0x2410, 0xba2, 0xba1, 0xba0,
            0x2441,  0x2367, 0x2369, 0x236a, 0x236b,  0x236c,  0x2373,
            0x2374, 0x2398,  0x23c6,  0x23c8, 0x242a, 0x242b, 0xc02
        }; // gold items
        public static int[] store6List = 
        {
            0x1200, 0x1201, 0x1202, 0x1203, 0x1204, 0x1205, 0x1206, 0x1207, 0x1208, 0x1209, 0x1210, 0x1211,
            0x1212, 0x1213, 0x1214, 0x1215, 0x1216, 0x1217, 0x1218, 0x1219, 0x1220, 0x1221, 0x1222, 0x1223,
            0x1224, 0x1225, 0x1226, 0x1227, 0x1228, 0x1229, 0x1230, 0x1231, 0x1232, 0x1233, 0x1234, 0x1235,
            0x1236, 0x1237, 0x1238, 0x1239, 0x1240, 0x1241, 0x1242, 0x1243, 0x1244, 0x1245, 0x1246
        };  //large special cloths

        public static int[] store7List =
        {
//            0x2018, 
              0x70b, 0x70a, 0x71f, 0x710, 0x701, 0x23b1, 0x2419, 0xc11, 0xc23, 0x22ff, 0x247b, 0x247d, 0x1508, 0x2529
        };    //random sh*t

        public static int[] store8List =
        {
//            0x2018, 
              0x70b, 0x70a, 0x71f, 0x710, 0x701, 0x23b1, 0x2419, 0xc11, 0xc23, 0x22ff, 0x247b, 0x247d, 0x2529
        }; // random sh*t

        public static int[] store9List =
        {
            0x1300, 0x1301, 0x1302, 0x1303, 0x1304, 0x1305, 0x1306, 0x1307, 0x1308, 0x1309, 0x1310, 0x1311,
            0x1312, 0x1313, 0x1314, 0x1315, 0x1316, 0x1317, 0x1318, 0x1319, 0x1320, 0x1321, 0x1322, 0x1323,
            0x1324, 0x1325, 0x1326, 0x1327, 0x1328, 0x1329, 0x1330, 0x1331, 0x1332, 0x1333, 0x1334, 0x1335,
            0x1336, 0x1337, 0x1338, 0x1339, 0x1340, 0x1341, 0x1342, 0x1343, 0x1344, 0x1345, 0x1346
            //small special cloths
        }; 

        public static Dictionary<string, int[]> shopLists = new Dictionary<string, int[]>();

        public static Random rand = new Random();
    }
}