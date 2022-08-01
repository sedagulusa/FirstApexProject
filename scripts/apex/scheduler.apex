FirstBatchClassScheduler sch=new FirstBatchClassScheduler();
String cron='0 30 22 * * ? *';//10.30 pm
system.schedule('SFprojectBatchScheduler', cron,sch);