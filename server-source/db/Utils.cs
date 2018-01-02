﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

public static class Utils
{
    public static int FromString(string x)
    {
        if (x.StartsWith("0x")) return int.Parse(x.Substring(2), NumberStyles.HexNumber);
        return int.Parse(x);
    }

    public static List<int> StringListToIntList(List<string> strList)
    {
        var ret = new List<int>();
        foreach (string i in strList)
        {
            try
            {
                ret.Add(Convert.ToInt32(i));
            }
            catch
            {
            }
        }
        return ret;
    }

    public static string To4Hex(short x)
    {
        return "0x" + x.ToString("x4");
    }

    public static string GetCommaSepString<T>(T[] arr)
    {
        var ret = new StringBuilder();
        for (int i = 0; i < arr.Length; i++)
        {
            if (i != 0) ret.Append(", ");
            ret.Append(arr[i]);
        }
        return ret.ToString();
    }

    public static int[] FromCommaSepString32(string x)
    {
        return x.Split(',').Select(_ => FromString(_.Trim())).ToArray();
    }

    public static ushort[] FromCommaSepString16(string x)
    {
        return x.Split(',').Select(_ => (ushort) FromString(_.Trim())).ToArray();
    }

    public static string[] FromCommaSepString(string x)
    {
        return x.Split(',').Select(_ => _.Trim()).ToArray();
    }

    public static void Shuffle<T>(this IList<T> list)
    {
        var provider = new RNGCryptoServiceProvider();
        int n = list.Count;
        while (n > 1)
        {
            var box = new byte[1];
            do provider.GetBytes(box); while (!(box[0] < n*(Byte.MaxValue/n)));
            int k = (box[0]%n);
            n--;
            T value = list[k];
            list[k] = list[n];
            list[n] = value;
        }
    }

    public static string ToSafeText(this string str)
    {
        return Encoding.ASCII.GetString(
            Encoding.Convert(
                Encoding.UTF8,
                Encoding.GetEncoding(
                    Encoding.ASCII.EncodingName,
                    new EncoderReplacementFallback(string.Empty),
                    new DecoderExceptionFallback()
                    ),
                Encoding.UTF8.GetBytes(str)
                )
            );
    }

    public static Dictionary<TKey, TValue> Clone<TKey, TValue>(this Dictionary<TKey, TValue> source)

    {

        var ret = new Dictionary<TKey, TValue>(source.Count, source.Comparer);

        foreach (var kvp in source)

            ret.Add(kvp.Key, kvp.Value);

        return ret;

    }



    public static Dictionary<TKey, TValue> AddOrUpdate<TKey, TValue>(this Dictionary<TKey, TValue> source,

        Dictionary<TKey, TValue> dict)

    {

        var ret = source.Clone();

        foreach (var kvp in dict)

        {

            if (!ret.ContainsKey(kvp.Key))

                ret.Add(kvp.Key, kvp.Value);

            else ret[kvp.Key] = kvp.Value;

        }

        return ret;

    }
}