package com.se1889_jv.swp391.swpstart.util;

import java.util.Arrays;
import java.util.stream.Collectors;

public class StringUtils {
    public static String formatName(String input) {
        if (input == null || input.trim().isEmpty()) {
            return "";
        }
        return Arrays.stream(input.toLowerCase().split("\\s+"))
                .map(word -> Character.toUpperCase(word.charAt(0)) + word.substring(1))
                .collect(Collectors.joining(" "));
    }
}
