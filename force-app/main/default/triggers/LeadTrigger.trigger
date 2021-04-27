//Trigger of Lead
trigger LeadTrigger on Lead (before insert) {
    if (Trigger.isBefore){
        if(Trigger.isInsert){
            LeadHelper.verifyRepetedMail(Trigger.new);
           
        }          
    }

    }