package com.netazoic.todos;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.netazoic.ent.ENT;
import com.netazoic.ent.ENTException;
import com.netazoic.util.SQLUtil;

public class DO extends ENT<DO> {

	public Long doID;
	public String dcCode;
	public Long doRecID;
	public UUID doRecUUID;
	public Long doParentID;
	
	public Integer lft,rgt;

	public enum DO_Class{
		PARENT,CHILD,SELF
	}
	public enum DO_Route{
		cdo("cdo","Create DO"),
		idxTable("idxTable","Index a table"),
		rdo("rdo","Retrieve DO"),
		udo("udo","Update DO"),
		ddo("ddo","Delete DO"),
		lndo("lndo","Link DO"),
		lsdo("lsdo", "List DOs");
		;

		public String route;
		public String desc;

		DO_Route(String r, String d){
			route = r;
			desc = d;
		}
	}
	
	public enum DO_Param{
		doID,doRecID,dcCode,doRecUUID, doParentID, doID_1, doID_2
	}

	public  enum DO_T{
		sql_Create_DO("/Todos/DO/sql/CreateDO.sql","Create a DO"), 
		sql_Create_DO_Parent("/Todos/DO/sql/CreateDOParent.sql","Create a parent pointer");
	
	
	
		String tPath;
		String desc;
		DO_T(String t, String d){
			tPath = t;
			desc = d;
		}
	}

	DO() throws ENTException{init();}
	DO(Connection con) throws ENTException{super.init(con);}
	
	DO(Long id,Connection con) throws ENTException{
		super.init(id,con);
	}

	@Override
	public void initENT() {
		this.nit.fld_nitID = "doID";
		this.nit.nitTable = "do";
		this.nit.nitName = "DO";
	}




	@Override
	public Long createRecord(HashMap<String, Object> paramMap, Connection con)
			throws ENTException {
		Long id = null;
		try{
			setFieldVals(paramMap);
			loadParamMap(paramMap);
			id = SQLUtil.getNextID(nit.fld_nitID, nit.nitTable, con);
			paramMap.put(nit.fld_nitID, id);
			String q = parseUtil.parseQueryFile(paramMap,DO_T.sql_Create_DO.tPath);
			SQLUtil.execSQL(q, con);
			if(!con.getAutoCommit()) con.commit();
			//Create parent pointer if specified
			if(this.doParentID != null){
				this.doID = id;
				createParent(doParentID,con);
			}

		}catch(Exception ex){
			throw new ENTException(ex);
		}

		return id;
	}
	public void createParent(Long doParentID,Connection con) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put(DO_Param.doID_1.name(), doParentID);
		map.put(DO_Param.doID_2.name(), doID);
		map.put(DO_Param.dcCode.name(), DO_Class.PARENT);
		String q = parseUtil.parseQueryFile(map, DO_T.sql_Create_DO_Parent.tPath);
		SQLUtil.execSQL(q, con);
	}


	@Override
	public void deleteRecord(String webuserID, String comments)
			throws ENTException {
		// TODO Auto-generated method stub
		
	}
	public void updateRecord(HashMap<String, Object> paramMap)
			throws ENTException {
		// TODO Auto-generated method stub
		
	}



}
