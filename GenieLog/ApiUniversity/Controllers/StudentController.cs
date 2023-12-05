using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ApiTodo.Controllers;

[ApiController]
[Route("api/students")]
public class StudentController : ControllerBase
{
    private readonly UniversityContext _context;

    public StudentController(UniversityContext context)
    {
        _context = context;
    }

    // GET: api/todo
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Student>>> GetStudents()
    {
        // Get todos and related lists
        var students = _context.Students;
        return await students.ToListAsync();
    }

    //GET: api/todo/2
    [HttpGet("{id}")]
    public async Task<ActionResult<Student>> GetStudent(int id)
    {
        // Find todo and related listt
        // SingleAsync() throws an exception if no todo is found (which is possible, depending on id)
        // SingleOrDefaultAsync() is a safer choice here
        var students = await _context.Students.ToListAsync();
        var student = students.Find(s => s.Id == id);

        if (student == null)
            return NotFound();

        return student;
    }

    // // POST: api/todo
    [HttpPost]
    public async Task<ActionResult<Student>> PostTodo(Student student)
    {
        _context.Students.Add(student);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetStudent), new { id = student.Id }, student);
    }

    // // PUT: api/todo/2
    // [HttpPut("{id}")]
    // public async Task<IActionResult> PutTodo(int id, Todo todo)
    // {
    //     if (id != todo.Id)
    //         return BadRequest();

    //     _context.Entry(todo).State = EntityState.Modified;

    //     try
    //     {
    //         await _context.SaveChangesAsync();
    //     }
    //     catch (DbUpdateConcurrencyException)
    //     {
    //         if (!_context.Todos.Any(m => m.Id == id))
    //             return NotFound();
    //         else
    //             throw;
    //     }

    //     return NoContent();
    // }

    // // DELETE: api/todo/2
    // [HttpDelete("{id}")]
    // public async Task<IActionResult> DeleteTodoItem(int id)
    // {
    //     var todo = await _context.Todos.FindAsync(id);

    //     if (todo == null)
    //         return NotFound();

    //     _context.Todos.Remove(todo);
    //     await _context.SaveChangesAsync();

    //     return NoContent();
    // }
}