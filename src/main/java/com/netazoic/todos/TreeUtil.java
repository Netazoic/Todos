package com.netazoic.todos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeSet;

import com.netazoic.ent.ENTException;
import com.netazoic.util.RSObj;

import static org.apache.commons.lang3.StringEscapeUtils.escapeHtml4;

public class TreeUtil {



	public static <T, E> void buildEntStack(T parentID,LinkedHashMap<T, T> treeMap,
			int[] counter, TreeEl[] treeStack) {
		// Depth first iterator to add all children of parentID to the entStack, 
		// starting from child 0, then child 0.child 0-n,
		// winding its way over to child N.child N
		// Counter is a single value int collection, used because java only passes objects by reference
		// Counter[0] is the left/right index value
		// Counter[1] is the page count
		int x,y,i;
		T nitID;
		boolean flgLeft,flgRight;
		i=0;
		TreeEl<T> p;
		Iterator<T> it;
		Set<T> els = new HashSet<T>();
		TreeSet<T> sortEls;
		TreeEl<T> el;
		els = getKeysByValue(treeMap,parentID);
		Class entClass = treeStack[0].getClass();
		sortEls = new TreeSet<T>(els);
		while(sortEls.size()>0){
			it = (Iterator<T>) sortEls.iterator();
			nitID = it.next();   
			//el = new TreeEl(nitID,currentParent);
			sortEls.remove(nitID);
			//tree.remove(el);
			p = new TreeEl(nitID,parentID,counter[0],null);
			treeStack[counter[1]] = p;
			counter[0]++;
			counter[1]++;
			//don't loop on the root element 
			if(nitID == parentID) continue;
			buildEntStack(nitID,treeMap,counter,treeStack); //loopy
		}

		//Add rgt index in reverse order to all children at this level
		y = counter[1]-1;
		p = treeStack[y];
		while (p != null && y >=0){
			p = treeStack[y];
			if(p.parentID == parentID && p.pgRgt == null){
				p.pgRgt = counter[0];
				counter[0]++;
			}
			y--;
		}

		//Right Index the root
		y= counter[1]-1;
		p = treeStack[y];
		while(p != null && y>=0){
			p = treeStack[y];
			if(p.nitID == parentID){
				if(p.pgRgt == null){
					p.pgRgt = counter[0];
					counter[0]++;
					y=-1;
				}
			}
			y--;
		}
	}

	private static <T,E> LinkedList<TreeEl> buildTreeList(ResultSet rs) throws SQLException {
		Integer[] touple;
		TreeEl el = null;
		LinkedList<TreeEl> tree = new LinkedList<TreeEl>();
		while(rs.next()){
			int entID = rs.getInt(1);
			Integer prntID = rs.getInt(2);
			//if(prntID == null || prntID == 0) rootEl.nitID = pgID;
			//el1 = new treeEl(nitID,parentID);
			el = new TreeEl(entID,prntID);
			tree.add(el);
		}
		return tree;
	}

	private static <T,E> LinkedHashMap<T,T>  buildTreeMap(ResultSet rs) throws SQLException {
		Integer[] touple;
		TreeEl el;
		LinkedList<TreeEl> tree = buildTreeList(rs);
		LinkedHashMap<T,T> treeMap = new LinkedHashMap<T,T> ();
		int ct = tree.size();
		for(int i =0;i< ct;i++){
			el = tree.get(i);
			treeMap.put((T)el.nitID, (T)el.parentID);
		}
		return treeMap;
	}

	public static <T, E> Set<T> getKeysByValue(Map<T, T> treeMap, T nitID2) {
		Set<T> keys = new HashSet<T>();
		for (Entry<T, T> entry : treeMap.entrySet()) {
			if (entry.getValue().equals(nitID2)) {
				keys.add((T) entry.getKey());
			}
		}
		return keys;
	}


