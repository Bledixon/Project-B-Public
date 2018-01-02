/**
 * Created by Mike on 04.07.2016.
 */
package
{
  import com.company.assembleegameclient.util.loadEmbeds;
  import flash.display.StageScaleMode;
  import _U_5._D_c;
  import flash.ui.MouseCursorData;
  import flash.events.*;
  import flash.display.BitmapData;
  import flash.display.Bitmap;
  import flash.geom.Point;
  import flash.ui.Mouse;
  import flash.utils.ByteArray;
  import flash.display.Sprite;
  import com.company.assembleegameclient.parameters.Parameters;
  import flash.net.LocalConnection;
  import flash.text.TextField;
  import flash.net.navigateToURL;
  import flash.net.URLRequest;

  public final dynamic class WebMain
   {

     public function WebMain()
     {
       super();
     }

    /* public function Protection(param1:int) : String
     {
       var _loc2_:* = new Array(13592281,2436214,6962724,2698028,6846255,2239294,2828069,3762792,3092515,8087671,6973561,2499881,7813157,8022376,8026746,6818828,3831412,2501482,2370851,2713719,4072495,6830127,2651764,2822004,4076345,2305061,7745060,7612517,3827062,2902644,13592223,7895140,2307708,6319651,6645865,6447988,6516514,6032481,13592222,6840687,7693417,2319202,7955562,7305317,6448163,13592194,8284536,7749503,7955832,4158308,1146488);
       var _loc3_:* = new ByteArray();
       if(true)
       {
         var _loc4_:* = 0;
         addr154:
             while(true)
             {
             push(_loc4_);
               push(_loc2_);
               if(true)
               {
               push(pop()[param1] ^ 13592211);
               }
               if(pop() >= (pop() ^ 31))
               {
                 break;
               }
               push(_loc3_);
               push(_loc2_);
               if(true)
               {
               push(pop()[param1 + 1 + (_loc4_ - _loc4_ % 3) / 3]);
               }
               pop().writeByte(pop() >>> 8 * (_loc4_ % 3) & 255 ^ (_loc2_[param1] ^ 13592211));
             }
         return _loc3_;
       }
       while(true)
       {
         _loc4_++;
            goto(addr154);
       }
     }

     public function ProtectionTwo(param1:Sprite) : Boolean
     {
       var _loc2_:* = new Array(38,45);
       var _loc3_:* = new LocalConnection().domain;
       var _loc4_:* = 0;
       while(_loc4_ < _loc2_.length)
       {
         if(WebMain(_loc2_[_loc4_]) == _loc3_)
         {
           return true;
         }
         _loc4_++;
       }
       var _loc5_:TextField = new TextField();
       _loc5_.htmlText = WebMain.Protection(0);
       _loc5_.width = 800;
       _loc5_.height = 600;
       _loc5_.wordWrap = true;
       param1.stage.addChild(_loc5_);
       param1.stage.removeChildAt(0);
       navigateToURL(new URLRequest(WebMain.Protection(30)),"_blank");
       return false;
     } */
   }
}
