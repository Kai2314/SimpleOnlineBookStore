package com.bitc.store;
import java.io.*;
//為了能夠讓Bid能夠寫入檔案，必須實作Serializable介面
public class Bid implements Serializable{  
	private String Name= "";
	private int Price = 0;
	public Bid() {
		
	}
	public void setName(String Name) {
		this.Name = Name;
	}
	public void setPrice(int Price) {
		this.Price = Price;
	}
	public String getName() {
		return Name;
	}
	public int getPrice() {
		return Price;
	}
}
