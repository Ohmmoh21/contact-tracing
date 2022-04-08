public with sharing class CTUpdateLocationStatusBatch implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        List<String> healthStatus = new List<String>{'Red','Orange','Yellow'};
        Date today = Date.today();
        Date last14Days = today - 14;
        return Database.getQueryLocator('SELECT Id FROM Location__c WHERE Status_Update_Date__c =:last14Days AND Status__c IN: healthStatus');
    }

    public void execute(Database.BatchableContext bc, List<Location__c> scope){
        for(Location__c locations: scope){
            locations.Status__c = 'Green';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        //System.debug('Batch is complete');
    }
}