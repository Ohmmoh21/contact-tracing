public with sharing class CTUpdatePersonStatusBatch implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        List<String> healthStatus = new List<String>{'Red','Orange','Yellow'};
        Date today = Date.today();
        Date last14Days = today - 14;
        return Database.getQueryLocator('SELECT Id FROM Person__c WHERE Status_Update_Date__c =:last14Days AND Health_Status__c IN: healthStatus');
    }

    public void execute(Database.BatchableContext bc, List<Person__c> scope){
        for(Person__c people: scope){
            people.Health_Status__c = 'Green';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        //System.debug('Batch is complete');
    }
}
