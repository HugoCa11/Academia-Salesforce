@isTest
private class AnimalLocatorTest {
    @isTest static  void testGetLocator() {
        // Create the mock response based on a static resource
        //AnimalLocatorMock mock = ;
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        String result = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('chicken', result, 'No fueron iguales');         
    }
}