using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/todo")]
public class TodoController : ControllerBase
{
    private readonly TodoContext _context;
    public TodoController(TodoContext context)
    {
        _context = context;
    }


    // GET: api/item
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Todo>>> GetTodo()
    {

        // Get Todo
        var Todo = _context.Todos;

        return await Todo.ToListAsync();

    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Todo>> GetItemId(int id)
    {
        // Find a specific item
        // SingleAsync() throws an exception if no item is found (which is possible, depending on id)
        // SingleOrDefaultAsync() is a safer choice here
        var item = await _context.Todos.SingleOrDefaultAsync(t => t.Id == id);
        if (item == null)
            return NotFound();

        return item;
    }

    [HttpPost]
    public async Task<ActionResult<String>> PostItem([FromBody] Todo item)
    {
        _context.Todos.Add(item);
        await _context.SaveChangesAsync();

        return "Todo crée avec l'id : " + item.Id + " et la tâche : " + item.Task + " ! ";
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> PutItem(int id, Todo item)
    {
        if (id != item.Id)
            return BadRequest();


        _context.Entry(item).State = EntityState.Modified;


        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Todos.Any(m => m.Id == id))
                return NotFound();
            else
                throw;
        }


        return NoContent();
    }
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteItem(int id)
    {
        var item = await _context.Todos.FindAsync(id);


        if (item == null)
            return NotFound();


        _context.Todos.Remove(item);
        await _context.SaveChangesAsync();


        return NoContent();
    }

}

