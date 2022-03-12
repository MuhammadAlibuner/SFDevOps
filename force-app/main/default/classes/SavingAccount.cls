public class SavingAccount implements BankAccount {

    public integer balance;
    public String AccountNumber;
    public String AccountHolderName;
	public String Alert_Text;	
    public Decimal Interest_rate;
    public Date accountCreationDate;
    
    public integer accountDetail(String AccountHolderName,String AccountNumber,integer Balance,String accountCreationDate)
    {
        this.balance=Balance;
        this.overdraft_validations(Balance);
        this.AccountNumber=AccountNumber;
        this.AccountHolderName=AccountHolderName;
        this.accountCreationDate=Date.parse(accountCreationDate);
        system.debug('account number is:'+AccountNumber+'account holder name is: '+AccountHolderName+'balance is: '+Balance+'creation date is: '+accountCreationDate);
        return Balance;
    }
    public integer withdraw(integer amount) {
        Integer mybalance = this.balance-amount;
        if(mybalance>0) {
            this.balance=this.balance-amount;
        } else {
           this.overdraft_validations(mybalance);
        }
              
        return this.balance;
    }
    public integer deposit(integer amount)
    {
        this.balance=this.balance+amount;
        return this.balance;
    }
    
    public Boolean overdraft_validations(Integer mybalance) {   
        if(mybalance<0) {
            this.Alert_Text = 'Account balance should not falls below $0';
            this.showError();
            return false;
        }
        return true;
    } 
    
    public void showError() {
        System.debug(this.Alert_Text);
    }
    public Decimal addIntrest() {
        Date startDate = this.accountCreationDate;
        Date dueDate = System.today();
        Integer numberDaysDue = startDate.daysBetween(dueDate);
        return (Interest_rate/30)*numberDaysDue;
    }
    
}