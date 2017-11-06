package com.bitc.store;
import java.io.*;
public class BeanSaver {
	public boolean save(Object obj,String fileName) {
		boolean result = true;
		//return true;
		try {
			FileOutputStream fos = new FileOutputStream(fileName);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			
			oos.writeObject(obj);
			oos.close();
		}catch(Exception ex) {
			result = false;
			System.out.println(ex.toString());
		}
		return result;
	}
	public Object load(String fileName) {
		Object obj=null;
		try {
			FileInputStream fis = new FileInputStream(fileName);
			ObjectInputStream ois = new ObjectInputStream(fis);
			obj = ois.readObject();
			ois.close();
		}catch(Exception ex) {
			System.out.println(ex.toString());
		}
		return obj;
	}
}