	public DO[] getEntStack(DO dd,ResultSet rs) throws DOException, SQLException{
		// Get the pageStack from indexed db records

		//String sql = SQLUtil.parseQuery(MODULE_CTP.sql_GET_MODULE_PAGES_AMD.ctpPath, settings);

		int ct = 0;
		while (rs.next()) ct++;
		rs.beforeFirst();
		DO[] entStack = new DO[ct];
		DO pg;
		Long nitID,parentID;
		int lft,rgt;
		String nitTitle;
		int idx=0;
		try{
			int i = 0;
			while(rs.next()){
				nitID = rs.getLong(dd.nitIDField);
				parentID = rs.getLong(2);
				lft = rs.getInt(3);
				rgt = rs.getInt(4);
				nitTitle = rs.getString(5);
				pg = (DO)dd.clone();
				pg.nitID = nitID;
				//pg.retrieveRecord();
				pg.doParentID = parentID;
				pg.lft = lft;
				pg.rgt = rgt;
				idx = i;
				entStack[idx] = pg;
				i++;
			}
		}catch(Exception ex){
			throw new DOException(ex);
		}finally{
		}

		return entStack;
	}


	public String getULTree(DO ent, ResultSet rs) throws DOException{
		/*
		 * Load all pages attached to an DO as an un-ordered HTML list
		 * Need to get a structure like this:
		 * 
		 *    <ul id=primaryNav class="col7">
		 *      <li id="home"><a name="251" onclick="??">Home</a></li>
		 *      <li><a name="231.1" onclick="">Menus</a>
		 *        <ul>
		 *          <li id="231.1a"><a  name="235.1a" onclick="">Dinner Menu</a></li>
		 *            . . .
		 *        </ul>
		 *       </li><!-- end of 231.1 li -->
		 *        . . . 
		 *     </ul>
		 *    
		 */

		Map<Integer,Long>parentMap = new HashMap<Integer,Long>();
		Map<Integer,Integer>ulMap = new HashMap<Integer,Integer>();
		String ulTree;
		int currParent;
		Long parent1=(long) 0;
		Long parent2=(long) 0;
		Long pageID,parentID;
		int lft,rght;
		int lvl = 0;
		int pgCt = 0;
		DO root = (DO) ent.clone();
		DO home= (DO) ent.clone();
		String liID, liClass = "";
		String fixTitle;
		boolean flgInUL = false;
		DO[] entStack = null;

		ulTree = "<ul id=\"ulMap\" >";
		try{
			entStack = getEntStack(ent,rs);
			for(DO pg : entStack){
				pageID = pg.nitID;
				parentID = pg.doParentID;
				fixTitle = escapeHtml4(pg.nitTitle);
				pgCt++;

				//Home node
				if(pgCt ==1){
					//this is the home node
					//liID = "home";
					liID = pg.nitID+"";
					liClass = " home pageNode ";
					home = pg;
					//lvl++;
					//parentMap.put(lvl, pg.pageID);
					ulTree += getDoLI(lvl, liID, liClass, fixTitle, pg);
					ulTree += "</li>\n"; //close the LI for the home node.  This is an anomoly
					// of the css system we are using for generating the siteMap.
					// Logically, the root node would want to close it's <li> after
					// the enclosed <ul> subtreee, like all other branches in the tree.
					// But the css does not work in FF unless closed here.
					continue;
				}
				//Sub-node
				try{parent1 = parentMap.get(lvl);}catch(Exception ex){parent1 = (long) -1;}
				liID = pg.nitID+"";
				liClass = " pageNode ";
				if(pg.doParentID == parent1){
					//at same level, no change
					ulTree += "</li>\n";
					ulTree += getDoLI(lvl, liID, liClass, fixTitle, pg);
				}
				else if(parentMap.containsValue(pg.doParentID)){
					//bump up one or more levels
					while(parentMap.get(lvl)!= pg.doParentID){
						lvl --;
						ulTree += "</li>\n";
						//if(lvl >1 && parentMap.get(lvl) != pg.pageID){
						if(ulMap.get(lvl+1)==1){
							ulTree += "</ul>\n";
							//siteMap += "</li>\n";
						}
						//}
					}
					ulTree += getDoLI(lvl, liID, liClass, fixTitle, pg);
				}
				else{
					//bump down one level
					lvl++;
					parentMap.put(lvl, pg.doParentID);
					ulTree += "<ul>\n";
					ulMap.put(lvl, 1);
					flgInUL = true;
					ulTree += getDoLI(lvl, liID, liClass, fixTitle, pg);
				}
			}

		}catch(Exception ex){
			throw new DOException(ex);

		}finally{
		}
		while(lvl>0){
			ulTree+= "\n</li>\n";
			if(ulMap.get(lvl)==1) ulTree+="</UL>\n";
			lvl--;
		}

		ulTree += "\n</UL>";
		return ulTree;
	}


