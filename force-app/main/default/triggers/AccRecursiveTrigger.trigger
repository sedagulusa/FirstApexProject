trigger AccRecursiveTrigger on Account (after insert) {
    if(!AccRecursiveTriggerHandler.isTriggerFirstRun){
        AccRecursiveTriggerHandler.recursivePractice(Trigger.new);
    }
}