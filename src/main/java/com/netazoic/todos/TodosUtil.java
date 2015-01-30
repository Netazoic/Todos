package com.netazoic.todos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.netazoic.ent.ENT;
import com.netazoic.todos.DO.DO_Param;
import com.netazoic.todos.DOClass.DC_Param;
import com.netazoic.todos.DOClass.DC_T;
import com.netazoic.util.ParseUtil;
import com.netazoic.util.RSObj;
import com.netazoic.util.SQLUtil;

public class TodosUtil{
	
	/*
	 * batchDO
	 * Create DO entries for all records in a table
	 */
	public static void batchDO(DOClass dc, DO parentDO, Connection con) throws Exception{
		Statement myStat = null;
		Object doRecID;
		UUID doRecUUID;
		String table,parentID;
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put(DO_Param.doParentID.name(), parentDO.doID);
		paramMap.put(DO_Param.dcCode.name(), dc.dcCode);
		paramMap.put(DC_Param.dcTable.name(),dc.dcTable);
		paramMap.put(DC_Param.dc_PK_Fld.name(), dc.dc_PK_Fld);
		paramMap.put(DC_Param.dc_UUID_Fld.name(), dc.dc_UUID_Fld);
		paramMap.put(DC_Param.dcDB.name(), dc.dcDB);
		ENT<DO> dd = new DO();
		int idx = 0;
		try{
			//String q = ParseUtil.parseQuery(TODOS_T.sql_Batch_Index_Table.tPath, paramMap);
			String q = ParseUtil.parseQuery(DC_T.sql_Get_DC_Records.tPath, paramMap);
			RSObj rso = RSObj.getRSObj(q,"doID",con);
			myStat = con.createStatement();
			ResultSet rs = SQLUtil.execSQL(q, myStat);
			while(rs.next()){
				doRecID = rs.getObject(DO_Param.doRecID.name());
				doRecUUID = UUID.fromString(rs.getString(DO_Param.doRecUUID.name()));
				paramMap.put(DO_Param.doRecID.name(), doRecID);
				paramMap.put(DO_Param.dcCode.name(), dc.dcCode);
				paramMap.put(DO_Param.doRecUUID.name(), doRecUUID);
				dd.createRecord(paramMap, con);
				idx++;
			}

		}	
		catch(Exception ex){
			throw(ex);
		}finally{
			SQLUtil.closeStatement(myStat);
		}
		System.out.println("Created " + idx + " new DO records.");
		
	}



}
