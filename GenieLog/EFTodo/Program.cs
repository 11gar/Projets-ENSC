TodoContext context = new TodoContext();
Random rng = new Random();

Todo todo;
Liste list;
list=context.NewListe("Ménage");

context.NewTask("Faire a manger");

todo=context.NewTask("Faire la vaisselle");
todo.addToList(0);

todo=context.NewTask("Faire le ménage");
todo.addToList(0);

context.NewTask("Faire le caca");

foreach(Todo t in context.Todo){
    int rand=rng.Next(2);
    if(rand==1){
        t.Completed=true;
    }
    Console.WriteLine(t);

}

// Console.WriteLine("------Dans la liste 'Ménage'------");
// var liste = context.Todo.Where(e=>e.idListe==0); 
// foreach(Todo t in liste){
//     Console.WriteLine(t);
// }

context.AfficheListe(0);

context.RemoveAllTodos();

context.SaveChanges();
