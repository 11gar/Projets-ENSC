public class Detecteur
{

    public void QuelNombre(char[,] matrix)
    {
        int extHaut = nbExtHaut(matrix);
        int extBas = nbExtBas(matrix);
        int extGauche = nbExtGauche(matrix);
        int extDroite = nbExtDroite(matrix);
        int[] ext = { extHaut, extBas, extGauche, extDroite };

        if (ext[0] == 1 && ext[1] == 1 && ext[2] == 0 && ext[3] == 0)
        {
            Console.WriteLine("le nombre est 1");
        }
        if (ext[0] == 0 && ext[1] == 0 && ext[2] == 1 && ext[3] == 1)
        {

            Console.WriteLine("le nombre est 2 ou 5");
        }
        if (ext[0] == 0 && ext[1] == 0 && ext[2] == 3 && ext[3] == 0)
        {
            Console.WriteLine("le nombre est 3");
        }
        if (ext[0] == 2 && ext[1] == 1 && ext[2] == 0 && ext[3] == 0)
        {
            Console.WriteLine("le nombre est 4");
        }
        if (ext[0] == 0 && ext[1] == 0 && ext[2] == 0 && ext[3] == 1)
        {
            Console.WriteLine("le nombre est 6");
        }

        if (ext[0] == 0 && ext[1] == 0 && ext[2] == 0 && ext[3] == 0)
        {
            if (maxRelations(matrix) == 2)
            {
                Console.WriteLine("le nombre est 0");
            }
            else
            {
                Console.WriteLine("le nombre est 8");
            }
        }



        if (ext[0] == 0 && ext[1] == 0 && ext[2] == 1 && ext[3] == 0)
        {
            if (maxRelations(matrix) == 2)
            {
                Console.WriteLine("le nombre est 7");
            }
            else
            {
                Console.WriteLine("le nombre est 9");
            }
        }

    }

    public int maxRelations(char[,] matrix)
    {
        int max = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            int nb = nbRelations(matrix, i);
            if (nb > max)
                max = nb;
        }
        return max;
    }
    public int nbExtGauche(char[,] matrix)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if ((nbEnHaut(matrix, i) == 0) && (nbADroite(matrix, i) == 0) && (nbEnBas(matrix, i) == 0))
            {
                nb++;
            }
        }
        return nb;
    }
    public int nbExtDroite(char[,] matrix)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if ((nbEnHaut(matrix, i) == 0) && (nbAGauche(matrix, i) == 0) && (nbEnBas(matrix, i) == 0))
            {
                nb++;
            }
        }
        return nb;
    }
    public int nbExtHaut(char[,] matrix)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if ((nbEnHaut(matrix, i) == 0) && (nbADroite(matrix, i) == 0) && (nbAGauche(matrix, i) == 0))
            {
                nb++;
            }
        }
        return nb;
    }
    public int nbExtBas(char[,] matrix)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if ((nbEnBas(matrix, i) == 0) && (nbADroite(matrix, i) == 0) && (nbAGauche(matrix, i) == 0))
            {
                nb++;
            }

        }
        return nb;
    }
    public int nbADroite(char[,] matrix, int n)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if (matrix[n, i] == 'd' || matrix[n, i] == 'D')
                nb++;
        }
        return nb;
    }

    public int nbAGauche(char[,] matrix, int n)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if (matrix[i, n] == 'd' || matrix[i, n] == 'D')
                nb++;
        }
        return nb;
    }

    public int nbEnBas(char[,] matrix, int n)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if (matrix[n, i] == 'b' || matrix[n, i] == 'B')
                nb++;
        }
        return nb;
    }

    public int nbEnHaut(char[,] matrix, int n)
    {
        int nb = 0;
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            if (matrix[i, n] == 'b' || matrix[i, n] == 'B')
                nb++;
        }
        return nb;
    }

    public int nbRelations(char[,] matrix, int n)
    {
        int nb = nbADroite(matrix, n) + nbAGauche(matrix, n) + nbEnBas(matrix, n) + nbEnHaut(matrix, n);
        return nb;
    }
}