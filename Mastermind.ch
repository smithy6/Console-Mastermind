using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConsoleTableExt;
namespace Mastermind_10
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int userNumber00 = 0;
            int userNumber01 = 0;
            int userNumber02 = 0;
            int userNumber03 = 0;
            int userNumber04 = 0;
            int userNumber05 = 0;
            int userNumber06 = 0;
            int userNumber07 = 0;
            int userNumber08 = 0;
            int userNumber09 = 0;
            int userNumber010 = 0;
            int userNumber011 = 0;
            int userNumber012 = 0;
            int userNumber013 = 0;
            int userNumber014 = 0;
            int userNumber015 = 0;
            int userNumber016 = 0;
            int userNumber017 = 0;
            int userNumber018 = 0;
            int userNumber019 = 0;
            int blackPegs = 0; //counter for correct numbers in correct position (black pegs)
            int whitePegs = 0; //counter for correct numbers in incorrect position (white pegs)
            int attempts = 0; //counter for attempts
            string mastermind = ("   __  __           _____ _______ ______ _____  __  __ _____ _   _ _____  \n  |  \\/  |   /\\    / ____|__   __|  ____|  __ \\|  \\/  |_   _| \\ | |  __ \\ \n  | \\  / |  /  \\  | (___    | |  | |__  | |__) | \\  / | | | |  \\| | |  | |\n  | |\\/| | / /\\ \\  \\___ \\   | |  |  __| |  _  /| |\\/| | | | | . ` | |  | |\n  | |  | |/ ____ \\ ____) |  | |  | |____| | \\ \\| |  | |_| |_| |\\  | |__| |\n  |_|  |_/_/    \\_\\_____/   |_|  |______|_|  \\_\\_|  |_|_____|_| \\_|_____/ ");
            void mastermindTextLogo() //mastermind text logo
            {
                Console.ForegroundColor = ConsoleColor.DarkRed; //colours the text dark red
                Console.WriteLine(mastermind); //outputs the mastermind text logo
                Console.ForegroundColor = ConsoleColor.White; //resets text colour to white
            }
            mastermindTextLogo(); //calls the mastermindTextLogo function
            Random random = new Random(); //new random for array
            int[] target = new int[4]; //array for random numbers    (use this for TESTING: int[] target = new int[4] { 1, 2, 3, 4 }; //array with target numbers as 1234 for TESTING) //Console.WriteLine(target[0] + " " + target[1] + " " + target[2] + " " + target[3]); //for testing output target
            for (int i = 0; i < target.Length; i++) //for loop to generate random numbers
            {
                target[i] = random.Next(1, 7); //generates random numbers between 1 and 6
            }
            Console.ForegroundColor = ConsoleColor.DarkYellow; //colours the text dark yellow
            Console.WriteLine("\nWelcome to Mastermind! You have 5 attempts to guess the 4 digit code. Good luck!"); //game instructions
            Console.WriteLine("The code consists of 4 numbers between 1 and 6. You will be given feedback on your guess."); //game instructions
            Console.WriteLine("A black peg means you have a correct number in the correct position."); //game instructions
            Console.WriteLine("A white peg means you have a correct number in the wrong position."); //game instructions
            Console.WriteLine("You can enter your guess in the following format: 1234"); //game instructions
            Console.ForegroundColor = ConsoleColor.Cyan; //colours the text cyan
            Console.WriteLine("Press any key to continue..."); //game instructions
            Console.ReadKey(); //waits for user to press any key
            Console.Clear(); //clears the console
            mastermindTextLogo(); //calls the mastermindTextLogo function
            Console.ForegroundColor = ConsoleColor.DarkBlue; //colours the text dark blue
            Console.WriteLine("Enter a four digit numbers, e.g. 1234"); //output message for user input
            Console.ForegroundColor = ConsoleColor.White; //resets text colour to white
            int[] userNumber = Console.ReadLine() //user input
                    .Select(v => v - '0').ToArray(); //convert user input to array
            void userNumberVaildation() //method to check if user input is vaild
            {
                while (userNumber.Length != 4) //if userNumber is not 4 digits long, output error message and ask for input again
                {
                    Console.ForegroundColor = ConsoleColor.Red; //colours the text dark red
                    Console.WriteLine("Error: You must enter 4 digits."); //output error message
                    Console.ForegroundColor = ConsoleColor.DarkBlue; //colours the text dark blue
                    Console.WriteLine("Enter a four digit numbers, e.g. 1234"); //output message for user input
                    Console.ForegroundColor = ConsoleColor.White; //resets text colour to white
                    userNumber = Console.ReadLine() //user input
                        .Select(v => v - '0').ToArray(); //convert user input to array
                }
                while (userNumber[0] < 1 || userNumber[0] > 6 || userNumber[1] < 1 || userNumber[1] > 6 || userNumber[2] < 1 || userNumber[2] > 6 || userNumber[3] < 1 || userNumber[3] > 6) //if any userNumber index is not between 1 and 6, output error message and ask for input again
                {
                    Console.ForegroundColor = ConsoleColor.Red; //colours the text dark red
                    Console.WriteLine("Error: You must enter numbers between 1 and 6."); //output error message
                    Console.ForegroundColor = ConsoleColor.DarkBlue; //colours the text dark blue
                    Console.WriteLine("Enter a four digit numbers, e.g. 1234"); //output message for user input
                    Console.ForegroundColor = ConsoleColor.White; //resets text colour to white
                    userNumber = Console.ReadLine() //user input
                        .Select(v => v - '0').ToArray(); //convert user input to array
                }
            }
            userNumberVaildation(); //calls the userNumberVaildation method
            void updateLineVariables() //update the variables that are stored in gameBoard (only updates the line for the current attempt)
            {
                if (attempts == 0)
                {
                    userNumber00 = userNumber[0];
                    userNumber01 = userNumber[1];
                    userNumber02 = userNumber[2];
                    userNumber03 = userNumber[3];
                }
                if (attempts == 1)
                {
                    userNumber04 = userNumber[0];
                    userNumber05 = userNumber[1];
                    userNumber06 = userNumber[2];
                    userNumber07 = userNumber[3];
                }
                if (attempts == 2)
                {
                    userNumber08 = userNumber[0];
                    userNumber09 = userNumber[1];
                    userNumber010 = userNumber[2];
                    userNumber011 = userNumber[3];
                }
                if (attempts == 3)
                {
                    userNumber012 = userNumber[0];
                    userNumber013 = userNumber[1];
                    userNumber014 = userNumber[2];
                    userNumber015 = userNumber[3];
                }
                if (attempts == 4)
                {
                    userNumber016 = userNumber[0];
                    userNumber017 = userNumber[1];
                    userNumber018 = userNumber[2];
                    userNumber019 = userNumber[3];
                }
            }
            updateLineVariables(); //calls for updateLineVariables
            var gameBoard = new List<List<object>> //declares and assigns the table for the console graphics
            {
                
                new List<object>{ "Guess 1", "Guess 2", "Guess 3", "Guess 4", "Black Pegs", "White Pegs" }, //headers
                new List<object>{ userNumber00, userNumber01, userNumber02, userNumber03, blackPegs, whitePegs }, //first attempt
                new List<object>{ userNumber04, userNumber05, userNumber06, userNumber07, blackPegs, whitePegs }, //second attempt
                new List<object>{ userNumber08, userNumber09, userNumber010, userNumber011, blackPegs, whitePegs }, //third attempt
                new List<object>{ userNumber012, userNumber013, userNumber014, userNumber015, blackPegs, whitePegs }, //fourth attempt
                new List<object>{ userNumber016, userNumber017, userNumber018, userNumber019, blackPegs, whitePegs }, //fifth attempt
            };
            void printBoard() //outputs the game board onto the console
            {
                Console.Clear(); //clears the console
                Console.ForegroundColor = ConsoleColor.DarkRed; //colours the text dark red
                Console.WriteLine(mastermind); //outputs the mastermind text logo
                Console.ForegroundColor = ConsoleColor.White; //resets text colour to white
                ConsoleTableBuilder.From(gameBoard).WithCharMapDefinition(CharMapDefinition.FramePipDefinition) //assigns where the table should get its data from
            .WithCharMapDefinition( //assigns the format for the table
                    CharMapDefinition.FramePipDefinition, 
                    new Dictionary<HeaderCharMapPositions, char> {
                        {HeaderCharMapPositions.TopLeft, '╒' },
                        {HeaderCharMapPositions.TopCenter, '═' },
                        {HeaderCharMapPositions.TopRight, '╕' },
                        {HeaderCharMapPositions.BottomLeft, '╞' },
                        {HeaderCharMapPositions.BottomCenter, '╤' },
                        {HeaderCharMapPositions.BottomRight, '╡' },
                        {HeaderCharMapPositions.BorderTop, '═' },
                        {HeaderCharMapPositions.BorderRight, '│' },
                        {HeaderCharMapPositions.BorderBottom, '═' },
                        {HeaderCharMapPositions.BorderLeft, '│' },
                        {HeaderCharMapPositions.Divider, ' ' },
                    })
                .ExportAndWriteLine(); //outputs the table
            }
            printBoard(); //calls for printBoard
            void updateGameBoard() //updates the gameBoard by line (attempts) so that only the current line (attempt) is updated
            {
                if (attempts == 0)
                {
                    gameBoard[1][0] = userNumber00;
                    gameBoard[1][1] = userNumber01;
                    gameBoard[1][2] = userNumber02;
                    gameBoard[1][3] = userNumber03;
                    gameBoard[1][4] = blackPegs;
                    gameBoard[1][5] = whitePegs;
                }
                if (attempts == 1)
                {
                    gameBoard[2][0] = userNumber04;
                    gameBoard[2][1] = userNumber05;
                    gameBoard[2][2] = userNumber06;
                    gameBoard[2][3] = userNumber07;
                    gameBoard[2][4] = blackPegs;
                    gameBoard[2][5] = whitePegs;
                }
                if (attempts == 2)
                {
                    gameBoard[3][0] = userNumber08;
                    gameBoard[3][1] = userNumber09;
                    gameBoard[3][2] = userNumber010;
                    gameBoard[3][3] = userNumber011;
                    gameBoard[3][4] = blackPegs;
                    gameBoard[3][5] = whitePegs;
                }
                if (attempts == 3)
                {
                    gameBoard[4][0] = userNumber012;
                    gameBoard[4][1] = userNumber013;
                    gameBoard[4][2] = userNumber014;
                    gameBoard[4][3] = userNumber015;
                    gameBoard[4][4] = blackPegs;
                    gameBoard[4][5] = whitePegs;
                }
                if (attempts == 4)
                {
                    gameBoard[5][0] = userNumber016;
                    gameBoard[5][1] = userNumber017;
                    gameBoard[5][2] = userNumber018;
                    gameBoard[5][3] = userNumber019;
                    gameBoard[5][4] = blackPegs;
                    gameBoard[5][5] = whitePegs;
                }
            }
            while (attempts <= 4) //while loop to repeat game untill user guesses correctly
            {
                for (int c = 0; c < 4; c++) //for loop that checks how the userNumber matches the target
                {
                    if (target[c] == userNumber[c]) //uses the for loop to check if each index of the target and userNumber match if they do it adds one black peg
                    {
                        blackPegs++; //blackpeg = blackpeg + 1
                        updateGameBoard(); //calls for updateGameBoard
                        printBoard(); //calls for printBoard
                    }
                    else if (target.Contains(userNumber[c]) //uses the for loop to add one whitepeg if target contains the userNumber per index and if the userNumber per index does not match the target per index
                        && userNumber[c] != target[c]) 
                    {
                        whitePegs++; //whitepeg = whitepeg + 1
                        updateGameBoard(); //calls for updateGameBoard
                        printBoard(); //calls for printBoard
                    }
                }
                attempts++; //increment attempts
                if (blackPegs == 4) //if user guesses correctly, print message and break loop
                {
                    updateGameBoard(); //calls for updateGameBoard
                    printBoard(); //calls for printBoard
                    Console.ForegroundColor = ConsoleColor.Green; //colours the text green
                    Console.WriteLine("All correct! Attempts: " + attempts); //prints message
                    break; //breaks loop
                }
                if (attempts == 5) //if user runs out of attempts, print message and break loop
                {
                    updateGameBoard(); //calls for updateGameBoard
                    printBoard(); //calls for printBoard
                    Console.ForegroundColor = ConsoleColor.Red; //colours the text red
                    Console.WriteLine("You ran out of attempts! The correct answer was: " + target[0] + target[1] + target[2] + target[3]); //prints message
                    break; //breaks loop
                }
                Console.ForegroundColor = ConsoleColor.DarkBlue; //colours the text dark blue
                Console.Write(whitePegs + " white pegs, "); //print message with number of white pegs
                Console.Write(blackPegs + " black pegs. "); //print message with number of black pegs
                Console.Write("Try Again: "); //print message
                Console.ForegroundColor = ConsoleColor.White; //resets text colour to white
                whitePegs = 0; //reset white pegs
                blackPegs = 0; //reset black pegs
                userNumber = Console.ReadLine() //user input
                    .Select(v => v - '0').ToArray(); //convert to array
                userNumberVaildation(); //calls for userNumberVaildation
                updateLineVariables(); //calls for updateLineVariables
                updateGameBoard(); //calls for updateGameBoard
                printBoard(); //calls for printBoard
            }
            Console.ReadKey(); //stops console from closing
        }
    }
}
