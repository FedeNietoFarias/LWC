import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT from '@salesforce/schema/Contact';
import CONTACT_NAME from '@salesforce/schema/Contact.FirstName';
import CONTACT_LASTNAME from '@salesforce/schema/Contact.LastName';
import CONTACT_EMAIL from '@salesforce/schema/Contact.Email';
export default class ContactCreator extends LightningElement {
    objectApiName= CONTACT;
    fields=[CONTACT_NAME,CONTACT_LASTNAME,CONTACT_EMAIL];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Account created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }


}