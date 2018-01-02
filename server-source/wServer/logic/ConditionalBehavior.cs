namespace wServer.logic
{
    internal abstract class ConditionalBehavior : Behavior
    {
        public bool Result { get; protected set; }
    }
}