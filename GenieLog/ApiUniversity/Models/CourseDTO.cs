public class CourseDTO
{
    public int Id { get; set; }
    public string Title { get; set; } = null!;
    public int Credits { get; set; }

    public CourseDTO() { }

    public CourseDTO(Course course)
    {
        Id = course.Id;
        Title = course.Title;
        Credits = course.Credits;
    }
}