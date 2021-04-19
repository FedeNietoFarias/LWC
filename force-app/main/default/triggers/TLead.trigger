trigger TLead on Lead (before insert) {
    if (Trigger.isBefore){
        if(Trigger.isInsert){
            TLeadTriggerHandler.VerifyRepetedMail(Trigger.new);
           
        }          
    }

    }
