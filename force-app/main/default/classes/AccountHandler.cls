public with sharing class AccountHandler {
    public static Account insertNewAccount(String name) {
        Account acc = new Account();   
        try {
            acc.Name = name;
            insert acc;
        } catch (Exception x) {
            System.debug(x);
            return null;
        }
        return acc;
    }
}