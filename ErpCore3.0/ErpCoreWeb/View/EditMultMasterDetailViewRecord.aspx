﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditMultMasterDetailViewRecord.aspx.cs" Inherits="View_EditMultMasterDetailViewRecord" %>
<%@ Import Namespace="ErpCoreModel" %>
<%@ Import Namespace="ErpCoreModel.Base" %>
<%@ Import Namespace="ErpCoreModel.Framework" %>
<%@ Import Namespace="ErpCoreModel.UI" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Register TagPrefix="uc1" TagName="ViewRecordCtrl" Src="../CommonCtrl/ViewRecordCtrl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <script charset="utf-8" src="../kindeditor/examples/jquery.js"></script>
    <!--<script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>-->
     <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="../lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="../lib/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
    
    <!--在线编辑器-->
	<link rel="stylesheet" href="../kindeditor/jquery-ui/css/smoothness/jquery-ui-1.9.2.custom.css" />
	<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
	<script charset="utf-8" src="../kindeditor/jquery-ui/js/jquery-ui-1.9.2.custom.js"></script>
	<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>

    <script type="text/javascript">
        

        function onSubmit() {
            document.getElementById("form1").submit();
        } 
        function onCancel() {
            $.post(
                'EditMultMasterDetailViewRecord.aspx',
                {
                vid:'<%=Request["vid"] %>',
                id:'<%=Request["id"] %>',
                ParentId:'<%=Request["ParentId"] %>',
                    Action: 'Cancel'
                },
                 function(data) {
                     if (data == "" || data == null) {
                         parent.onCancelEditMultMasterDetailViewRecord();
                         return true;
                     }
                     else {
                         $.ligerDialog.warn(data);
                         return false;
                     }
                 },
                 'text');
        } 
        
        
        var tab = null;
        $(function ()
        {                
            //Tab
            $("#tabDetail").ligerTab({ 
            height: 400 ,
            onBeforeSelectTabItem: function (tabid)
            {
                tab.reload(tabid);
            }, 
            onAfterSelectTabItem: function (tabid)
            {
                //alert('onAfterSelectTabItem' + tabid);
            } ,
            onBeforeRemoveTabItem: function (tabid)
            {
                return false;
            }
            });
            tab = $("#tabDetail").ligerGetTabManager();
            <%foreach(CBaseObject obj in m_View.ViewDetailMgr.GetList())
            {
                CViewDetail vd = (CViewDetail)obj;
                %>
                f_addTab('<%=vd.Id %>','<%=vd.Name %>','MultDetailListRecord2.aspx?vid=<%=Request["vid"] %>&vdid=<%=vd.Id %>');
                <%
            }
             %>
        });
        function f_addTab(tabid,text, url)
        { 
            tab.addTabItem({ tabid : tabid,text: text, url: url });
        }
        

    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
</head>
<body style="padding:10px">
    <iframe id="submitfrm" name="submitfrm" style="display: none"></iframe>
    <form id="form1" enctype="multipart/form-data" method="post" target="submitfrm">
    <input type="hidden" name="Action" value="PostData"/>
    <input type="hidden" name="vid" value="<%=Request["vid"] %>"/>
    <input type="hidden" name="id" value="<%=Request["id"] %>"/>
    <input type="hidden" name="ParentId" value="<%=Request["ParentId"] %>"/>
    <div >
        <uc1:ViewRecordCtrl ID="recordCtrl" runat="server" />
    <div position="center" id="tabDetail">
    </div>
    </form>
</body>
</html>
