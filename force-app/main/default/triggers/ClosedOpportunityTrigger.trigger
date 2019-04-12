trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    //Tasks to create
    if(Trigger.isAfter && Trigger.isInsert  || Trigger.isAfter && Trigger.isUpdate) {
        List<Task> newTask = new List<Task>();
        
        for (Opportunity opp : Trigger.New){
            if(opp.StageName == 'Closed Won'){
                newTask.add(new Task(OwnerId = opp.OwnerId, 
                                     Subject = 'Follow Up Test Task', 
                                     Priority = 'Normal', 
                                     Status = 'Not Started',
                                     WhatId = opp.Id));
            }
        }
        insert newTask;
    }
}