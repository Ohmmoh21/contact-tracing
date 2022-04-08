public with sharing class CTStatusUpdateSchedule implements Schedulable{
    
    public static final String CRON = '0 0 3 * * ?';
    public void execute(SchedulableContext sc) {
        CTUpdatePersonStatusBatch personBatch = new CTUpdatePersonStatusBatch();
        Database.executeBatch(personBatch, 2000);

        CTUpdateLocationStatusBatch locationBatch = new CTUpdateLocationStatusBatch();
        Database.executeBatch(locationBatch, 2000);
    }
}
