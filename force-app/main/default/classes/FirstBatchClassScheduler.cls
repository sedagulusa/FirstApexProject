public with sharing class FirstBatchClassScheduler implements Schedulable{
    public void execute(SchedulableContext sc) {
        Database.executeBatch(new FirstBatchClass(),100);
    }//1-2000 batch size
}
