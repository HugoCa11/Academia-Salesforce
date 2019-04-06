@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        List<Lead> leads = new List<Lead>();
        // insert 200 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Hero', MobilePhone= '555-555-555'+i, Company='IPer', Status='Open - Not Contacted', LeadSource=''));
        }
        insert leads;
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}