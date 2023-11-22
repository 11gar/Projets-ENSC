using System.ComponentModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/liste")]
public class ListeController : ControllerBase
{
    private readonly TodoContext _context;
    public ListeController(TodoContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Liste>>> GetLists()
    {
        // Get Todo
        var Lists = _context.Listes;
        return await Lists.ToListAsync();

    }
    [HttpGet("{id}")]
    public async Task<ActionResult<IEnumerable<Todo>>> GetListId(int id)
    {
        // Get Todo
        var List = _context.Listes.ToList().Where(l => l.Id == id);
        var Todos = _context.Todos;
        var L = new List<Todo>();
        L = await Todos.Where(t => t.ListeId == id).ToListAsync();

        return L;

    }

}