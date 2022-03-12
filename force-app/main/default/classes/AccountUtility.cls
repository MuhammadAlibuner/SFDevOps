public class AccountUtility {
	public static void viewAnnualRevenue()
    {
        List<Account> accountsList = [SELECT Name,AnnualRevenue FROM Account];
        for(Account ac:accountsList )
        {
            String acctRev = ac.Name+':'+ac.AnnualRevenue;
            system.debug(acctRev);
        }
    }
}