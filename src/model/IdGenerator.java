package model;

import java.util.Random;

public class IdGenerator {
	public static int generateRandomNumber() {
		int start = 100;
		int end = 10000;
		Random random = new Random();
		long fraction = (long) ((end - start + 1) * random.nextDouble());
		return ((int) (fraction + start));
	}

	public static String IDGen(String IDName) {
		return IDName + generateRandomNumber();
	}
}
