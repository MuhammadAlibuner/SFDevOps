public interface BankAccount {
		
        integer withdraw(integer amount); /// with draw method
        integer deposit(integer amount);///deposit method
        integer accountDetail(String AccountHolderName,String AccountNumber,integer Balance,String accountCreationDate);
}