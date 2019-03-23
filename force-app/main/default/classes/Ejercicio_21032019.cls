public with sharing class Ejercicio_21032019 {
    public static void getLIData(List<Line_Item__c> LItem) {
        Product_Line_Item__c pli = new Product_Line_Item__c();
           for(Line_Item__c li : LItem){
            pli.Product_Line_Item_Description__c = li.Line_Item_Description__c;
            pli.Type__c = li.Type__c;
            pli.Line_Item__c = li.id;
        }
        try {
            insert pli;
        } catch (Exception x) {
            System.debug(x);
        }
    }
}
