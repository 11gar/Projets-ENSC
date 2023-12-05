public class EnrollmentDTO
{
    public int Id { get; set; }
    public EGrade Grade { get; set; }
    public StudentDTO Student { get; set; }
    public CourseDTO Course { get; set; }

    public EnrollmentDTO() { }

    public EnrollmentDTO(Enrollment enrollment)
    {
        Id = enrollment.Id;
        Grade = enrollment.Grade ?? EGrade.F;
        Student = new StudentDTO(enrollment.Student);
        Course = new CourseDTO(enrollment.Course);
    }

}