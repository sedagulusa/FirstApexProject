List<Lead> inputList=[Select Status, id from Lead];
UpdateLeadStatusQueueable leadQue=new UpdateLeadStatusQueueable(inputList);
//Execute queable
system.enqueueJob(leadQue);