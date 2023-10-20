SeedData data = new SeedData();
printCourses(data);
printStudents(data);
getStudentInfo(data,1);


void printCourses(SeedData data){
    List<Course> courses = new List<Course>();
    foreach(Course c in data.context.Courses){
        courses.Add(c);
    }
    courses.Sort(compareTitleCourse);
    foreach(Course c in courses){
        Console.WriteLine(c);
    }
}

void printStudents(SeedData data){
    List<Student> students = new List<Student>();
    foreach(Student s in data.context.Students){
        students.Add(s);
    }
    students.Sort(compareIdStudent);
    foreach(Student s in students){
        Console.WriteLine(s);
    }
}

void getStudentInfo(SeedData data,int IdStudent){
    foreach(Student s in data.context.Students.Where(e => e.Id==IdStudent)){
        Console.WriteLine(s.FirstName+" "+s.LastName);
    }
    foreach(Enrollment E in data.context.Enrollments.Where(e => e.StudentId==IdStudent)){
        Console.WriteLine("Est noté "+E.Grade+" en "+E.Course.Title);
    }
}


int compareTitleCourse(Course a, Course b){
    return a.Title.CompareTo(b.Title);
}

int compareIdStudent(Student a, Student b){
    return b.Id-a.Id;
}