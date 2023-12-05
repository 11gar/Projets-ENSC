public class Course
{
    public int Id { get; set; }
    public string Title { get; set; }
    public int Credits { get; set; }
    public List<Enrollment>? Enrollments { get; set; }

    public override string ToString()
    {
        return ("Cours " + Id + " : " + Title + " (" + Credits + " crédits)");
    }
    public Course(CourseDTO courseDTO)
    {
        Id = courseDTO.Id;
        Title = courseDTO.Title;
        Credits = courseDTO.Credits;
    }
    public Course()
    {
        Title = "";
        Credits = 0;
    }
}

