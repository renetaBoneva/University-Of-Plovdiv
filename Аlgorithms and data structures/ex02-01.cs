using System;

namespace ex02_01
{
    //Въведете успеха на учениците в едно училище, в което има 10 класа
    //с по 30 ученика (експериментирайте задачата с 3 класа по 2 ученика).
    //След мимнистерска заповед трябва да се увеличи успеха на всички ученици
    //с 1, но ако успеха се получи >6, то той става 6.
    //Отпечатайте успеха на всички ученици в училището в табличен
    //вид(за всеки клас оценките се разполагат в една колона).
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("All students' olg grades:");
            int[][] studentsGrades = { new int[] { 2, 3 }, new int[] { 4, 5 }, new int[] { 6, 3 } };
            for (int i = 0; i < 2; i++)
            {
                Console.Write(studentsGrades[0][i] + " ");
                Console.Write(studentsGrades[1][i] + " ");
                Console.WriteLine(studentsGrades[2][i] + " ");

                if (studentsGrades[0][i] != 6)
                {
                    studentsGrades[0][i]++;
                }
                if (studentsGrades[1][i] != 6)
                {
                    studentsGrades[1][i]++;
                }
                if (studentsGrades[2][i] != 6)
                {
                    studentsGrades[2][i]++;
                }
            }

            Console.WriteLine("All students' new grades:");
            for (int j = 0; j < studentsGrades[0].Length; j++)
            {
                for (int i = 0; i < studentsGrades.Length; i++)
                {
                    Console.Write(studentsGrades[i][j] + " ");
                }
                Console.WriteLine("");
            }
        }
    }
}
