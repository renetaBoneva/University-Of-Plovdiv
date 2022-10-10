//Задайте чрез двумерен масив лабиринт, в който попълнете клетки със стойности: 0 - стена, 1 - път,а 2 - съкровище.
//Напишете алгоритъм, който показва дали съкровишето може да бъде открито, ако търсенето му започва от първата клетка на лабиринта (0,0).
//Движението в лабиринта може да се извършва само в 4-посоки, ако има път.

using System;

namespace ex1_2
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] labyrint = { { 1, 1},
                                { 0, 1},
                                { 1, 0},
                                { 0, 0} };
            string result = "There is no treasure :(";
            Console.WriteLine("You started the game! Can you find the treasure?");
            for (int i = 1; i < 4; i++)
            {
                int firstNum1 = labyrint[i - 1, 0];
                int secondNum1 = labyrint[i - 1, 1];
                int previousNum2 = labyrint[i, 0];
                int currentNum2 = labyrint[i, 1];


                if (firstNum1 == 0 && secondNum1 == 0)
                {
                    result = "There is no way to the treasure!";
                    break;
                }
                else if (firstNum1 == 1 && secondNum1 == 1)
                {
                    if (previousNum2 == 0 && currentNum2 == 0)
                    {
                        result = "There is no way to the treasure!";
                        break;
                    }
                    else if (previousNum2 == 2 || currentNum2 == 2)
                    {
                        result = "You found the treasure!";
                        break;
                    }
                }
                else if (firstNum1 == 1 && secondNum1 == 0)
                {

                    if (previousNum2 == 0)
                    {
                        result = "There is no way to the treasure!";
                        break;
                    }
                    else if (previousNum2 == 2)
                    {
                        result = "You found the treasure!";
                        break;
                    }
                }
                else if (firstNum1 == 0 && secondNum1 == 1)
                {
                    if (currentNum2 == 0)
                    {
                        result = "There is no way to the treasure!";
                        break;
                    }
                    else if (currentNum2 == 2)
                    {
                        result = "You found the treasure!";
                        break;
                    }

                }
                else if (firstNum1 == 2 || secondNum1 == 2)
                {
                    result = "You found the treasure!";
                    break;
                }
            }
            Console.WriteLine(result);
        }
    }
}
