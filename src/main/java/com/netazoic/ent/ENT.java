package com.netazoic.ent;

import java.io.IOException;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.netazoic.util.SQLUtil;



public abstract class ENT<T> implements IF_Ent<T>{

	public Field nitIDField;
	public String fld_nitID = null;
	public String sql_RetrieveENT;
	public String sql_CreateEVT;

	public String nitName = null;
	public String nitID = null;
	public String nitCode = null;
	public String nitTitle = null;
	public String nitDesc = null;
	public String nitURL = null;
	public String nitTypeCode = null;

	public String nitTable = null;

	@JsonIgnore 
	public Connection con;

	public void init(Connection con){
		this.con = con;
	}

	public void init(String id, Connection con){
		this.con = con;

	}
	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#copyRecord(com.netazoic.ent.IF_Ent, java.lang.String)
	 */
	public void copyRecord(IF_Ent<T> entS,String webuserID)
			throws ENTException{
		//overwrite with actual class if desired
	}

	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#createRecord(javax.servlet.http.HttpServletRequest, java.sql.Connection)
	 */
	public abstract String createRecord(Map<String,Object> paramMap,	Connection con) throws ENTException, SQLException, IOException;

	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#deleteRecord(java.lang.String, java.lang.String)
	 */
	public void deleteRecord(String webuserID, String comments)
			throws ENTException {
		// TODO Auto-generated method stub

	}

	public static List<Field> getAllFields(List<Field> fields, Class<?> type) {
		// http://stackoverflow.com/questions/1042798/retrieving-the-inherited-attribute-names-values-using-java-reflection
		for (Field field: type.getDeclaredFields()) {
			fields.add(field);
		}

		if (type.getSuperclass() != null) {
			fields = getAllFields(fields, type.getSuperclass());
		}

		return fields;
	}

	public static List<Field> getAllFields(List<Field> fields, Class<?> type,boolean flgInherit) {
		// http://stackoverflow.com/questions/1042798/retrieving-the-inherited-attribute-names-values-using-java-reflection
		for (Field field: type.getDeclaredFields()) {
			fields.add(field);
		}
		if(flgInherit){
			if (type.getSuperclass() != null) {
				fields = getAllFields(fields, type.getSuperclass());
			}		
		}

		return fields;
	}

