public class Todo
{
    public int Id { get; set; }
    public string? Task { get; set; }
    public bool Completed { get; set; }
    public int? ListeId { get; set; }
    public DateTime? Deadline { get; set; }
    public void addToListe(Liste liste)
    {
        ListeId = liste.Id;
    }
}