@isTest
private class TestVerifyDate {
    @isTest
    public static void TestCheckDates(){
        Test.startTest();
        Date date1 = Date.newInstance(2023, 1, 1);
        Date date2 = Date.newInstance(2023, 1, 15);
        Date date3 = Date.newInstance(2023, 1, 31);

        Date result1 = VerifyDate.CheckDates(date1, date2);
        Date result2 = VerifyDate.CheckDates(date1, date3);
        Test.stopTest();
        System.Assert.areEqual(date2, result1);
        System.Assert.areEqual(date3, result2);
    }
}