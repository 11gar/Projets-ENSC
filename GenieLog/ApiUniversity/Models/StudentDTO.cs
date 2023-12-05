public class StudentDTO
{
    public int Id { get; set; }
    public string? LastName { get; set; }
    public string? FirstName { get; set; }
    public DateTime? EnrollmentDate { get; set; }

    public StudentDTO() { }

    public StudentDTO(Student student)
    {
        Id = student.Id;
        LastName = student.LastName;
        FirstName = student.FirstName;
        EnrollmentDate = student.EnrollmentDate;
    }
}