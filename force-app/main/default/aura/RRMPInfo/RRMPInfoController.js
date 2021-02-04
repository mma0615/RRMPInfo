({
    init : function(component) {
        var action = component.get("c.getRRMPContactInfo");
        action.setParams({
            "contactType" : component.get("v.conType")
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state == "SUCCESS"){
                var conInfo = response.getReturnValue();
                if (conInfo != null)
                {
                    component.set("v.recordId", conInfo.Id);
                    component.set("v.scrnMsg", conInfo.Screen_Message__c);
                    component.set("v.ContactEmail", conInfo.Contact_Email__c);
                    component.set("v.ContactNumber", conInfo.Contact_Number__c);
                    component.set("v.FaxNumber", conInfo.Fax_Number__c);
                }
                
            } else {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title"   : "Error!",
                    "type"    : "error",
                    "message" : "Record information couldn't be retrieved!"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    },
})