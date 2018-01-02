package _02t
{

  import flash.display.Sprite;
  import flash.net.URLRequest;

  import gif.player.GIFPlayer;

  public class _lM_ extends Sprite
  {

    public function _lM_()
    {
      var local0:background = new background();
      local0.alpha = 1;
      local0.scaleX = (800 / local0.width);
      local0.scaleY = (600 / local0.height);
      var local1:background2 = new background2();
      local1.alpha = 1;
      local1.scaleX = (800 / local1.width);
      local1.scaleY = (600 / local1.height);
      var local2:backgroundHalloween = new backgroundHalloween();
      local2.alpha = 1;
      local2.scaleX = (800 / local2.width);
      local2.scaleY = (600 / local2.height);

      var pictures:Array = new Array(local0,local1,local2);
      pictures[1] = local0;
      pictures[2] = local1;
      pictures[3] = local2;

      var request:URLRequest = new URLRequest("http://bledixon.com/images/Halloween-Panda-Gif.gif");
      var Panda:GIFPlayer = new GIFPlayer();
      Panda.load(request);
      Panda.alpha = 1;
      Panda.x = (300);
      Panda.y = (200);

      addChild(pictures[3]); //int(3 * Math.random())
      addChild(Panda);


    }
  }
}//package _02t
