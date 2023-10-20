public class Course
{
    public int Id { get; set; }
    public string Title { get; set; }
    public int Credits { get; set; }
    public ICollection<Enrollment> Enrollments { get; set; }

    public Course(int id, string title, int credits)
    {
        Id = id;
        Title = title;
        Credits = credits;
    }
}

