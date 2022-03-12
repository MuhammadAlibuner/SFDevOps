trigger TestDeleteTrigger on Account (before delete) {
	  createAccountClass obj=new createAccountClass(); // Creating instance of the class.
    if(trigger.isbefore && trigger.isdelete) // Using context variable.
    {
     //obj.method1(Trigger.old); // Passing records to apex method.
    }
}