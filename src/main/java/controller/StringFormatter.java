package controller;

/**
 * Created by Леша on 07.02.2017.
 */
public class StringFormatter {

    public static String getStringEnding(int i) {
        String[] str = {"день", "дня", "дней"};
        String retVal;
        i = i % 100;
        if (i >= 11 && i <= 19) {
            return str[2];
        } else {
            int i1 = i % 10;
            switch (i1) {
                case 1:
                    retVal = str[0];
                    break;
                case 2:
                case 3:
                case 4:
                    retVal = str[1];
                    break;
                default:
                    retVal = str[2];
                    break;
            }
        }

        return retVal;

    }

}
