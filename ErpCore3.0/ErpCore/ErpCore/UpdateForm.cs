﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;

using System.Text;
using System.Windows.Forms;

namespace ErpCore
{
    public partial class UpdateForm : Form
    {
        public UpdateForm()
        {
            InitializeComponent();
        }

        private void link_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            System.Diagnostics.Process.Start("http://www.8088net.com"); 
        }

        private void btOK_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("http://www.8088net.com"); 
        }
    }
}
