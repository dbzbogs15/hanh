package dao;

import java.util.ArrayList;

import model.File;

public class UploadDao {
	public static ArrayList<File> list = new ArrayList<>();

	public UploadDao() {
		list.removeAll(list);
		
	}

	public static ArrayList<File> getList() {
		return list;
	}

	public static void setList(ArrayList<File> list) {
		UploadDao.list = list;
	}

}
