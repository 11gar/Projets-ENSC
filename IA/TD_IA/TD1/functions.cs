public class Functions
{

    public void afficherMatrice(char[,] matrice)
    {
        Console.Write("  ");
        for (int i = 0; i < matrice.GetLength(0); i++)
        {
            Console.Write(" " + i + " ");
        }
        Console.WriteLine();
        for (int i = 0; i < matrice.GetLength(0); i++)
        {
            Console.Write(i + " ");
            for (int j = 0; j < matrice.GetLength(1); j++)
            {
                Console.Write(matrice[i, j] == '0' ? "   " : " " + matrice[i, j] + " ");
            }
            Console.WriteLine();
        }

        Console.WriteLine("////////////////////////////");
    }
    public char[,] getMatrix(string fileName)
    {

        int nbnodes = 0;
        // on s’autorise 100 nœuds maximum
        string myfile = fileName; // Par exemple, en plaçant le fichier un.txt dans bin               // Si le fichier n'existe pas, on ne va pas plus loin !
        if (File.Exists(myfile) == true)
        {
            // Création d'une instance de StreamReader pour permettre la
            // lecture dans le fichier toto. A vous de donner le nom approprié
            // Notez que le dossier par défaut est celui de /bin/debug
            StreamReader monStreamReader = new StreamReader(myfile);
            string ligne = monStreamReader.ReadLine();
            nbnodes = Convert.ToInt32(ligne); // Nombre de nœuds du graphe
            char[,] matrix = new char[nbnodes + 1, nbnodes + 1];
            for (int i = 0; i < nbnodes; i++)
                for (int j = 0; j < nbnodes; j++)
                    matrix[i, j] = '0'; // On initialise à « 0 »
            ligne = monStreamReader.ReadLine();
            while (ligne != null) // Tant qu’il reste une ligne dans le fichier
            {
                int x = Convert.ToInt32(ligne);
                ligne = monStreamReader.ReadLine();
                int y = Convert.ToInt32(ligne);
                ligne = monStreamReader.ReadLine();
                matrix[x, y] = ligne[0]; // C’est « d » ou « b » normalement
                ligne = monStreamReader.ReadLine();
            }
            // Fermeture du StreamReader (obligatoire)
            monStreamReader.Close();
            return matrix;
        }
        return null;
    }

    public void afficherNombre(char[,] matrice)
    {
        Console.Clear();
        Console.SetCursorPosition(0, 0);
        for (int i = 0; i < matrice.GetLength(0); i++)
        {
            for (int j = 0; j < matrice.GetLength(1); j++)
            {
                Console.Write(" ");
            }
            Console.WriteLine();
        }
        Console.SetCursorPosition(0, 0);
        int coef = 1;
        for (int i = 0; i < matrice.GetLength(0); i++)
        {
            for (int j = 0; j < matrice.GetLength(1); j++)
            {
                if (matrice[i, j] == 'd')
                {
                    Console.SetCursorPosition(i * coef, j * coef);
                    Console.Write("-");
                }
                if (matrice[i, j] == 'b')
                {
                    Console.SetCursorPosition(i * coef, j * coef);
                    Console.Write("|");
                }
            }
            Console.WriteLine();
        }
    }



}