package com.netazoic.todos;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.netazoic.ent.NetRoute;
import com.netazoic.ent.ServENT;
import com.netazoic.util.SQLUtil;

/*
 * Standard back-end for the Todos system.
 * 
 * A RESTful, front-end agnostic service to do the following:
 * 
 * 	o	Create DOs
 * 	o	Link DOs
 * 	o	Annotate DOs
 *  o	Delete DOs
 *  o	Update DOs
 * 	o	Tag DOs
 * 
 * DOs, as you may have guessed by this point, are the basic unit of the Todos system.  A Do, or a do, is a 
 * thing: it could be a thing to do, which was the original inspiration for this system. But it doesn't have
 * to be.
 * 
 * A DO may link to any other DO.
 * A DO may link to any number of other DOs
 * A DO may have any number of other DOs linked under itself
 * The initial DO in the system is special and is called EO 
 */
public class Todos extends ServENT{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public enum DO_Route{
		cdo("cdo","Create DO"),
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

	private NetRoute lsdoHdlr = new LSHandler();
	private NetRoute lndoHdlr = new LNHandler();
	private NetRoute cdoHdlr = new CreateDOHandler();
	private NetRoute rdoHdlr = new RetrieveDOHandler();
	private NetRoute udoHdlr = new UpdateDOHandler();
	private NetRoute ddoHdlr = new DeleteDOHandler();
	public void init(ServletConfig config) throws javax.servlet.ServletException {
		super.init(config);

		defaultRoute = DO_Route.lsdo.route;

		routeMap.put(DO_Route.lsdo.route, lsdoHdlr);
		routeMap.put(DO_Route.lndo.route, lndoHdlr);
		routeMap.put(DO_Route.cdo.route, cdoHdlr);
		routeMap.put(DO_Route.rdo.route, rdoHdlr);
		routeMap.put(DO_Route.udo.route, udoHdlr);
		routeMap.put(DO_Route.ddo.route, ddoHdlr);
		

	}


	private Map<String, Object> getRequestMap(HttpServletRequest request) {
		Map<String,Object> m = new HashMap<String,Object>();
		Enumeration<String> rkeys = request.getAttributeNames();
		String k;
		while (rkeys.hasMoreElements()){
			k = rkeys.nextElement();
			m.put(k, request.getAttribute(k));
		}
		return m;
	}

	public class LSHandler extends RouteEO{

		@Override
		public void routeAction(HttpServletRequest request, HttpServletResponse response, Connection con,HttpSession session) throws Exception{
			String routeString = (String) request.getAttribute(ENT_Param.routeString.name());
			DO_Route route;
			try{
				route = DO_Route.valueOf(routeString);
			}catch(Exception ex){
				route = DO_Route.lsdo;
			}
			switch(route){
			case lsdo:
				listDOs(request,response,con);
				break;
			default:
				throw new Exception("Unexpected action");
			}
		}

		public void listDOs(HttpServletRequest request, HttpServletResponse response,Connection con) throws Exception{
			//Do Something here
			try {
				String q = "SELECT * FROM do";
				Statement myStat = con.createStatement();
				ResultSet rs = SQLUtil.execSQL(q, myStat);
				String row;
				while(rs.next()){
					row = rs.getString("doid");
					row += ":";
					row += rs.getString("dccode");
					response.getWriter().println(row);
				}
			} catch (IOException e) {
				throw new Exception(e);
			}
		}

	}

	
	public class LNHandler extends RouteEO{

		@Override
		public void routeAction(HttpServletRequest request,
				HttpServletResponse response, Connection con, HttpSession session)
				throws IOException, Exception {
			// TODO Auto-generated method stub	
		}	
	}
	
	public class CreateDOHandler extends RouteEO{

		@Override
		public void routeAction(HttpServletRequest request,
				HttpServletResponse response, Connection con, HttpSession session)
				throws IOException, Exception {
			DO dd = new DO(con);
			Map<String,Object> paramMap = getRequestMap(request);
			Long id = dd.createRecord(paramMap, con);
			String msg = "Created new DO with id " + id;
			response.getWriter().print(msg);
		}	
		
	}
	
	public class RetrieveDOHandler extends RouteEO{

		@Override
		public void routeAction(HttpServletRequest request,
				HttpServletResponse response, Connection con, HttpSession session)
				throws IOException, Exception {
			// TODO Auto-generated method stub	
		}


		
	}
	public class UpdateDOHandler extends RouteEO{

		@Override
		public void routeAction(HttpServletRequest request,
				HttpServletResponse response, Connection con, HttpSession session)
				throws IOException, Exception {
			// TODO Auto-generated method stub	
		}
		
	}
	public class DeleteDOHandler extends RouteEO{

		@Override
		public void routeAction(HttpServletRequest request,
				HttpServletResponse response, Connection con, HttpSession session)
				throws IOException, Exception {
			// TODO Auto-generated method stub	
		}
		
	}
	
}
