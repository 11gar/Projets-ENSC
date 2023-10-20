public enum EGrade{
    A,B,C,D,F
}
public class Enrollment
{

    public int Id { get; set; }
    public EGrade Grade{ get; set; }
    public int StudentId { get; set; }
    public int CourseId { get; set; }
    public Student Student { get; set; }
    public Course Course { get; set; }
    public Enrollment(int id, EGrade grade, int studentId, int courseId, Student student, Course course)
    {
        Id = id;
        Grade = grade;
        StudentId = studentId;
        CourseId = courseId;
        Student = student;
        Course = course;
    }

}
