namespace ProjetIA2022
{
    partial class Form1
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.textBoxYinit = new System.Windows.Forms.TextBox();
            this.textBoxXInit = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.textBoxXFinal = new System.Windows.Forms.TextBox();
            this.textBoxYFinal = new System.Windows.Forms.TextBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.buttonAstarBouees = new System.Windows.Forms.Button();
            this.buttonInit3 = new System.Windows.Forms.Button();
            this.buttonAstarpb1 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.labelOuverts = new System.Windows.Forms.Label();
            this.labelFermes = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.label10 = new System.Windows.Forms.Label();
            this.labeltpstotal = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            this.SuspendLayout();
            // 
            // textBoxYinit
            // 
            this.textBoxYinit.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxYinit.Location = new System.Drawing.Point(75, 98);
            this.textBoxYinit.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxYinit.Name = "textBoxYinit";
            this.textBoxYinit.Size = new System.Drawing.Size(100, 26);
            this.textBoxYinit.TabIndex = 0;
            this.textBoxYinit.Text = "10";
            // 
            // textBoxXInit
            // 
            this.textBoxXInit.Enabled = false;
            this.textBoxXInit.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxXInit.Location = new System.Drawing.Point(75, 59);
            this.textBoxXInit.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxXInit.Name = "textBoxXInit";
            this.textBoxXInit.Size = new System.Drawing.Size(100, 26);
            this.textBoxXInit.TabIndex = 1;
            this.textBoxXInit.Text = "0";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(5, 62);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 20);
            this.label1.TabIndex = 2;
            this.label1.Text = "Xinit";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(11, 100);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 20);
            this.label2.TabIndex = 3;
            this.label2.Text = "Yinit";
            // 
            // listBox1
            // 
            this.listBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 20;
            this.listBox1.Location = new System.Drawing.Point(1155, 194);
            this.listBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(264, 204);
            this.listBox1.TabIndex = 4;
            // 
            // treeView1
            // 
            this.treeView1.Location = new System.Drawing.Point(1155, 492);
            this.treeView1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.treeView1.Name = "treeView1";
            this.treeView1.Size = new System.Drawing.Size(264, 196);
            this.treeView1.TabIndex = 5;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(437, 194);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(500, 500);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pictureBox1.TabIndex = 7;
            this.pictureBox1.TabStop = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(11, 185);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 20);
            this.label3.TabIndex = 8;
            this.label3.Text = "Xfinal";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(11, 234);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(50, 20);
            this.label4.TabIndex = 9;
            this.label4.Text = "Yfinal";
            // 
            // textBoxXFinal
            // 
            this.textBoxXFinal.Enabled = false;
            this.textBoxXFinal.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxXFinal.Location = new System.Drawing.Point(75, 185);
            this.textBoxXFinal.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxXFinal.Name = "textBoxXFinal";
            this.textBoxXFinal.Size = new System.Drawing.Size(100, 26);
            this.textBoxXFinal.TabIndex = 10;
            this.textBoxXFinal.Text = "19";
            // 
            // textBoxYFinal
            // 
            this.textBoxYFinal.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxYFinal.Location = new System.Drawing.Point(75, 231);
            this.textBoxYFinal.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxYFinal.Name = "textBoxYFinal";
            this.textBoxYFinal.Size = new System.Drawing.Size(100, 26);
            this.textBoxYFinal.TabIndex = 11;
            this.textBoxYFinal.Text = "12";
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(-3, 458);
            this.pictureBox2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(263, 211);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pictureBox2.TabIndex = 12;
            this.pictureBox2.TabStop = false;
            // 
            // buttonAstarBouees
            // 
            this.buttonAstarBouees.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonAstarBouees.Location = new System.Drawing.Point(475, 78);
            this.buttonAstarBouees.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonAstarBouees.Name = "buttonAstarBouees";
            this.buttonAstarBouees.Size = new System.Drawing.Size(265, 35);
            this.buttonAstarBouees.TabIndex = 13;
            this.buttonAstarBouees.Text = "Lancer A* pb bouées env2";
            this.buttonAstarBouees.UseVisualStyleBackColor = true;
            this.buttonAstarBouees.Click += new System.EventHandler(this.buttonAstarBouees_Click);
            // 
            // buttonInit3
            // 
            this.buttonInit3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonInit3.Location = new System.Drawing.Point(781, 27);
            this.buttonInit3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonInit3.Name = "buttonInit3";
            this.buttonInit3.Size = new System.Drawing.Size(215, 30);
            this.buttonInit3.TabIndex = 14;
            this.buttonInit3.Text = "Voir environnement 3";
            this.buttonInit3.UseVisualStyleBackColor = true;
            this.buttonInit3.Click += new System.EventHandler(this.buttonInit3_Click);
            // 
            // buttonAstarpb1
            // 
            this.buttonAstarpb1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonAstarpb1.Location = new System.Drawing.Point(215, 76);
            this.buttonAstarpb1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonAstarpb1.Name = "buttonAstarpb1";
            this.buttonAstarpb1.Size = new System.Drawing.Size(215, 38);
            this.buttonAstarpb1.TabIndex = 15;
            this.buttonAstarpb1.Text = "Lancer A* pb simple env1";
            this.buttonAstarpb1.UseVisualStyleBackColor = true;
            this.buttonAstarpb1.Click += new System.EventHandler(this.buttonAstar_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(1071, 59);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(94, 20);
            this.label5.TabIndex = 16;
            this.label5.Text = "Nb Ouverts";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(1071, 82);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(87, 20);
            this.label6.TabIndex = 17;
            this.label6.Text = "Nb fermés";
            // 
            // labelOuverts
            // 
            this.labelOuverts.AutoSize = true;
            this.labelOuverts.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelOuverts.Location = new System.Drawing.Point(1180, 59);
            this.labelOuverts.Name = "labelOuverts";
            this.labelOuverts.Size = new System.Drawing.Size(18, 20);
            this.labelOuverts.TabIndex = 18;
            this.labelOuverts.Text = "0";
            // 
            // labelFermes
            // 
            this.labelFermes.AutoSize = true;
            this.labelFermes.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelFermes.Location = new System.Drawing.Point(1180, 82);
            this.labelFermes.Name = "labelFermes";
            this.labelFermes.Size = new System.Drawing.Size(18, 20);
            this.labelFermes.TabIndex = 19;
            this.labelFermes.Text = "0";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(1156, 167);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(129, 20);
            this.label7.TabIndex = 20;
            this.label7.Text = "Chemin solution";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(1163, 466);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(153, 20);
            this.label8.TabIndex = 21;
            this.label8.Text = "Arbre de recherche";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.BackColor = System.Drawing.Color.White;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(459, 158);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(267, 25);
            this.label9.TabIndex = 22;
            this.label9.Text = "Abscisses : valeurs de 0 à 19";
            // 
            // pictureBox3
            // 
            this.pictureBox3.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox3.Image")));
            this.pictureBox3.Location = new System.Drawing.Point(377, 194);
            this.pictureBox3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(37, 374);
            this.pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pictureBox3.TabIndex = 23;
            this.pictureBox3.TabStop = false;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(978, 129);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(107, 20);
            this.label10.TabIndex = 24;
            this.label10.Text = "Temps total :";
            // 
            // labeltpstotal
            // 
            this.labeltpstotal.AutoSize = true;
            this.labeltpstotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labeltpstotal.Location = new System.Drawing.Point(1091, 129);
            this.labeltpstotal.Name = "labeltpstotal";
            this.labeltpstotal.Size = new System.Drawing.Size(18, 20);
            this.labeltpstotal.TabIndex = 25;
            this.labeltpstotal.Text = "0";
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(207, 27);
            this.button1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(223, 30);
            this.button1.TabIndex = 26;
            this.button1.Text = "Voir environnement 1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(493, 27);
            this.button2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(223, 30);
            this.button2.TabIndex = 27;
            this.button2.Text = "Voir environnement 2";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.Location = new System.Drawing.Point(766, 78);
            this.button3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(265, 35);
            this.button3.TabIndex = 28;
            this.button3.Text = "Lancer A* pb bouées env3";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1243, 758);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.labeltpstotal);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.pictureBox3);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.labelFermes);
            this.Controls.Add(this.labelOuverts);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.buttonAstarpb1);
            this.Controls.Add(this.buttonInit3);
            this.Controls.Add(this.buttonAstarBouees);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.textBoxYFinal);
            this.Controls.Add(this.textBoxXFinal);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.treeView1);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxXInit);
            this.Controls.Add(this.textBoxYinit);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "Form1";
            this.Text = "Projet IA 2023";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxYinit;
        private System.Windows.Forms.TextBox textBoxXInit;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBoxXFinal;
        private System.Windows.Forms.TextBox textBoxYFinal;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Button buttonAstarBouees;
        private System.Windows.Forms.Button buttonInit3;
        private System.Windows.Forms.Button buttonAstarpb1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label labelOuverts;
        private System.Windows.Forms.Label labelFermes;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label labeltpstotal;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
    }
}

