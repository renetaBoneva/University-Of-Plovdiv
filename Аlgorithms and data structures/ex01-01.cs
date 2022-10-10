//Напишете метод, чрез който се пресмята стойността на функцията f(x), където х се въвежда от клавиатурата:
//f(x) = 7 * x + 3, x < 1
//f(x) = 2, 1 <= x < 10
//f(x) = 2 * x * f(x - 5), x >= 10
//Тествайте задачата с х=11

using System;

namespace ex1_1
{
    class Program
    {
        public static int f(int x)
        {
            int result = 0;
            if(x < 1)
            {
                result =  7 * x + 3;
            } 
            else if(x < 10) 
            {
                result =  2;
            } 
            else if (x >= 10)
            {
                result =   2 * x * f(x - 5);
            }
            return result;
            
        }
        static void Main(string[] args)
        {
            Console.Write("x = ");
            int x = int.Parse(Console.ReadLine());
            Console.WriteLine("Result: {0}", f(x));
        }
    }
}
