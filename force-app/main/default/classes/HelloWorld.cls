public with sharing class HelloWorld {
    List<Account> accounts  = [SELECt Id,Name FROM Account];
    public static void TestHello() {
        System.debug('hello');
    }
}