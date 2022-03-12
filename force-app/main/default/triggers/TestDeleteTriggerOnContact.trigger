trigger TestDeleteTriggerOnContact on Contact (before update) {
	 createAccountClass obj=new createAccountClass(); // Creating instance of the class.
    if(trigger.isbefore && trigger.isUpdate) // Using context variable.
    {
     	obj.method1(Trigger.old,Trigger.New); // Passing records to apex method.
    }
}