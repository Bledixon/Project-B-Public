using System;
using System.Collections.Generic;
using wServer.realm.entities;

namespace wServer.realm
{
    internal static class Sight
    {
        public static List<IntPoint> GetSightCircle(Player player, int radius)
        {
            List<IntPoint> pts = new List<IntPoint>();
            for (int y = -radius; y <= radius; y++)
                for (int x = -radius; x <= radius; x++)
                {
                    if (x * x + y * y <= radius * radius)
                        pts.Add(new IntPoint(x + (int)player.X, y + (int)player.Y));
                }
            return pts;
        }

        public static List<IntPoint> RayCast(Player player, int radius)
        {
            var map = player.Owner.Map;

            var Tiles = new List<IntPoint>();
            for (var x = -radius; x <= radius; x++)
                for (var y = -radius; y <= radius; y++)
                    if (x * x + y * y <= radius * radius)
                    {
                        var lineData = castLine((int)player.X, (int)player.Y, (int)player.X + x, (int)player.Y + y, player);
                        if (lineData.Item1)
                            Tiles.Add(new IntPoint(x + (int)player.X, y + (int)player.Y));
                        else
                            Tiles.Add(lineData.Item2);
                    }
            for (var x = -1; x <= 1; x++)
                for (var y = -1; y <= 1; y++)
                    Tiles.Add(new IntPoint(x + (int)player.X, y + (int)player.Y));
            return Tiles;
        }

        private static Tuple<bool, IntPoint> castLine(int x, int y, int x2, int y2, Player player)
        {
            int w = x2 - x;
            int h = y2 - y;
            int dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0;
            if (w < 0)
                dx1 = -1;
            else if (w > 0)
                dx1 = 1;
            if (h < 0)
                dy1 = -1;
            else if (h > 0)
                dy1 = 1;
            if (w < 0)
                dx2 = -1;
            else if (w > 0)
                dx2 = 1;
            int longest = Math.Abs(w);
            int shortest = Math.Abs(h);
            if (!(longest > shortest))
            {
                longest = Math.Abs(h);
                shortest = Math.Abs(w);
                if (h < 0) dy2 = -1; else if (h > 0) dy2 = 1;
                dx2 = 0;
            }
            int numerator = longest >> 1;
            for (int i = 0; i <= longest; i++)
            {
                var desc = player.Owner.Map[x, y].ObjectDesc;
                if (desc != null && desc.BlocksSight)
                    return Tuple.Create(false, new IntPoint(x, y));

                numerator += shortest;
                if (!(numerator < longest))
                {
                    numerator -= longest;
                    x += dx1;
                    y += dy1;
                }
                else
                {
                    x += dx2;
                    y += dy2;
                }
            }
            return Tuple.Create(true, new IntPoint(x, y));
        }
    }
}