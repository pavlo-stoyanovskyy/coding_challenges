    //https://app.gun.io/app/profile/code-test/354/result/
    
    class Program
    {
        static void Main(string[] args)
        {
            Task1();

            Task2();

            Task3();

            Console.ReadKey();
        }

        private static void Task1()
        {
            int result = 0;
            for (int i = 1; i < 10000; i++)
            {
                if (isPalindromes(i.ToString()))
                {
                    result = result + i;
                }
            }

            Console.WriteLine(result); //545040
        }

        private static void Task2()
        {
            var fibonacciNumbersList = new List<int> { 0, 1 };

            var fibonacciResult = FibonacciSeries(21, fibonacciNumbersList);

            var result = fibonacciNumbersList.Where(_ => _ < 10000 && IsOdd(_)).Sum();

            Console.WriteLine(result); //14328
        }

        private static void Task3()
        {
            var result = 0;
            for (int i = 1; i <= 2660; i++)
            {
                var romanNumber = ToRoman(i);

                result =
                    result + romanNumber.Where(_ => _ == 'X').Count();
            }

            Console.WriteLine(result); //3977
        }

        private static bool isPalindromes(string s)
        {
            for (int i = 0; i < s.Length; i++)
            {
                if (s[i] != s[s.Length - i - 1])
                {
                    return false;
                }
            }

            return true;
        }

        static int FibonacciSeries(int n, List<int> fibonacciNumbersList)
        {
            int firstnumber = 0, secondnumber = 1, result = 0;

            if (n == 0) return 0; //To return the first Fibonacci number   
            if (n == 1) return 1; //To return the second Fibonacci number   


            for (int i = 2; i <= n; i++)
            {
                result = firstnumber + secondnumber;

                fibonacciNumbersList.Add(result);

                firstnumber = secondnumber;
                secondnumber = result;
            }

            return result;
        }

        public static bool IsOdd(int value)
        {
            return value % 2 != 0;
        }

        public static string ToRoman(int number)
        {
            if ((number < 0) || (number > 3999)) throw new ArgumentOutOfRangeException("insert value betwheen 1 and 3999");
            if (number < 1) return string.Empty;
            if (number >= 1000) return "M" + ToRoman(number - 1000);
            if (number >= 900) return "CM" + ToRoman(number - 900);
            if (number >= 500) return "D" + ToRoman(number - 500);
            if (number >= 400) return "CD" + ToRoman(number - 400);
            if (number >= 100) return "C" + ToRoman(number - 100);
            if (number >= 90) return "XC" + ToRoman(number - 90);
            if (number >= 50) return "L" + ToRoman(number - 50);
            if (number >= 40) return "XL" + ToRoman(number - 40);
            if (number >= 10) return "X" + ToRoman(number - 10);
            if (number >= 9) return "IX" + ToRoman(number - 9);
            if (number >= 5) return "V" + ToRoman(number - 5);
            if (number >= 4) return "IV" + ToRoman(number - 4);
            if (number >= 1) return "I" + ToRoman(number - 1);
            throw new ArgumentOutOfRangeException("something bad happened");
        }
    }
