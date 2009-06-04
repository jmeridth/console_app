using System;
using console_app.library;

namespace console_app
{
    class Program
    {
        static void Main(string[] args)
        {
            ProcessName();
        }

        static void ProcessName()
        {
            Console.WriteLine("What's your name?");
            try
            {
                var name = Console.ReadLine();
                if(!name.Validate()) throw new InvalidNameFormatException("Invalid name format, pleast try again");
                
                Console.WriteLine("Hello, " + name);    
            }
            catch(InvalidNameFormatException infe)
            {
                Console.WriteLine(infe.Message);
            }
            
            Console.ReadLine();
        }
    }
}