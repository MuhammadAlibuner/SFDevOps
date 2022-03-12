public class AccountHandler {
	public static void insertAccount(integer value)
    {
       integer N = 1;
       List <Account> addAccounts = new List<Account>();
       while(N<=value)
       {
           system.debug('counter value before incrementing'+N);
       	   Account store = new Account();
           store.Name = 'Acme Inc'+N;
           store.AccountNumber = 'A000'+N;
           addAccounts.add(store);
           system.debug(addAccounts);
           N = N+1;
           system.debug('counter value after incrementing'+N);
           
       }
        system.debug('size of Account list:'+addAccounts.size());
        insert addAccounts;
    }
    public static Account insertNewAccount(String name)
    {
        Account acct = new Account(Name = name);
        try{
            insert acct;
            return acct;
        }catch(DMLException e){
            system.debug('DML Exception:'+e);
            return null;
        }
	}
}