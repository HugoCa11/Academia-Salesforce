({
    packItem : function(component, event, helper) {
        var isPacked = component.get('v.item.Packed__c');
        console.log(isPacked);
        component.set("v.item.Packed__c", "true");
        component.set("v.packedBtn.disabled", "true")
    }
})