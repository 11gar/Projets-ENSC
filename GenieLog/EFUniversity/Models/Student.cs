public class Student
{
    public int Id { get; set; }
    public string LastName { get; set; }
    public string FirstName { get; set; }
    public DateTime EnrollmentDate { get; set; }
    public ICollection<Enrollment> Enrollments { get; set; }

    public Student(int id, string lastName, string firstName, string enrollmentDate)
    {
        Id = id;
        LastName = lastName;
        FirstName = firstName;
        
        if (DateTime.TryParse(enrollmentDate, out DateTime parsedEnrollmentDate))
        {
            EnrollmentDate = parsedEnrollmentDate;
        }
        else
        {
            EnrollmentDate = DateTime.MinValue;
        }
        Enrollments = new List<Enrollment>();
    }
}
