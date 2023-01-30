using System;
using System.Linq;
using System.Collections.Generic;
using System.Text.RegularExpressions;

/*
Да се напише на езика C# приложение, което:
а) Трябва да въвежда низове докато бъде прочетен низ, съдържащ подниз, който е конкатенация S1+S2+S3+S4+S5на низове S1, S2, S3,S4 и S5, където:
— S1 е двойка нечетни десетични цифри (например може да бъде "19","99", "73" и други);
— S2 е поредица от една или повече малки латински букви (например може да бъде "z", "zzii", "abcdefgabcdaaaa" и други);
— S3 е двойка различни знакове, всеки от които може да бъде измежду „#”, „%”, „&”, „F” или „H” (например може да бъде "#&", "&#", "%F" и други);
— S4 съвпада с S2;
— S5 е четна десетична цифра, повторена три пъти (например може да бъде "222", "000", "888" и други).
Например такъв подниз може да бъде "19zzii%Fzzii888", където S1 е "19", S2 и S4 са "zzii", S3 е "%F" и S5 е "888". Следователно въвеждането би 
било прекратено след прочитането на който и да било от низовете "19zzii%Fzzii888", "====19zzii%Fzzii888,,,,,,",
"::::::19zzii%Fzzii888==12345=6=7=890" или други, съдържащи
подниз "19zzii%Fzzii888".
Също така, възможни поднизове, изпълняващи описаното изискване, са например "11h#&h222", "53word#&word444", "15ffH%ff888" и други.

б) След приключване на въвеждането приложението трябва да извежда без повторения и подредени по нарастване всички десетични цифри,
които са се срещали някъде в прочетен низ.
*/
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
