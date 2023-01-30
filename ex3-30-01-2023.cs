using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

/*
 Да се напише на езика C# приложение със следната функционалност:
- Въвежда с контрол на стойността някакъв брой от 0 до 10. Този брой условно ще означим с N
- Въвежда низове, докато бъде прочетен низ, съдържащ поне N различни знака.
- След прекратяване на въвеждането, извежда всички въведени низове, които имат
поне един общ знак с последния прочетен низ. При това, извежданите низове
трябва да бъдат подредени по реда на прочитането им и да бъдат изведени по толкова пъти,
по колкото са били прочетени.
 
 */


namespace ex3_30_01_2023
{
    class Program
    {
        static void Main(string[] args)
        {
            int N;
            do
            {
                Console.Write("Въведет цяло число от 1 до 10:  ");
                N = int.Parse(Console.ReadLine());
            } while (N < 0 || N > 10);

            string input;
            List<string> L = new List<string>();
            do
            {
                Console.Write("Въведет низ:  ");
                input = Console.ReadLine();
                L.Add(input);

            } while (input.Distinct().Count() <= N  );

            Console.WriteLine("Всички въведени низове, които имат поне един общ знак с последния прочетен низ: ");
            foreach(string s in L.Where(current => current.Any(ch => input.Contains(ch))))
            {
                Console.WriteLine($"\"{s}\"");
            }

            Console.WriteLine("\n\n\n Sign");
            Console.ReadKey(true);
        }
    }
}
