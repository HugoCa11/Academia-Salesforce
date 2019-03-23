@isTest
public class ClasePruebaLineItem {

    @isTest
    private static void testInsertLineItem() {
        Line_Item__c li = new Line_Item__c(
            Line_Item_Description__c = 'Test',
            Type__c = 'Small'
        );

        Test.startTest();
        insert li;
        Test.stopTest();

        Product_Line_Item__c pli = [select Product_Line_Item_Description__c from Product_Line_Item__c where Line_Item__c =: li.Id];
        System.assertEquals(pli.Product_Line_Item_Description__c, li.Line_Item_Description__c, 'Son iguales');
    }
}