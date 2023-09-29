
Functions f = new Functions();

char[,] matrice = f.getMatrix("4.txt");
f.afficherMatrice(matrice);

int nb = f.nbExtHaute(matrice);
int nb2 = f.nbExtBas(matrice);
Console.WriteLine(nb2);






