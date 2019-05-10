package com.kh.st.member;

public class Member implements java.io.Serializable{
	private int level;
	private String rank;
	
	public Member() {}

	public Member(int level, String rank) {
		super();
		this.level = level;
		this.rank = rank;
	}

	public int getLevel() {
		return level;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "Member [level=" + level + "]";
	}
	
	
}
