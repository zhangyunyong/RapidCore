// File:    CTableAccessInOrgMgr.cs
// Author:  ��Т��
// email:   ganxiaojian@hotmail.com 
// QQ:      154986287
// http://www.8088net.com
// Э��������������Ϊ��Դϵͳ����ѭ���ʿ�Դ��֯Э�顣�κε�λ����˿���ʹ�û��޸ı�����Դ�룬
//          ����������Ϊ����ҵ����ҵ��;��������ʹ�ñ�Դ���������һ�к���������޹ء�
//          δ���������ɣ���ֹ�κ���ҵ�����ֱ�ӳ��۱�Դ����߰ѱ�������Ϊ�����Ĺ��ܽ������ۻ��
//          ���߽�����׷�����ε�Ȩ����
// Created: 2011��7��10�� 14:46:37
// Purpose: Definition of Class CTableAccessInOrgMgr

using System;
using System.Text;
using System.Collections.Generic;
using ErpCoreModel.Framework;

namespace ErpCoreModel.Base
{

    public class CTableAccessInRoleMgr : CBaseObjectMgr
    {

        public CTableAccessInRoleMgr()
        {
            TbCode = "B_TableAccessInRole";
            ClassName = "ErpCoreModel.Base.CTableAccessInRole";
        }

        public CTableAccessInRole FindByTable(Guid FW_Table_id)
        {
            List<CBaseObject> lstObj = GetList();
            foreach (CBaseObject obj in lstObj)
            {
                CTableAccessInRole tair = (CTableAccessInRole)obj;
                if (tair.FW_Table_id == FW_Table_id)
                    return tair;
            }
            return null;
        }
    }
}