using System;

namespace ex03_01
{
    /*Въведете курс с максимум 100 студента със следната информация: име, факултетен номер и успех.
    Напишете методи намиращи:
        •отличниците на курса;
        •успеха на студент Х, които се въвежда от клавиатурата;
        •името на студента с най-малък факултетен номер;
        •средния успех на курса.*/
    class Program
    {
        static void Main(string[] args)
        {
            string[] nameArr = new string[100];
            int[] idArray = new int[100];
            double[] gradeArray = new double[100];

            //За да изпробваме нашия код ще огранича входните данни до 5 студента

            //Попълваме данните за всеки студент
            Console.WriteLine("Въведете имената на 5 стyдента:");
            for(int i = 0; i < 5 /*100*/; i++)
            {
                nameArr[i] = Console.ReadLine();
            }
            Console.WriteLine("Въведете факултетните номера на студентите:");
            for (int i = 0; i < 5 /*100*/; i++)
            {
                idArray[i] = int.Parse(Console.ReadLine());
            }
            Console.WriteLine("Въведете успеха на студентите:");
            for (int i = 0; i < 5 /*100*/; i++)
            {
                gradeArray[i] = double.Parse(Console.ReadLine());
            }

            Console.WriteLine($"Най-високият успех във випуска е: {bestGradeStudents(gradeArray).ToString("0.00")}" );

            Console.WriteLine("Въведи името на студента, чиито успех търсиш: ");
            string searchedStudent = Console.ReadLine();
            int indexName = int.Parse(searchStudentIndex(nameArr, searchedStudent));
            Console.WriteLine($"Успехът на {nameArr[indexName]} е {gradeArray[indexName]}");

            int indexID = minIDStudents(idArray);
            Console.WriteLine($"{nameArr[indexID]} е студентът с най-малък факултетен номер-> {idArray[indexID]}");
            Console.WriteLine($"Средният успех на випуска е: {avrgGrade(gradeArray).ToString("0.00")}");
        }
        static double bestGradeStudents(double[] gradeArray)
        {
            double maxGrade = gradeArray[0];
            for(int i = 1; i < 5 /*gradeArray.Length*/; i++)
            {
                double currentGrade = gradeArray[i];
                if(currentGrade > maxGrade)
                {
                    maxGrade = currentGrade;
                }
            }
            return maxGrade;
        }

        static string searchStudentIndex(string[] nameArray, string searchedStudent)
        {
            int index = 0;
            for(int i = 0; i < 5 /*nameArray.Length*/; i++)
            {
                if(nameArray[i] == searchedStudent)
                {
                    index = i;
                    break;
                }
            }
            string newIndex = index.ToString();

            return newIndex;
        }
        static int minIDStudents(int[] idArray)
        {
            int index = 0;
            int minID = idArray[0];
            for (int i = 1; i < 5 /*gradeArray.Length*/; i++)
            {
                int currentID = idArray[i];
                if (currentID < minID)
                {
                    minID = currentID;
                    index = i;
                }
            }
            return index;
        }

        static double avrgGrade(double[] gradeArr)
        {
            double sum = 0;
            for(int i = 0; i < 5/*gradeArr.Length*/; i++)
            {
                sum += gradeArr[i];
            }
            double avrg = sum / 5 /*100*/;
            return avrg;
        }
    }
}
