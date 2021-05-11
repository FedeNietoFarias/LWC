//Trigger of Lead
trigger LeadTrigger on Lead (
    before insert, before update
) {
        /*if (Trigger.isBefore){
            if(Trigger.isInsert){
                LeadHelper.verifyRepetedMail(Trigger.new);
            
            }          
        }*/
         if (Trigger.isBefore){
            if(Trigger.isInsert){
                LeadHelper.verifyInsert(Trigger.new);
                //LeadHelper.verifyUpdate(Trigger.new,Trigger.oldMap)            
            }
            else if(Trigger.isUpdate){
                LeadHelper.verifyUpdateAnyFields(Trigger.new,Trigger.oldMap);
                //LeadHelper.verifyInsert(Trigger.new);
            }
            /*if(Trigger.isUpdate){
                LeadHelper.verifyUpdate(Trigger.new);
            } */         
        }
            
}