@isTest
private class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Hero', MobilePhone= '555-555-555'+i, Company='IPer', Status='Open - Not Contacted', LeadSource='Web'));
        }
        insert leads;
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lP = new LeadProcessor();
        Id batchId = Database.executeBatch(lP);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
    
}