using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetIA2022
{
        public class Node3 : GenericNode
        {
            public int x;
            public int y;
            bool bouee1 = false;
            bool bouee2 = false;

            // Méthodes abstrates, donc à surcharger obligatoirement avec override dans une classe fille
            public override bool IsEqual(GenericNode N2)
            {
                Node3 N2bis = (Node3)N2;

                return (x == N2bis.x) && (y == N2bis.y) && (bouee1 == N2bis.bouee1) && (bouee2 == N2bis.bouee2);
            }

            public override double GetArcCost(GenericNode N2)
            {
                // Ici, N2 ne peut être qu'1 des 8 voisins, inutile de le vérifier
                // Par contre, selon la direction d'avancement, le coût est différent
                Node3 N2bis = (Node3)N2;     // On "cast" car on sait que c'est un objet de la classe Node2.
                
            // Le vent est orienté verticalement du haut vers le bas de l'écran, donc selon des y croissants
                // Premier cas, on est sur la même ligne horizontale, devant ou derrière, vent à 90°
                // => 30 secondes par case
                if ((N2bis.y == y) && (N2bis.x != x))
                    return 30;
                else // Deuxième cas, la case visée est juste au-dessus, on est contre le vent, on met un coût
                 // de 10000, car ce n'est pas impossible, mais il faut y aller à la rame ...
                if ((N2bis.x == x) && (N2bis.y < y))
                    return 10000;
                else // Troisième cas, la case visée est en diagonale au-dessus, donc un peu contre le vent mais
                 // faisable, on met 50s par case
                if ((N2bis.y < y) && (N2bis.x != x))
                    return 50;
                else // Quatrième cas, la case visée est juste en dessous => vent arrière, 20 secondes par case 
                if ((N2bis.x == x) && (N2bis.y > y))
                    return 21;
                else // Cinquième cas, la case visée est vent 3/4 arrière, optimal pour le bateau => 20s par case
                if ((N2bis.y > y) && (N2bis.x != x))
                    return 20;
                else // Normalement on ne devrait pas avoir d'autre cas ...
                    return -1000000;
            }

           public override bool EndState()
            {
                return bouee1 && bouee2 && (x == Form1.xfinal) && (y == Form1.yfinal);
            }

            public override List<GenericNode> GetListSucc()
            {
                List<GenericNode> lsucc = new List<GenericNode>();

                for (int dx = -1; dx <= 1; dx++)
                {
                    for (int dy = -1; dy <= 1; dy++)
                    {
                        if ((x + dx >= 0) && (x + dx < Form1.nbcolonnes)
                            && (y + dy >= 0) && (y + dy < Form1.nblignes) && ((dx != 0) || (dy != 0)))
                            if (Form1.matrice[x + dx, y + dy] > -2)
                            {
                                Node3 newnode3 = new Node3();
                                newnode3.x = x + dx;
                                newnode3.y = y + dy;
                                newnode3.bouee1 = bouee1;
                                newnode3.bouee2 = bouee2;
                            // Si on est sur la bouee1
                            if ((newnode3.x == Form1.xbouee1) && (newnode3.y == Form1.ybouee1))
                                newnode3.bouee1 = true;
                            // Si on est sur la bouee2
                            if ((newnode3.x == Form1.xbouee2) && (newnode3.y == Form1.ybouee2)
                                && newnode3.bouee1)
                                newnode3.bouee2 = true;
                              lsucc.Add(newnode3);
                            }
                    }

                }
                return lsucc;
            }
            public override double CalculeHCost()
            {
            // variables disponibles
            // x et y du noeud examiné
            // bouee1, booléen qui indique si on est déjà passé par la bouée 1.
            // bouee2, booléen qui indique si on est déjà passé par la bouée 2.
            // Form1.xinitial Form1.yinitial
            // Form1.xfinal   Form1.yfinal
            // Form1.xbouee1 et Form1.ybouee1 sont les coordonnées de la bouée 1.
            // Form1.xbouee2 et Form1.ybouee2 sont les coordonnées de la bouée 2.
            // matrice[x,y] indique le type de case  (-1 si bouée, 0 si rien, -2 si obstacle)

            double cost = 0;
            int[] nextGoal = getNextGoal();
            System.Diagnostics.Debug.WriteLine("coords : "+nextGoal[0]+" / "+nextGoal[1]);
            cost = Math.Sqrt(Math.Pow(x - nextGoal[0], 2) + Math.Pow(y - nextGoal[1],2));
            System.Diagnostics.Debug.WriteLine(cost);
      
            return (cost);    
            }

        public double ShortTimeFromNode()
        {
            double time=0;
            int sideNecessaire=Math.Abs(x-Form1.xfinal);
            int upNecessaire=Math.Abs(y-Form1.yfinal);
            int sensY=(y-Form1.yfinal>0?-1:1);
            int upAndSideNecessairee=0;
            if(sideNecessaire>upNecessaire)
            {
                upAndSideNecessairee = upNecessaire;
                sideNecessaire = sideNecessaire-upNecessaire;
                upNecessaire=0;
            }
            else
            {
                upAndSideNecessairee = sideNecessaire;
                upNecessaire = upNecessaire-sideNecessaire;
                sideNecessaire=0;
            }
            if(sensY>0)
            {
                time=upAndSideNecessairee*20+sideNecessaire*30+upNecessaire*21;
            }
            else
            {
                time=upAndSideNecessairee*50+sideNecessaire*30+upNecessaire*50;
            }
            return time;
            
        }

            public int[] getNextGoal()
            {
            int[] coords = {0,0};
            if (!bouee1 && !bouee2)
            {
                coords[0]=Form1.xbouee1;
                coords[1]=Form1.ybouee1;
            }
            else if (bouee1 && !bouee2)
            {
                coords[0]=Form1.xbouee2;
                coords[1]=Form1.ybouee2;
            }
            else
            {
                coords[0]=Form1.xfinal;
                coords[1]=Form1.yfinal;
            }


            return coords;
            }

            public override string ToString()
            {
             string b1;
             string b2;
            if (bouee1) b1 = ":b1:"; else b1 = ":";
            if (bouee2) b2 = ":b2"; else b2 = ":";

                return Convert.ToString(x) + "," + Convert.ToString(y) +b1 + b2 ;
            }
        }
}
