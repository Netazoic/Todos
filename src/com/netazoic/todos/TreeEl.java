package com.netazoic.todos;

public class TreeEl<T> {
	T nitID;
	T parentID;
	Integer pgLft;
	Integer pgRgt;


	public TreeEl(T id, T prntID) {
		nitID = id;
		parentID = prntID;
	}

	public TreeEl(T nitID1, T nitID2, Integer lft, Integer rgt) {
		nitID = nitID1;
		parentID = nitID2;
		this.pgRgt  =rgt;
		this.pgLft = lft;
	}
}
