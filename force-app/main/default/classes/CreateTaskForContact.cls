global class CreateTaskForContact implements Database.Batchable<sObject> {

     string query = 'SELECT Id,AccountId,OwnerId FROM Contact';

     global database.QueryLocator start(Database.BatchableContext Bc){
          return  database.getQueryLocator(query);
     }

    global void execute (Database.BatchableContext BC, List<Contact> conList){
        
        List<Task>tskList = new List<Task>();
        
        for (Contact con: conList){
            
            Task tsk = new Task();
            tsk.OwnerId= con.ownerId;
            tsk.whoId= con.Id;
            tsk.WhatId=con.AccountId;
            tsk.Subject='Test Task subject';
            tsk.Status= 'open';
            tsk.Priority= 'Normal';
            tsk.Description= 'This is test Batch Apex for Contact to create a task';
            tsk.ActivityDate= System.Today();
            tsk.IsReminderSet= true;
            tsk.ReminderDateTime= System.now();
            tskList.add(tsk);
        }
        try {
            insert tskList;
        }
        catch(system.DmlException error){
            System.debug('Task not Inserted!!'+error);
        }
    }
global void finish (Database.BatchableContext BC){
    }
}