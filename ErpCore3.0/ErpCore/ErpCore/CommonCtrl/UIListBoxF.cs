﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;

using System.Text;
using System.Windows.Forms;
using ErpCoreModel;
using ErpCoreModel.Base;
using ErpCoreModel.Framework;
using ErpCoreModel.UI;
using ErpCore.Window;

namespace ErpCore.CommonCtrl
{
    public partial class UIListBoxF : UserControl, IWindowCtrl
    {

        string captionText = "";
        bool showTitleBar = false;

        CBaseObjectMgr baseObjectMgr = null;
        CTableInFormControl tableInFormControl = null;

        public UIListBoxF()
        {
            InitializeComponent();
        }



        public ControlType GetCtrlType()
        {
            return ControlType.ListBox;
        }

        public CTableInFormControl TableInFormControl
        {
            get { return tableInFormControl; }
            set
            {
                tableInFormControl = value;
                LoadData();
            }
        }
        public CBaseObjectMgr BaseObjectMgr
        {
            get { return baseObjectMgr; }
            set
            {
                baseObjectMgr = value;
                LoadData();
            }
        }
        public string CaptionText
        {
            get { return captionText; }
            set
            {
                captionText = value;
                lbTitle.Text = captionText;
            }
        }

        public bool ShowTitleBar
        {
            get { return showTitleBar; }
            set
            {
                showTitleBar = value;
                tbTitle.Visible = showTitleBar;
            }
        }

        public void LoadData()
        {
            if (BaseObjectMgr == null)
                return;
            if (TableInFormControl == null)
                return;
            
            listBox.Items.Clear();
            foreach (CBaseObject obj in BaseObjectMgr.GetList())
            {
                string sText = TableInFormControl.Text.ToLower();
                int iStart = 0;
                while (sText.IndexOf('[', iStart) > -1)
                {
                    int idx1 = sText.IndexOf('[', iStart);
                    int idx2 = sText.IndexOf(']', idx1);
                    iStart = idx1 + 1;
                    if (idx2 > idx1)
                    {
                        string sCodeN = sText.Substring(idx1, idx2 - idx1 + 1);
                        string sCode = sCodeN.Substring(1, sCodeN.Length - 2);
                        CColumn column = BaseObjectMgr.Table.ColumnMgr.FindByCode(sCode);
                        if (column == null)
                            continue;
                        string sVal = obj.GetColValue(column).ToString();
                        sText = sText.Replace(sCodeN, sVal);
                    }
                }

                DataItem item = new DataItem();
                item.name = sText;
                item.Data = obj;
                listBox.Items.Add(item);
            }
        }

        //界面公式取值
        public object GetSelectValue(string sColCode)
        {
            if (listBox.SelectedItem == null)
                return null;
            DataItem item = (DataItem)listBox.SelectedItem;
            CBaseObject obj = (CBaseObject)item.Data;

            CColumn col = obj.Table.ColumnMgr.FindByCode(sColCode);
            if (col == null)
                return null;
            return obj.GetColValue(col);
        }
    }
}
