// navTab.js
import { LightningElement, api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';


export default class Navtab extends NavigationMixin(LightningElement) {
    @api tabName;
    @api label;
    navigateNext() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: this.tabName,
            }
        });
    }

}