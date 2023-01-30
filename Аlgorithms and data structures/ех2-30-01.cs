using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

/*
 
 Да се напише на езика С# приложение със следната функционалност:
- Въвеждане на низове, докато бъдат въведени три пъти подред низове всеки, 
от които съдържа на поне три места една и съща десетична цифра.
 Например такива низове, изпълняващи описаното условие, са : "==2=22","222","555==2=2" и "11==2=21"
Съответно примери за низове, в които е нарушени изисканото условие са: "==2=2","228","355==2=2" и "51==2=21"
-След прекратяване на четенето извежда подредени низходящо всички различни въведени низове, в които
има някаква десетична цифра.

 */

namespace ex2_30_01
{
    class Program
    {
        static void Main(string[] args)
        {
            string input;
            int stopCount = 0;
            Regex regex = new Regex(@"(?<g>[0-9]{1}).*(\k<g>).*(\k<g>)", RegexOptions.Compiled);
            Regex pattern = new Regex(@"[0-9]", RegexOptions.Compiled);
            List<string> matchesL = new List<string>();


            do
            {
                Console.Write("Въведи низ: ");
                input = Console.ReadLine();
                if (regex.IsMatch(input))
                {
                    stopCount++;
                }
                else
                {
                    stopCount = 0;
                }

                if (pattern.IsMatch(input))
                {
                    matchesL.Add(input);
                }

            } while (stopCount != 3);


            foreach (string m in matchesL.Distinct().OrderByDescending(a => a))
            {
                Console.WriteLine(m);
            }
        }
    }
}
