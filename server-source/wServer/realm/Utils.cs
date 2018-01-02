using System;
using System.Collections.Generic;
using System.Linq;
using wServer.realm;
using wServer.realm.entities;

namespace wServer
{
    internal static class EntityUtils
    {
        /// <summary>
        /// Gets the square distance between two entities using Pythagorean theorem. Uses less power than Dist()
        /// </summary>
        /// <returns>The square distance between two entities as a Double.</returns>
        public static double DistSqr(this Entity a, Entity b)
        {
            float dx = a.X - b.X;
            float dy = a.Y - b.Y;
            return dx*dx + dy*dy;
        }

        /// <summary>
        /// Gets the Pythagorean distance between two entities. Uses DistSqr().
        /// </summary>
        /// <returns>The absolute distance between two entities as a Double.</returns>
        public static double Dist(this Entity a, Entity b)
        {
            return Math.Sqrt(a.DistSqr(b));
        }

        /// <summary>
        /// Checks if there is a player within 16 tiles of the target entity.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <returns>A boolean.</returns>
        public static bool AnyPlayerNearby(this Entity entity)
        {
            foreach (Entity i in entity.Owner.PlayersCollision.HitTest(entity.X, entity.Y, 16))
            {
                if (i.Dist(entity) < 16*16)
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Checks if there is a player within 16 tiles of the target coordinate in a certain world.
        /// </summary>
        /// <param name="world">The world to be checked.</param>
        /// <param name="x">The X coordinate of the target.</param>
        /// <param name="y">The Y coordinate of the target.</param>
        /// <returns>A boolean.</returns>
        public static bool AnyPlayerNearby(this World world, double x, double y)
        {
            foreach (Entity i in world.PlayersCollision.HitTest(x, y, 16))
            {
                if (MathsUtils.Dist(i.X, i.Y, x, y) < 16*16)
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Gets the closest entity to a target entity based on object type.
        /// </summary>
        /// <param name="entity">Target entity for search.</param>
        /// <param name="dist">Maximum distance for query.</param>
        /// <param name="objType">Type of entity to be queried. Null for player.</param>
        /// <returns>An Entity.</returns>
        public static Entity GetNearestEntity(this Entity entity, double dist, ushort? objType)
        {
            if (!entity.IsValid()) return null;

            Entity ret = null;
            if (objType == null)
                foreach (Entity i in entity.Owner.PlayersCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || !(i as IPlayer).IsVisibleToEnemy()) continue;
                    if (ret == null || i.Dist(entity) < ret.Dist(entity))
                        ret = i;
                }
            else
                foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || i.ObjectType != objType.Value) continue;
                    if (ret == null || i.Dist(entity) < ret.Dist(entity))
                        ret = i;
                }
            return ret;
        }

        /// <summary>
        /// Gets an enumerable collection of certain entities within a specified distance from target entity.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <param name="dist">The maximum search distance.</param>
        /// <param name="objType">Type of entity to be queried. Null for player.</param>
        /// <returns>An IEnumerable Entity collection.</returns>
        public static IEnumerable<Entity> GetNearestEntities(this Entity entity, double dist, ushort? objType)
        {
            if (!entity.IsValid()) yield break;

            if (objType == null)
                foreach (Entity i in entity.Owner.PlayersCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || !(i as IPlayer).IsVisibleToEnemy()) continue;
                    if (i.Dist(entity) < dist)
                        yield return i;
                }
            else
                foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || i.ObjectType != objType.Value) continue;
                    if (i.Dist(entity) < dist)
                        yield return i;
                }
        }

        /// <summary>
        /// Gets the nearest entity to a target entity in a specified distance that satisfies a predicate.
        /// </summary>
        /// <param name="entity">The target entity for searching.</param>
        /// <param name="dist">The radius of the search from the target entity.</param>
        /// <param name="players">If false, will search for enemies.</param>
        /// <param name="predicate">Criteria for the nearest entity.</param>
        /// <returns>An Entity.</returns>
        public static Entity GetNearestEntity(this Entity entity, double dist, bool players, Predicate<Entity> predicate = null)
        {
            if (entity.Owner == null) return null;
            Entity ret = null;
            if (players)
                foreach (Entity i in entity.Owner.PlayersCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || !(i as IPlayer).IsVisibleToEnemy() || i == entity || i.isPet) continue;
                    double d = i.Dist(entity);
                    if (d < dist)
                    {
                        if (predicate != null && !predicate(i))
                            continue;
                        dist = d;
                        ret = i;
                    }
                }
            else
                foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || i == entity) continue;
                    double d = i.Dist(entity);
                    if (d < dist)
                    {
                        if (predicate != null && !predicate(i))
                            continue;
                        dist = d;
                        ret = i;
                    }
                }
            return ret;
        }
        
        /*   
        protected Entity GetNearestEntityPet(ref float dist)
        {
            if (Entity.Owner == null) return null;
            Entity ret = null;
            
            foreach (var i in Entity.Owner.EnemiesCollision.HitTest(Entity.X, Entity.Y, dist))
            {
                if (i.isPet) continue;
                if (!(i is Enemy)) continue;
                if (!i.ObjectDesc.Enemy) continue;
                var d = Dist(i);
                if (d < dist)
                {
                    dist = d;
                    ret = i;
                }
            }
            return ret;
        } 
        */

        /// <summary>
        /// Gets the nearest entity in a specified group to a target entity.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <param name="dist">The maximum search distance.</param>
        /// <param name="group">The group that the output entity must be in.</param>
        /// <returns>An Entity.</returns>
        public static Entity GetNearestEntityByGroup(this Entity entity, double dist, string group)
        {
            return entity.GetNearestEntitiesByGroup(dist, group).FirstOrDefault();
        }

        /// <summary>
        /// Gets an Enumerable collection of Entity based on specified group.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <param name="dist">The maximum search distance.</param>
        /// <param name="group">The group that the output entities must be in.</param>
        /// <returns>An IEnumerable Entity collection.</returns>
        public static IEnumerable<Entity> GetNearestEntitiesByGroup(this Entity entity, double dist, string group)
        {
            if (!entity.IsValid()) yield break;
            foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, dist))
            {
                if (!i.IsValid() || i.ObjectDesc == null || i.ObjectDesc.Group != group) continue;
                if (i.Dist(entity) < dist)
                    yield return i;
            }
        }

        /// <summary>
        /// Counts the number of Entity objects within a certain distance of target entity.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <param name="dist">The maximum search distance.</param>
        /// <param name="objType">Type of entity to be queried. Null for player.</param>
        /// <returns>An integer count of nearby Entity objects.</returns>
        public static int CountEntity(this Entity entity, double dist, ushort? objType)
        {
            if (!entity.IsValid()) return 0;
            int ret = 0;
            if (objType == null)
                foreach (Entity i in entity.Owner.PlayersCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || !(i as IPlayer).IsVisibleToEnemy()) continue;
                    if (i.Dist(entity) < dist)
                        ret++;
                }
            else
                foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, dist))
                {
                    if (!i.IsValid() || i.ObjectType != objType.Value) continue;
                    if (i.Dist(entity) < dist)
                        ret++;
                }
            return ret;
        }

        /// <summary>
        /// Counts the number of Entity objects within a certain distance of target entity.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <param name="dist">The maximum search distance.</param>
        /// <param name="group">The group that the counted entities must be in.</param>
        /// <returns>An integer count of nearby Entity objects.</returns>
        public static int CountEntity(this Entity entity, double dist, string group)
        {
            if (!entity.IsValid()) return 0;
            int ret = 0;
            foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, dist))
            {
                if (!i.IsValid() || i.ObjectDesc == null || i.ObjectDesc.Group != group) continue;
                if (i.Dist(entity) < dist)
                    ret++;
            }
            return ret;
        }

        /// <summary>
        /// Gets the speed of target entity.
        /// </summary>
        /// <param name="entity">Target Entity.</param>
        /// <param name="spd">Behavior speed parameter.</param>
        /// <returns>A single-precision float.</returns>
        public static float GetSpeed(this Entity entity, float spd)
        {
            return 5.55f*spd + 0.74f;
        }

        /// <summary>
        /// Validates a set coordinate pair before attempting to move an entity there.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <param name="x">The X coordinate of the destination.</param>
        /// <param name="y">The Y coordinate of the destination.</param>
        /// <returns>A boolean indicating whether a move happened or not.</returns>
        public static bool ValidateAndMove(this Entity entity, float x, float y)
        {
            if (entity.Validate(x, y)) entity.Move(x, y);
            else if (entity.Validate(entity.X, y)) entity.Move(entity.X, y);
            else if (entity.Validate(x, entity.Y)) entity.Move(x, entity.Y);
            else return false;

            return true;
        }

        /// <summary>
        /// Validates a set coordinate pair for movement by an entity.
        /// </summary>
        /// <param name="entity">The target entity.</param>
        /// <param name="x">The X coordinate of the destination.</param>
        /// <param name="y">The Y coordinate of the destination.</param>
        /// <returns>A boolean indicating whether the coordinate is valid.</returns>
        public static bool Validate(this Entity entity, float x, float y)
        {
            if (!entity.IsValid() || entity.HasConditionEffect(ConditionEffects.Paralyzed)) return false;
            if (x < 0 || x >= entity.Owner.Map.Width ||
                y < 0 || y >= entity.Owner.Map.Height)
                return false;
            if (!entity.Owner.IsPassable((int) x, (int) y)) return false;

            return true;
        }

        /// <summary>
        /// Finds all entities of a certain type in a circular range from an entity, and performs an action callback for each entity found.
        /// </summary>
        /// <param name="entity">The entity where the center of the AOE is.</param>
        /// <param name="radius">The size of the AOE.</param>
        /// <param name="objType">The type of entity to be searched. Null for player.</param>
        /// <param name="callback">The action to be performed by the entities found in the radius.</param>
        public static void AOE(this Entity entity, float radius, ushort? objType, Action<Entity> callback)
        {
            if (!entity.IsValid()) return;
            if (objType == null)
                foreach (Entity i in entity.Owner.PlayersCollision.HitTest(entity.X, entity.Y, radius))
                {
                    if (!i.IsValid()) continue;
                    if (i.Dist(entity) < radius)
                        callback(i);
                }
            else
                foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, radius))
                {
                    if (i.ObjectType != objType.Value || !i.IsValid()) continue;
                    if (i.Dist(entity) < radius)
                        callback(i);
                }
        }

        /// <summary>
        /// Finds all enemies or players in a circular range from an entity, and performs an action callback for each entity found.
        /// </summary>
        /// <param name="entity">The entity where the center of the AOE is.</param>
        /// <param name="radius">The size of the AOE.</param>
        /// <param name="players">To search for players or enemies.</param>
        /// <param name="callback">The action to be performed by the entities found in the radius.</param>
        public static void AOE(this Entity entity, float radius, bool players, Action<Entity> callback)
        {
            if (players)
                foreach (Entity i in entity.Owner.PlayersCollision.HitTest(entity.X, entity.Y, radius))
                {
                    if (!i.IsValid()) continue;
                    if (i.Dist(entity) < radius)
                        callback(i);
                }
            else
                foreach (Entity i in entity.Owner.EnemiesCollision.HitTest(entity.X, entity.Y, radius))
                {

                    if (!i.IsValid() || !(i is Enemy)) continue;
                    if (i.Dist(entity) < radius)
                        callback(i);
                }
        }

        /// <summary>
        /// Finds all entities in a circular range from a world position, and performs callback action for each.
        /// </summary>
        /// <param name="world">The target World.</param>
        /// <param name="pos">The target Position.</param>
        /// <param name="radius">The maximum range of the search.</param>
        /// <param name="players">If false, searches for enemies.</param>
        /// <param name="callback">The action to be performed by the entities found in the radius.</param>
        public static void AOE(this World world, Position pos, float radius, bool players, Action<Entity> callback)
        {
            if (players)
                foreach (Entity i in world.PlayersCollision.HitTest(pos.X, pos.Y, radius))
                {
                    if (!i.IsValid()) continue;
                    if (MathsUtils.Dist(i.X, i.Y, pos.X, pos.Y) < radius)
                        callback(i);
                }
            else
                foreach (Entity i in world.EnemiesCollision.HitTest(pos.X, pos.Y, radius))
                {
                    if (!i.IsValid() || !(i is Enemy)) continue;
                    if (MathsUtils.Dist(i.X, i.Y, pos.X, pos.Y) < radius)
                        callback(i);
                }
        }
    }

    internal static class ItemUtils
    {
        public static bool AuditItem(this IContainer container, Item item, int slot)
        {
            if ((container as Entity).ObjectDesc != null && (container as Entity).ObjectDesc.Class == "Forge" &&
                item != null && !item.Material) return false;
            if ((container as Entity).ObjectDesc != null && (container as Entity).ObjectDesc.Class == "Reforge" &&
                item != null && !item.Material && slot != 0) return false;
            return item == null || container.SlotTypes[slot] == 10 || item.SlotType == container.SlotTypes[slot];
        }
    }
}