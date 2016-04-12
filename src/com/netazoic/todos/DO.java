package com.netazoic.todos;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	public String doTitle;
	
	private PreparedStatement psCreateDO = null;
	
	public Integer lft,rgt;

	public enum DO_Class{
		EO,DO,TAG,PARENT,CHILD,SELF
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
		doID,doRecID,dcCode,doRecUUID, doParentID, doID_1, doID_2, doTitle, uuID
	}

	public  enum DO_TPL{
		sql_ps_Create_DO("/Todos/DO/sql/psCreateDO.sql","Create a DO"), 
		sql_Create_DO("/Todos/DO/sql/CreateDO.sql","Create a DO"), 
		sql_Create_DO_Parent("/Todos/DO/sql/CreateDOParent.sql","Create a parent pointer");
	
	
	
		String tPath;
		String desc;
		DO_TPL(String t, String d){
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
	public void initENT() throws ENTException {
		nit.ENTITY_NAME = "DO";
		nit.FLD_NIT_ID = "doID";
		nit.NIT_TABLE = "public.Do";
		super.initENT();
	}




	@Override
	public Long createRecord(HashMap<String, Object> paramMap, Connection con)
			throws ENTException {
		Long id = null;
		try{
			setFieldVals(paramMap);
			loadParamMap(paramMap);
			//id = SQLUtil.getNextID(nit.fld_nitID, nit.nitTable, con);
			//paramMap.put(nit.fld_nitID, id);
			if(psCreateDO ==null){
				String q = parseUtil.parseQueryFile(paramMap,DO_TPL.sql_ps_Create_DO.tPath);
				psCreateDO = con.prepareStatement(q);
			}
			psCreateDO.setString(4, doTitle);
			psCreateDO.setString(1, DO_Class.DO.name());
			//TODO do we need a doRecID?
			psCreateDO.setInt(2, 0);
			psCreateDO.setString(3, this.doRecUUID+"");
			doID = SQLUtil.execSQLLong(psCreateDO, con);
			if(!con.getAutoCommit()) con.commit();
			//Create parent pointer if specified
			if(this.doParentID != null){
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
		String q = parseUtil.parseQueryFile(map, DO_TPL.sql_Create_DO_Parent.tPath);
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
