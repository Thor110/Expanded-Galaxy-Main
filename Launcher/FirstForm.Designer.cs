namespace Launcher
{
    partial class FirstForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FirstForm));
            button1 = new CustomButton();
            button2 = new CustomButton();
            button3 = new CustomButton();
            button4 = new CustomButton();
            button5 = new CustomButton();
            pictureBox1 = new PictureBox();
            checkBox2 = new CheckBox();
            checkBox3 = new CheckBox();
            checkBox4 = new CheckBox();
            checkBox5 = new CheckBox();
            checkBox6 = new CheckBox();
            checkBox7 = new CheckBox();
            checkBox8 = new CheckBox();
            checkBox9 = new CheckBox();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
            // 
            // button1
            // 
            button1.BackColor = Color.Transparent;
            button1.FlatAppearance.BorderColor = Color.Black;
            button1.FlatAppearance.BorderSize = 0;
            button1.FlatAppearance.MouseDownBackColor = Color.Transparent;
            button1.FlatAppearance.MouseOverBackColor = Color.Transparent;
            button1.FlatStyle = FlatStyle.Flat;
            button1.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            button1.ForeColor = SystemColors.AppWorkspace;
            button1.Location = new Point(209, 374);
            button1.Name = "button1";
            button1.Size = new Size(182, 43);
            button1.TabIndex = 0;
            button1.Text = "Exit";
            button1.UseVisualStyleBackColor = false;
            button1.Click += close_Click;
            button1.GotFocus += button_MouseEnter;
            button1.LostFocus += button_MouseLeave;
            button1.MouseDown += button_MouseDown;
            button1.MouseEnter += button_MouseEnter;
            button1.MouseLeave += button_MouseLeave;
            // 
            // button2
            // 
            button2.BackColor = Color.Transparent;
            button2.FlatAppearance.BorderColor = Color.Black;
            button2.FlatAppearance.BorderSize = 0;
            button2.FlatAppearance.MouseDownBackColor = Color.Transparent;
            button2.FlatAppearance.MouseOverBackColor = Color.Transparent;
            button2.FlatStyle = FlatStyle.Flat;
            button2.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            button2.ForeColor = SystemColors.AppWorkspace;
            button2.Location = new Point(209, 332);
            button2.Name = "button2";
            button2.Size = new Size(182, 43);
            button2.TabIndex = 4;
            button2.Text = "Discord";
            button2.UseVisualStyleBackColor = false;
            button2.Click += discord_Click;
            button2.GotFocus += button_MouseEnter;
            button2.LostFocus += button_MouseLeave;
            button2.MouseDown += button_MouseDown;
            button2.MouseEnter += button_MouseEnter;
            button2.MouseLeave += button_MouseLeave;
            // 
            // button3
            // 
            button3.BackColor = Color.Transparent;
            button3.FlatAppearance.BorderColor = Color.Black;
            button3.FlatAppearance.BorderSize = 0;
            button3.FlatAppearance.MouseDownBackColor = Color.Transparent;
            button3.FlatAppearance.MouseOverBackColor = Color.Transparent;
            button3.FlatStyle = FlatStyle.Flat;
            button3.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            button3.ForeColor = SystemColors.AppWorkspace;
            button3.Location = new Point(209, 290);
            button3.Name = "button3";
            button3.Size = new Size(182, 43);
            button3.TabIndex = 3;
            button3.Text = "Website";
            button3.UseVisualStyleBackColor = false;
            button3.Click += website_Click;
            button3.GotFocus += button_MouseEnter;
            button3.LostFocus += button_MouseLeave;
            button3.MouseDown += button_MouseDown;
            button3.MouseEnter += button_MouseEnter;
            button3.MouseLeave += button_MouseLeave;
            // 
            // button4
            // 
            button4.BackColor = Color.Transparent;
            button4.FlatAppearance.BorderColor = Color.Black;
            button4.FlatAppearance.BorderSize = 0;
            button4.FlatAppearance.MouseDownBackColor = Color.Transparent;
            button4.FlatAppearance.MouseOverBackColor = Color.Transparent;
            button4.FlatStyle = FlatStyle.Flat;
            button4.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            button4.ForeColor = SystemColors.AppWorkspace;
            button4.Location = new Point(209, 248);
            button4.Name = "button4";
            button4.Size = new Size(182, 43);
            button4.TabIndex = 2;
            button4.Text = "Configure";
            button4.UseVisualStyleBackColor = false;
            button4.Click += configure_Click;
            button4.GotFocus += button_MouseEnter;
            button4.LostFocus += button_MouseLeave;
            button4.MouseDown += button_MouseDown;
            button4.MouseEnter += button_MouseEnter;
            button4.MouseLeave += button_MouseLeave;
            // 
            // button5
            // 
            button5.BackColor = Color.Transparent;
            button5.FlatAppearance.BorderColor = Color.Black;
            button5.FlatAppearance.BorderSize = 0;
            button5.FlatAppearance.MouseDownBackColor = Color.Transparent;
            button5.FlatAppearance.MouseOverBackColor = Color.Transparent;
            button5.FlatStyle = FlatStyle.Flat;
            button5.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            button5.ForeColor = SystemColors.AppWorkspace;
            button5.Location = new Point(209, 205);
            button5.Name = "button5";
            button5.Size = new Size(182, 43);
            button5.TabIndex = 1;
            button5.Text = "Game";
            button5.UseVisualStyleBackColor = false;
            button5.Click += game_Click;
            button5.GotFocus += button_MouseEnter;
            button5.LostFocus += button_MouseLeave;
            button5.MouseDown += button_MouseDown;
            button5.MouseEnter += button_MouseEnter;
            button5.MouseLeave += button_MouseLeave;
            // 
            // pictureBox1
            // 
            pictureBox1.BackColor = Color.Black;
            pictureBox1.Location = new Point(209, 205);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(182, 168);
            pictureBox1.TabIndex = 9;
            pictureBox1.TabStop = false;
            // 
            // checkBox2
            // 
            checkBox2.AccessibleDescription = "Enables or disables Non Jedi Classes.";
            checkBox2.AutoSize = true;
            checkBox2.BackColor = Color.Transparent;
            checkBox2.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox2.ForeColor = SystemColors.AppWorkspace;
            checkBox2.Location = new Point(236, 215);
            checkBox2.Name = "checkBox2";
            checkBox2.Size = new Size(115, 19);
            checkBox2.TabIndex = 8;
            checkBox2.Text = "Non Jedi Classes";
            checkBox2.UseVisualStyleBackColor = false;
            checkBox2.Visible = false;
            checkBox2.CheckedChanged += checkBox2_CheckedChanged;
            // 
            // checkBox3
            // 
            checkBox3.AccessibleDescription = "Enables or disables health regeneration.";
            checkBox3.AutoSize = true;
            checkBox3.BackColor = Color.Black;
            checkBox3.Checked = true;
            checkBox3.CheckState = CheckState.Checked;
            checkBox3.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox3.ForeColor = SystemColors.AppWorkspace;
            checkBox3.Location = new Point(236, 235);
            checkBox3.Name = "checkBox3";
            checkBox3.Size = new Size(142, 19);
            checkBox3.TabIndex = 10;
            checkBox3.Text = "Health Regeneration";
            checkBox3.UseVisualStyleBackColor = false;
            checkBox3.Visible = false;
            checkBox3.CheckedChanged += checkBox3_CheckedChanged;
            // 
            // checkBox4
            // 
            checkBox4.AccessibleDescription = "Enables or disables fullscreen.";
            checkBox4.AutoSize = true;
            checkBox4.BackColor = Color.Black;
            checkBox4.Checked = true;
            checkBox4.CheckState = CheckState.Checked;
            checkBox4.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox4.ForeColor = SystemColors.AppWorkspace;
            checkBox4.Location = new Point(236, 255);
            checkBox4.Name = "checkBox4";
            checkBox4.Size = new Size(82, 19);
            checkBox4.TabIndex = 11;
            checkBox4.Text = "Fullscreen";
            checkBox4.UseVisualStyleBackColor = false;
            checkBox4.Visible = false;
            checkBox4.CheckedChanged += checkBox4_CheckedChanged;
            // 
            // checkBox5
            // 
            checkBox5.AccessibleDescription = "Enables or disables cheats.";
            checkBox5.AutoSize = true;
            checkBox5.BackColor = Color.Black;
            checkBox5.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox5.ForeColor = SystemColors.AppWorkspace;
            checkBox5.Location = new Point(236, 275);
            checkBox5.Name = "checkBox5";
            checkBox5.Size = new Size(63, 19);
            checkBox5.TabIndex = 12;
            checkBox5.Text = "Cheats";
            checkBox5.UseVisualStyleBackColor = false;
            checkBox5.Visible = false;
            checkBox5.CheckedChanged += checkBox5_CheckedChanged;
            // 
            // checkBox6
            // 
            checkBox6.AccessibleDescription = "Enables or disables the in-game GUI.";
            checkBox6.AutoSize = true;
            checkBox6.BackColor = Color.Black;
            checkBox6.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox6.ForeColor = SystemColors.AppWorkspace;
            checkBox6.Location = new Point(236, 295);
            checkBox6.Name = "checkBox6";
            checkBox6.Size = new Size(129, 19);
            checkBox6.TabIndex = 13;
            checkBox6.Text = "Hide In-Game GUI";
            checkBox6.UseVisualStyleBackColor = false;
            checkBox6.Visible = false;
            checkBox6.CheckedChanged += checkBox6_CheckedChanged;
            // 
            // checkBox7
            // 
            checkBox7.AccessibleDescription = "Enables or disables the mini-map.";
            checkBox7.AutoSize = true;
            checkBox7.BackColor = Color.Black;
            checkBox7.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox7.ForeColor = SystemColors.AppWorkspace;
            checkBox7.Location = new Point(236, 315);
            checkBox7.Name = "checkBox7";
            checkBox7.Size = new Size(108, 19);
            checkBox7.TabIndex = 14;
            checkBox7.Text = "Hide Mini-Map";
            checkBox7.UseVisualStyleBackColor = false;
            checkBox7.Visible = false;
            checkBox7.CheckedChanged += checkBox7_CheckedChanged;
            // 
            // checkBox8
            // 
            checkBox8.AccessibleDescription = "Enables or disables screenshots.";
            checkBox8.AutoSize = true;
            checkBox8.BackColor = Color.Black;
            checkBox8.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox8.ForeColor = SystemColors.AppWorkspace;
            checkBox8.Location = new Point(236, 335);
            checkBox8.Name = "checkBox8";
            checkBox8.Size = new Size(94, 19);
            checkBox8.TabIndex = 15;
            checkBox8.Text = "Screenshots";
            checkBox8.UseVisualStyleBackColor = false;
            checkBox8.Visible = false;
            checkBox8.CheckedChanged += checkBox8_CheckedChanged;
            // 
            // checkBox9
            // 
            checkBox9.AccessibleDescription = "Import a save from KotOR1.";
            checkBox9.AutoSize = true;
            checkBox9.BackColor = Color.Black;
            checkBox9.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            checkBox9.ForeColor = SystemColors.AppWorkspace;
            checkBox9.Location = new Point(236, 355);
            checkBox9.Name = "checkBox9";
            checkBox9.Size = new Size(107, 19);
            checkBox9.TabIndex = 16;
            checkBox9.Text = "Save Importer";
            checkBox9.UseVisualStyleBackColor = false;
            checkBox9.Visible = false;
            checkBox9.CheckedChanged += checkBox9_CheckedChanged;
            // 
            // FirstForm
            // 
            AcceptButton = button5;
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackgroundImage = Properties.Resources.k2swlauncher1;
            BackgroundImageLayout = ImageLayout.Zoom;
            CancelButton = button1;
            ClientSize = new Size(600, 560);
            Controls.Add(checkBox9);
            Controls.Add(checkBox8);
            Controls.Add(checkBox7);
            Controls.Add(checkBox6);
            Controls.Add(checkBox5);
            Controls.Add(checkBox4);
            Controls.Add(checkBox3);
            Controls.Add(checkBox2);
            Controls.Add(button1);
            Controls.Add(button2);
            Controls.Add(button3);
            Controls.Add(button4);
            Controls.Add(button5);
            Controls.Add(pictureBox1);
            DoubleBuffered = true;
            FormBorderStyle = FormBorderStyle.None;
            Icon = (Icon)resources.GetObject("$this.Icon");
            KeyPreview = true;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "FirstForm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Expanded Galaxy";
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private CustomButton button1;
        private CustomButton button2;
        private CustomButton button3;
        private CustomButton button4;
        private CustomButton button5;
        private PictureBox pictureBox1;
        private CheckBox checkBox2;
        private CheckBox checkBox3;
        private CheckBox checkBox4;
        private CheckBox checkBox5;
        private CheckBox checkBox6;
        private CheckBox checkBox7;
        private CheckBox checkBox8;
        private CheckBox checkBox9;
    }
}