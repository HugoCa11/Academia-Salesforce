trigger TriggerProductLI on Line_Item__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        Ejercicio_21032019.getLIData(Trigger.new);
    }
}