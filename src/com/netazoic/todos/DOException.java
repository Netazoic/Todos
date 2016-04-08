package com.netazoic.todos;

import com.netazoic.ent.ENTException;

public class DOException extends ENTException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DOException(Exception ex){
		super(ex);
	}
	
	public DOException(String msg){
		super(msg);
	}

}
