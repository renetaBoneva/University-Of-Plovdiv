using System;
using System.Linq;
using System.Collections.Generic;
using System.Text.RegularExpressions;


namespace ex2
{
    class ex2
    {
        static void Main(string[] args)
        {
            string s;
            bool stop = false;
            do
            {
                Console.Write("Въведете низ: ");
                s = Console.ReadLine();
                stop = Regex.IsMatch(s, @"(?<S1>[13579]{2})(?<S2>[a-z]+)(?<S3>[#%&FH]+)(?<S4>\k<S2>)(?<S5>[02468]{3})");
            } while (!stop);

            Regex regex = new Regex(@"[0-9]", RegexOptions.Compiled);
            MatchCollection digits = regex.Matches(s);
            List<int> l = new List<int>();

            foreach (Match ch in digits)
            {
                l.Add(int.Parse(ch.Value));
            }

            Console.WriteLine("Всички десетични цифри, които са се срещали някъде в прочетения низ подредени по възходящ ред без повторение: ");
            foreach (int d in l.Distinct().OrderBy(c => c))
            {
                Console.WriteLine(d);
            }

            Console.WriteLine("\n\n\n Знак: ");
            Console.ReadKey(true);
        }
    }
}
