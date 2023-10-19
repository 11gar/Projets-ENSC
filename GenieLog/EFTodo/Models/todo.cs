public class Todo{
    public int Id{get; set;}
    public string Task{get; set;}
    public bool Completed{get; set;}
    public DateTime? Deadline{get;set;}
    public int? idListe{get;set;}

    public Todo(int id, string task, string deadline){
        Id=id;
        Task=task;
        if(DateTime.TryParse(deadline, out DateTime convertedDeadline)){
            Deadline=convertedDeadline;   
        }
        else{
            Console.WriteLine("Error : Wrong Date Format.");
            Deadline=null;
        }
    }

    public Todo(int id, string task){
        Id=id;
        Task=task;
        Deadline=null;
    }
    public void addToList(int id){
        idListe=id;
    }
    public void Check(){
        Completed=!Completed;
    }

    public override string ToString()
    {
        return("Tache "+Id+" : "+Task+" - "+ (Completed?"Done":"Not Done"));
    }

    }