	private String getDoLI(int lvl, String liID, String liClass,
			String pgTitle, DO pg) {
		//put out the basic :O entry
		String pgClass = "page";
		String li = "";
		li += "<LI id=" + liID +" class='" + liClass +"'" +
				" lvl=" + lvl +">";
		li += " <a name='"+pg.nitID+"' " +
				"id='" + pg.nitID + "'" +
				"class='" + pgClass + "'" +
				"href='javascript:goVisEditor(\""+pg.nitID+"\" )'>";
		li += pgTitle;
		li += "</a>\n";
		//don't close the LI here . . . wait to see if there are children
		return(li);
	}

	public RSObj getRelatedEntMap(String q, String pkField,Connection con) throws DOException, SQLException{
		//Return set of pages for a working module
		//if(pageMap!=null) return pageMap;
		RSObj pageMap = null;
		try{
			pageMap = RSObj.getRSObj(q, "administeredpageid", con);  
		}catch(ENTException ex){
			throw new DOException(ex);
		}
		return pageMap;
	}

	public static <T,E> void setTreeIndexes(DO ent,ResultSet rs, Connection con) throws SQLException, DOException{
		/*
		 * Convert an adjacency list set of DO relationships into a nested set model
		 */
		/* based on an original SQL function by Joe Celko
		 * http://www.ibase.ru/devinfo/DBMSTrees/sqltrees.html
		 * 
		 * tree is a simple touple list of entID-> parentID coming from an DO_DO table.
		 * entStack is a set of TreeEl objects, which hold entid,parentid,pgLeft and pgright
		 * This routine calculates pgleft and pgright using a depth first iteration and 
		 * flushes these values back to the DO_DO table.
		 */

		Statement myStat = null;
		LinkedList<TreeEl> treeList;
		LinkedHashMap<T,T> treeMap;
		int treeCt = 0;
		TreeEl[] treeStack = null;
		int[] counterObj = {1,0};   
		try {
			//Build the ordered tree
			treeList = buildTreeList(rs);
			treeMap =  buildTreeMap(rs);
			treeCt = treeMap.size();
			if(treeCt == 0) throw new DOException("No pages found in current module tree.");
			treeStack = new TreeEl[treeCt];

			//add all children to the stack, starting with currentParent
			buildEntStack((T)treeList.getFirst().parentID,treeMap,counterObj, treeStack);

			//entStack is now indexed.  hooray.
			//flush this back to the database.
			updateTreeIndexes(ent,treeStack,con);
		} catch(SQLException ex){
			throw new DOException(ex);
		} catch (Exception ex) {
			throw new DOException(ex);
		}finally{
			if(myStat != null)try{myStat.close();myStat = null;}catch(Exception ex){}
		}

	}

	public static <T,E> void updateTreeIndexes(DO dd,TreeEl<T>[] treeStack, Connection con) throws DOException{
		//Set the left and right index values in the db for DOs referenced in  treeStack
		String sql = "UPDATE " + dd.nitTable +" SET lft = ?, rgt = ? " +
				" WHERE " + dd.nitIDField + "= ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			for (TreeEl<T> el : treeStack){
				ps.setInt(1,el.pgLft);
				ps.setInt(2,el.pgRgt);
				ps.setObject(3,(T)el.nitID);
				ps.execute();
			}
		} catch (SQLException e) {
			throw new DOException(e);
		}
	}
}
