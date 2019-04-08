({
    clickCreateItem : function(component, event, helper) {
        var validItem = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            // Create the new item
            var newItem = component.get("v.newItem");
            console.log("Create item: " + JSON.stringify(newItem));
            var theItems = component.get("v.items");
            // Copy the expense to a new object
            // THIS IS A DISGUSTING, TEMPORARY HACK
            var newItem1 = JSON.parse(JSON.stringify(newItem));
            console.log("Items before 'create': " + JSON.stringify(theItems));
            theItems.push(newItem1);
            component.set("v.items", theItems);
            console.log("Items after 'create': " + JSON.stringify(theItems));
            component.set("v.newItem", { 'sobjectType': 'Camping_Item__c',
                                        'Name': '', 
                                        'Quantity__c': '0', 
                                        'Price__c':'0', 
                                        'Packed__c': false});
            
        }		
    }
})