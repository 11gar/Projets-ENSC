public class SeedData
{
    private TodoContext Context { get; set; }
    public Todo[] Todos { get; set; }
    public Liste[] Listes { get; set; }
    public SeedData()
    {
        Context = new TodoContext();
        Todos = new Todo[]{
            new Todo{
                Task = "Faire une soupe au caca boudin",
                Completed = true,
                Deadline = DateTime.Today.AddDays(1),
            },
            new Todo{
                Task = "Faire du pipi en sauce",
                Completed = false,
                Deadline= DateTime.Today.AddDays(2),

            },
            new Todo{
                Task = "prouter dans les pates",
                Completed = false,
                Deadline= DateTime.Today,
            }
        };
        Listes = new Liste[]{
            new Liste{
                Name = "Liste du caca",
            }
        };
        Todos[0].addToListe(Listes[0]);
        Todos[1].addToListe(Listes[0]);
    }

    public void SaveChanges()
    {
        DeleteDatabase();
        Context.AddRange(Todos);
        Context.AddRange(Listes);
        Context.SaveChanges();
        System.Console.WriteLine(Context.Todos.Count());
        //DeleteDatabase();

    }
    public void DeleteDatabase()
    {
        foreach (var item in Context.Todos)
        {
            Context.Remove(item);
        }
        foreach (var item in Context.Listes)
        {
            Context.Remove(item);
        }
        Context.SaveChanges();
    }
}