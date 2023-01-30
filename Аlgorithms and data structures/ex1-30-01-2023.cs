using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

/*
 
 Задача:
Да се напише приложение, което въвежда низ и изважда без повторения(по един път)
всички поднизове на този низ, които имат дължина три и се срещат като поднизове 
в прочетения низ поне на две различни места.
 
 */

namespace ex1_30_01
{
    class Program
    {
        static void Main(string[] args)
        {
            string input;
            Regex regex = new Regex(@"(?<g>.{3}).*(\k<g>)", RegexOptions.Compiled);
            List<string> matchesValues = new List<string>();

            do
            {
                Console.Write("Въведете низ: ");
                input = Console.ReadLine();                

            } while (!regex.IsMatch(input));

            MatchCollection matches = regex.Matches(input);
            foreach (Match m in matches)
            {
                matchesValues.Add(m.Value);                
            }

            Console.WriteLine("\nНамерени съвпадения: ");
            foreach (string m in matchesValues.Distinct().OrderBy(a => a))
            {
                Console.WriteLine(m);
            }

            Console.WriteLine("\n\n\n Sign");
            Console.ReadKey(true);
        }
    }
}
