import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_PHONE_FIELD from '@salesforce/schema/Account.Phone';
import ACCOUNT_WEBSITE_FIELD from '@salesforce/schema/Account.Website';

export default class AccountDetails extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: [ACCOUNT_NAME_FIELD, ACCOUNT_INDUSTRY_FIELD, ACCOUNT_PHONE_FIELD, ACCOUNT_WEBSITE_FIELD] })
    account;

    get accountName() {
        return this.account.data ? this.account.data.fields.Name.value : '';
    }

    get industry() {
        return this.account.data ? this.account.data.fields.Industry.value : '';
    }

    get phone() {
        return this.account.data ? this.account.data.fields.Phone.value : '';
    }

    get website() {
        return this.account.data ? this.account.data.fields.Website.value : '';
    }
}