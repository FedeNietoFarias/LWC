//Trigger of Lead
trigger TLead on Lead (before insert) {
    if (Trigger.isBefore){
        if(Trigger.isInsert){
            TLeadTriggerHandler.verifyRepetedMail(Trigger.new);
           
        }          
    }

    }
