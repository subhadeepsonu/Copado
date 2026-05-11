@isTest
private class TestRestrictContactByName {

    @isTest 
    static void testValidContact() {
        Contact c = new Contact(LastName = 'Test');

        Test.startTest();
        insert c;
        Test.stopTest();

    
        System.assertNotEquals(null, c.Id, 'Contact should be inserted');
    }

    @isTest 
    static void testInvalidContact() {
        Contact c = new Contact(LastName = 'INVALIDNAME');

        Test.startTest();
        try {
            insert c;
            System.assert(false, 'Expected an exception but none was thrown');
        } catch (DmlException e) {
            System.assert(
                e.getMessage().contains('not allowed'),
                'Error message should mention restriction'
            );
        }
        Test.stopTest();
    }
}