using System;
using System.Threading;
using System.Threading.Tasks;

public static class TaskFactoryExtentions
{
    public static Task StartNewSafe(this TaskFactory factory, Action action)
    {
        return factory.StartNew(() =>
        {
            try
            {
                action.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        });
    }

    public static Task StartNewSafe(this TaskFactory factory, Action action, CancellationToken cancellationToken)
    {
        return factory.StartNew(() =>
        {
            try
            {
                action.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        }, cancellationToken);
    }

    public static Task StartNewSafe(this TaskFactory factory, Action action, TaskCreationOptions creationOptions)
    {
        return factory.StartNew(() =>
        {
            try
            {
                action.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        }, creationOptions);
    }

    public static Task StartNewSafe(this TaskFactory factory, Action action, CancellationToken cancellationToken, TaskCreationOptions creationOptions, TaskScheduler scheduler)
    {
        return factory.StartNew(() =>
        {
            try
            {
                action.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        }, cancellationToken, creationOptions, scheduler);
    }

    public static Task StartNewSafe(this TaskFactory factory, Action<Object> action, Object state)
    {
        return factory.StartNew(s =>
        {
            try
            {
                action.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        }, state);
    }

    public static Task StartNewSafe(this TaskFactory factory, Action<Object> action, Object state, CancellationToken cancellationToken)
    {
        return factory.StartNew(s =>
        {
            try
            {
                action.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        }, state, cancellationToken);
    }

    public static Task StartNewSafe(this TaskFactory factory, Action<Object> action, Object state, TaskCreationOptions creationOptions)
    {
        return factory.StartNew(s =>
        {
            try
            {
                action.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        }, state, creationOptions);
    }

    public static Task StartNewSafe(this TaskFactory factory, Action<Object> action, Object state, CancellationToken cancellationToken,
                        TaskCreationOptions creationOptions, TaskScheduler scheduler)
    {
        return factory.StartNew(s =>
        {
            try
            {
                action.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
        }, state, cancellationToken, creationOptions, scheduler);
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<TResult> function)
    {
        return factory.StartNew<TResult>(() =>
        {
            try
            {
                return function.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        });
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<TResult> function, CancellationToken cancellationToken)
    {
        return factory.StartNew<TResult>(() =>
        {
            try
            {
                return function.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        }, cancellationToken);
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<TResult> function, TaskCreationOptions creationOptions)
    {
        return factory.StartNew<TResult>(() =>
        {
            try
            {
                return function.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        }, creationOptions);
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<TResult> function, CancellationToken cancellationToken, TaskCreationOptions creationOptions, TaskScheduler scheduler)
    {
        return factory.StartNew<TResult>(() =>
        {
            try
            {
                return function.Invoke();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        }, cancellationToken, creationOptions, scheduler);
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<Object, TResult> function, Object state)
    {
        return factory.StartNew<TResult>(s =>
        {
            try
            {
                return function.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        }, state);
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<Object, TResult> function, Object state, CancellationToken cancellationToken)
    {
        return factory.StartNew<TResult>(s =>
        {
            try
            {
                return function.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        }, state, cancellationToken);
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<Object, TResult> function, Object state, TaskCreationOptions creationOptions)
    {
        return factory.StartNew<TResult>(s =>
        {
            try
            {
                return function.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        }, state, creationOptions);
    }

    public static Task<TResult> StartNewSafe<TResult>(this TaskFactory factory, Func<Object, TResult> function, Object state, CancellationToken cancellationToken,
        TaskCreationOptions creationOptions, TaskScheduler scheduler)
    {
        return factory.StartNew<TResult>(s =>
        {
            try
            {
                return function.Invoke(s);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception in task:");
                Console.WriteLine(ex);
            }
            return default(TResult);
        }, state, cancellationToken, creationOptions, scheduler);
    }
}