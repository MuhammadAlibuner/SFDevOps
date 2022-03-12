public class CheckingAccount implements BankAccount {
    public integer balance=0;
    public String AccountNumber;
    public String AccountHolderName;
    public String Alert_Text;
    public Date accountCreationDate;
    
    
    public integer accountDetail(String AccountHolderName,String AccountNumber,integer Balance,String accountCreationDate)
    {
        this.balance=Balance;
        this.AccountNumber=AccountNumber;
        this.AccountHolderName=AccountHolderName;
        this.accountCreationDate=Date.parse(accountCreationDate);
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
    
    public integer deposit(integer amount) {
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
}