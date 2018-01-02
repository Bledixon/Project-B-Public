package com.company.assembleegameclient.ui {
  import com.company.assembleegameclient.util.TextureRedrawer;
  import com.company.util.GraphicHelper;

  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.display.GraphicsPath;
  import flash.display.GraphicsSolidFill;
  import flash.display.IGraphicsData;
  import flash.display.Sprite;

  public class TabButton extends Sprite {
    public static const WIDTH:int = 28;
    public static const HEIGHT:int = 24;

    public function TabButton(_icon:BitmapData, _selected:Boolean, _tabId:int) {
      this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
      super();
      this.selected_ = _selected;
      this.iconRaw_ = _icon;
      this.icon_ = TextureRedrawer.redraw(this.iconRaw_, (320 / this.iconRaw_.width), true, 0, 0);
      this.holder_ = new TabBackground(186, 98);
      this.holder_.x = -28 * _tabId;
      this.holder_.y = 22;
      this.holder_.visible = _selected;
      this.addChild(this.holder_);
      this.tabId_ = _tabId;
      this.draw();
    }
    public var iconRaw_:BitmapData;
    public var icon_:BitmapData;
    public var selected_:Boolean = false;
    public var tabId_:int = 0;
    public var holder_:TabBackground;
    protected var fill_:GraphicsSolidFill;
    protected var path_:GraphicsPath;
    private var bmap_:Bitmap;
    private var graphicsData_:Vector.<IGraphicsData>;

    public function setSelected(_selected:Boolean):void {
      this.selected_ = _selected;
      this.holder_.visible = _selected;
      this.draw();
    }

    public function updateFill(_selected:Boolean):void {
      this.fill_ = new GraphicsSolidFill(_selected ? 0x191919 : 0x4C4C4C, 1);
      this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
    }

    public function draw():void {
      this.updateFill(this.selected_);
      GraphicHelper._0L_6(this.path_);
      GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT + 4, 2, [1, 1, 0, 0], this.path_);
      this.graphics.clear();
      this.graphics.drawGraphicsData(this.graphicsData_);
      if (this.bmap_ == null) {
        this.bmap_ = new Bitmap(this.icon_);
        this.bmap_.x = -6;
        this.bmap_.y = -10;
        this.addChild(this.bmap_);
      }
      this.holder_.draw(this.tabId_ == 0);
    }
  }
}