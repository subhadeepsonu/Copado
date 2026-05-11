import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import USER_ID from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';

const FIELDS = [NAME_FIELD];

export default class Selector extends LightningElement {
    selectedProductId;
    userId = USER_ID;

    handleProductSelected(event) {
        this.selectedProductId = event.detail;
    }

    @wire(getRecord, { recordId: '$userId', fields: FIELDS })
    user;

    get name() {
        return getFieldValue(this.user.data, NAME_FIELD);
    }
}