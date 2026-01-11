partial class Program
{
    static void Main()
    {
        Console.WriteLine("hello world");

        Greet("Tom");
    }

    static void Greet(string name)
    {
        Console.WriteLine($"Hello, {name}!");
    }
}