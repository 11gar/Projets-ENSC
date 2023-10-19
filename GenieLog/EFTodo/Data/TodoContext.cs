using Microsoft.EntityFrameworkCore;

public class TodoContext : DbContext
{
  public DbSet<Todo> Todo { get; set; } = null!;
  public DbSet<Liste> Listes { get; set; } = null!;
  public string DbPath { get; private set; }


  public TodoContext()
  {
    // Path to SQLite database file
    DbPath = "EFTodo.db";
  }

  public Todo NewTask(string task){
    int max=0;
    foreach(Todo t in Todo){
      if(t.Id>max){
        max=t.Id;
      }
    }
    Todo todo=new Todo(max+1,task);
    this.Add(todo);
    this.SaveChanges();
    return todo;
  }

  public void RemoveAllTodos(){
    foreach(Todo t in Todo){
      this.Remove(t);
    }
  }

  public Liste NewListe(string liste){
    int max=0;
    foreach(Liste l in this.Listes){
      if(l.Id>max){
        max=l.Id;
      }
    }
    Liste list=new Liste(max+1,liste);
    this.Add(list);
    this.SaveChanges();
    return list;
  }

  public void RemoveAllListes(){
    foreach(Liste t in Listes){
      this.Remove(t);
    }
  }

  public void AfficheListe(int id){
    var list=this.Listes.Where(e=>e.Id==id); 
    foreach(Liste l in list){
      Console.WriteLine("-------"+l.Nom+"-------");
      foreach(Todo t in this.Todo.Where(e=>e.idListe==id)){
        Console.WriteLine(t);
      }
    }
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
