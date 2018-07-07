package model;

import java.math.BigInteger;

public class ThousandSeparator {
	public static String thousandSeparator(String s) {
		BigInteger no = new BigInteger(s);
		String res = String.format("%,d", no);
		return res;
	}

	// public static void main(String[] args) {
	// System.out.println(thousandSeparator("10000000000000000000000"));
	// }
}