	public static List<Field> getFields(List<Field> fields, Class<?> type, boolean flgInherit, boolean flgPublic) {
		// http://stackoverflow.com/questions/1042798/retrieving-the-inherited-attribute-names-values-using-java-reflection

		if(flgPublic)
			for (Field field: type.getFields()) {
				fields.add(field);
			}

		else
			for (Field field: type.getDeclaredFields()) {
				fields.add(field);
			}

		if(flgInherit){
			if (type.getSuperclass() != null) {
				fields = getAllFields(fields, type.getSuperclass());
			}		
		}

		return fields;
	}
	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#getJSON()
	 */
	public String getJSON() throws  ENTException{
		String json = null;
		//Jackson
		ObjectMapper jackson = new ObjectMapper();
		jackson.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, false);
		try {
			//json = jackson.writerWithView(JView.R_Std.class).writeValueAsString(obj);
			json = jackson.writer().writeValueAsString(this);
			//json = jackson.writeValueAsString(this);
		} catch (JsonGenerationException e) {
			throw new ENTException(e);
		} catch (JsonMappingException e) {
			throw new ENTException(e);
		} catch (IOException e) {
			throw new ENTException(e);
		}
		return json;
	}

	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#retrieveRecord()
	 */
	public void retrieveRecord() throws ENTException {
		Statement stat = null;
		try{
			Object nitIDObj;
			if(nitIDField == null) 	nitIDField = this.getClass().getField(fld_nitID);
			nitIDObj = nitIDField.get(this);
			if(nitIDObj == null) throw new Exception("Must first set record ID value.");
			String fPath = sql_RetrieveENT;
			Map<String, Object> settings = new HashMap<String, Object>();
			settings.put(nitIDField.getName(), nitIDObj);
			String sql = SQLUtil.parseQueryFile(settings, fPath);
			stat = con.createStatement();
			ResultSet rs = SQLUtil.execSQL(sql,stat);
			nitID = nitIDObj.toString();
			setFieldVals(rs);
			//twiddleWebuserIterator();
		}catch(Exception ex){
			throw new ENTException(ex);
		}finally{
			if(stat != null) try{stat.close();stat = null;}catch(Exception ex){}
		}	

	}

	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#retrieveRecord(javax.servlet.http.HttpServletRequest)
	 */
	public void retrieveRecord(Map<String,Object> paramMap)
			throws ENTException{
		String idTemp = null;

		try {
			idTemp = (String)paramMap.get(nitIDField.getName());
			if(idTemp == null) throw new ENTException("Could not determine record ID");
			setIDFieldVal(idTemp);
			retrieveRecord();
		} catch (SecurityException e) {
			throw new ENTException(e);
		}
	}


	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#setFieldVals(java.sql.ResultSet)
	 */
	public void setFieldVals(ResultSet rs) throws SQLException{
		//load object fields from similarly named db fields
		/*
		 * At this level, the setFieldVals function can only set values on Public fields in the 
		 * extending class. If you wish to work with private or package scope fields, override
		 * this function with a copy in the local class.
		 */
		List<Field> flds= getAllFields(new LinkedList<Field>(),this.getClass());
		//Field[] flds = this.getClass().getDeclaredFields();
		Object val;
		String fld;
		Class type;
		rs.next();
		int idx = 0;
		ResultSetMetaData rsmd = rs.getMetaData();
		Map<String,Integer> colMap = new HashMap<String,Integer>();
		for (int i = 1; i < rsmd.getColumnCount()+1; i++){
			colMap.put(rsmd.getColumnName(i).toLowerCase(), i);
		}
		for(Field f : flds){
			try{
				fld = f.getName();
				if(!colMap.containsKey(fld.toLowerCase()))continue;
				val = rs.getObject(fld);
				//if(val==null) continue;
				type = f.getType();
				if( type.isInstance(val)){
					//nada, type is the same between rs and object. No conversion necessary.
				}
				else if((type.equals(Integer.class) || (type.equals(int.class))) && ( val instanceof java.math.BigDecimal)){
					BigDecimal mybd = (BigDecimal)val;
					val = mybd.intValueExact();					
				}
				else if(type.equals(String.class) && val instanceof java.math.BigDecimal){
					//need to convert to a String
					val = val.toString();
				}
				else if(type.equals(java.sql.Date.class) && val instanceof java.sql.Timestamp){
					Timestamp ts = (Timestamp)val;
					val = new java.sql.Date(ts.getTime());
				}
				else if(type.equals(java.util.Date.class) && val instanceof java.sql.Timestamp){
					Timestamp ts = (Timestamp)val;
					val = new java.util.Date(ts.getTime());
				}
				else if (type.equals(String.class) && val instanceof java.sql.Date){
					//need to convert Date to a String
					val = val.toString();
				}
				f.set(this, val);
			}catch(Exception ex){
				@SuppressWarnings("unused")
				String msg = ex.getMessage();
				continue;
			}
		}
	}

	public void setIDFieldVal(String id) throws ENTException{
		try {
			if(nitIDField == null) nitIDField = this.getClass().getField(fld_nitID);
			if(nitIDField == null) throw new ENTException("Could not determine ID field");

			nitIDField.set(this, id);
		} catch (IllegalArgumentException e) {
			throw new ENTException(e);
		} catch (IllegalAccessException e) {
			throw new ENTException(e);
		} catch (NoSuchFieldException e) {
			throw new ENTException(e);
		} catch (SecurityException e) {
			throw new ENTException(e);
		}

	}

	/* (non-Javadoc)
	 * @see com.netazoic.ent.IF_Ent#updateRecord(javax.servlet.http.HttpServletRequest)
	 */
	public void updateRecord(Map<String,Object> paramMap) throws ENTException{
		boolean flgInherit = true;
		boolean flgPublic = true;
		try {
			updateRecord(paramMap, flgInherit,flgPublic);
		} catch (SQLException ex) {
			throw new ENTException(ex);
		}
	}

	public void updateRecord(Map<String,Object> paramMap, boolean flgInherit, boolean flgPublic) throws ENTException, SQLException{

		//Update a record based on form input
		//Only update the fields that are actually present in the form input
		//Works with multi-page forms
		try{
			assert(nitTable != null && fld_nitID != null && nitID != null);
		}catch(Exception ex){
			throw new ENTException("nit variables not set for this object.  Cannot update record.");
		}
		Set<Entry<String,Object>> params = paramMap.entrySet();
		Map<String,Field> fldMap = new HashMap();
		List<Field> flds= getFields(new LinkedList<Field>(),this.getClass(),flgInherit, flgPublic);
		for(Field f : flds){
			if(f.getName().equals(fld_nitID)) continue;
			fldMap.put(f.getName(), f);
		}

		String fld;
		Object val;
		Class fType;
		Field f;
		Date d = new Date();
		Timestamp ts = new Timestamp(12345);

		String q;
		q = "UPDATE " + nitTable + " SET \n";
		while(params.iterator().hasNext()){
			fld = (String)params.iterator().next().getKey();
			if(!fldMap.containsKey(fld))continue;
			f = fldMap.get(fld);
			val = paramMap.get(fld);

			fType = f.getType();
			if(val!=null && val.equals(""))val = null;
			if(val == null)
				q += fld + "= null, \n";
			else{
				if(fType.isInstance(d))
					q += fld + "= '" + val+"'::TimeStamp, \n";
				else if (fType.isInstance(ts))
					q += fld + "= '" + val+"'::TimeStamp, \n";
				else{
					val = SQLUtil.fixString((String)val);
					q += fld + "='" + val + "',\n";
				}
			}
		}
		if(q.indexOf(",")<0){
			//the update failed. No field values were found in the incoming request attributes collection
			return;
		}
		q = q.substring(0,q.lastIndexOf(",")) + "\n";
		q += " WHERE " + this.fld_nitID +"='" + nitID + "'";

		SQLUtil.execSQL(q,con);

	}

}