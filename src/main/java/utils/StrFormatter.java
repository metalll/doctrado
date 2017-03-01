package utils;

import java.text.CharacterIterator;
import java.text.StringCharacterIterator;

/**
 * Created by NSD on 01.03.17.
 */
public class StrFormatter {
    public static String forJSON(String input) {
        if (input == null || input.isEmpty()) {
            return "";
        }
        int len = input.length();
        // сделаем небольшой запас, чтобы не выделять память потом
        final StringBuilder result = new StringBuilder(len + len / 4);
        final StringCharacterIterator iterator = new StringCharacterIterator(input);
        char ch = iterator.current();
        while (ch != CharacterIterator.DONE) {
            if (ch == '\n') {
                result.append("\\n");
            } else if (ch == '\r') {
                result.append("\\r");
            } else if (ch == '\'') {
                result.append("\\\'");
            } else if (ch == '"') {
                result.append("\\\"");
            } else {
                result.append(ch);
            }
            ch = iterator.next();
        }
        return result.toString();
    }

}
