@isTest
public class TestVerifyDate {

    //Method within the 30 days
    @isTest
    private static void withinMonth() {
        Date d1 = Date.newInstance(2019, 4, 11);
        Date d2 = Date.newInstance(2019, 4, 22);
        Date res = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d2, res);
    }
    
    //Method out the 30 days
    @isTest
    private static void outMonth() {
        Date d1 = Date.newInstance(2019, 4, 11);
        Date d2 = Date.newInstance(2019, 11, 17);
        Date d3 = Date.newInstance(2019, 4, 30);
        Date res = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d3, res);
    }
}