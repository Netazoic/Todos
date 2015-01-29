package com.netazoic.todos;

import java.io.IOException;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;



import com.netazoic.ent.ENT;
import com.netazoic.ent.ENTException;
import com.netazoic.util.ParseUtil;
import com.netazoic.util.SQLUtil;

public class DO extends ENT<DO> {

	public String doID;
	public String dcCode;
	public Long doRecID;
	public UUID doRecUUID;

	public  enum DO_T{
		sql_Create_DO("/Todos/DO/sql/CreateDO.sql","Create a DO");



		String tPath;
		String desc;
		DO_T(String t, String d){
			tPath = t;
			desc = d;
		}
	}
	DO(Connection con){
		init(con);
	}




	@Override
	public void initENT() {
		this.nitIDField = "doID";
		this.nitTable = "do";
		this.nitName = "DO";
	}




	@Override
	public Long createRecord(Map<String, Object> paramMap, Connection con)
			throws ENTException {
		Long id = null;
		try{
			this.setFieldVals(paramMap);
			for (Field f : this.getClass().getDeclaredFields()){
				paramMap.put(f.getName(), f.get(this));
			}
			id = SQLUtil.getNextID(this.nitIDField, this.nitTable, con);
			paramMap.put(nitIDField, id);
			String q = parseUtil.parseQueryFile(paramMap,DO_T.sql_Create_DO.tPath);
			SQLUtil.execSQL(q, con);
			if(!con.getAutoCommit()) con.commit();

		}catch(Exception ex){
			throw new ENTException(ex);
		}

		return id;
	}


}
