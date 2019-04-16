public with sharing class StringArrayTest {
    public static List<String> generateStringArray(Integer numStrings) {
        List<String> strngs = new List<String>();
        for(Integer i = 0; i < numStrings; i++){
            strngs.add('Test '+i);
        }
        return strngs;
    }
}