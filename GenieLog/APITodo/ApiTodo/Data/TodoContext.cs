using Microsoft.EntityFrameworkCore;

public class TodoContext : DbContext
{
    public DbSet<Todo> Todos { get; set; } = null!;
    public string DbPath { get; private set; }
    public DbSet<Liste> Listes { get; set; } = null!;


    public TodoContext()
    {
        // Path to SQLite database file
        DbPath = "EFTodo.db";
    }

    public List<Todo> ToListAsync()
    {
        var l = new List<Todo>();
        foreach (var item in Todos)
        {
            l.Append(item);
        }
        return l;
    }

    // The following configures EF to create a SQLite database file locally
    protected override void OnConfiguring(DbContextOptionsBuilder options)
    {
        // Use SQLite as database
        options.UseSqlite($"Data Source={DbPath}");
        // Optional: log SQL queries to console
        //options.LogTo(Console.WriteLine, new[] { DbLoggerCategory.Database.Command.Name }, LogLevel.Information);
    }
}
