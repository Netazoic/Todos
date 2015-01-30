package com.netazoic.todos;

import java.sql.Connection;
import java.util.Map;

import com.netazoic.ent.ENT;
import com.netazoic.ent.ENTException;

public class DOClass extends ENT<DOClass>{

	public String dcCode;
	public String dcName;
	public String dcDesc;
	public String dcDB;
	public String dcTable;
	public String dc_PK_Fld;
	public String dc_UUID_Fld;
	
	public enum DC_Param{
		dcCode,dcName,dcDesc,dcDB,dcTable,dc_PK_Fld, dc_UUID_Fld
	}
	
	public  enum DC_T{
		sql_Get_DC_Records("/Todos/DC/sql/GetDCRecords.sql","Get a resultset of all records in DC table"), 
		;
	
	
		String tPath;
		String desc;
		DC_T(String t, String d){
			tPath = t;
			desc = d;
		}
	}
	
	DOClass(String code, Connection con) throws ENTException{
		super.init(code, con);
	}
	
	@Override
	public void initENT() {
		this.nitIDField = "dcCode";
		this.nitTable = "do_class";
		this.nitName = "DO Class";
		
	}

	@Override
	public Long createRecord(Map<String, Object> paramMap, Connection con)
			throws ENTException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteRecord(String webuserID, String comments)
			throws ENTException {
		// TODO Auto-generated method stub
		
	}

}
