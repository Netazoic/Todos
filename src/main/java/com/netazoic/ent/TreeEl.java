package com.netazoic.ent;

public class TreeEl {
	int entID;
	Integer parentID;
	Integer pgLft;
	Integer pgRgt;


	public TreeEl(int id, Integer prntID) {
		entID = id;
		parentID = prntID;
	}

	public TreeEl(int id, int prntID, Integer lft, Integer rgt) {
		entID = id;
		parentID = prntID;
		this.pgRgt  =rgt;
		this.pgLft = lft;
	}
}
