public with sharing class AccountHandler {
    
    public static void insertAccount(Integer N) {
        
        List<Account> addAccounts = new List<Account>();
        
        Integer i = 0;
        
        while(i < N) {
            Account acc = new Account();
            acc.Name = 'Acme Inc ' + i;
            acc.AccountNumber = 'A000' + i;
            
            addAccounts.add(acc);
            i++;
        }
        
        insert addAccounts;
    }
}