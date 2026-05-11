import { LightningElement, wire, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 
import getEmployee from '@salesforce/apex/EmployeeController.getEmployee';
import createEmployee from '@salesforce/apex/EmployeeController.createEmployee';
import { refreshApex } from '@salesforce/apex';

const columns = [
    { label: 'Name',         fieldName: 'Name' },
    { label: 'Email',        fieldName: 'Email__c',       type: 'email' },
    { label: 'Department',   fieldName: 'Department__c',  type: 'text' }, 
    { label: 'Joining Date', fieldName: 'Joining_Date__c',type: 'date' },
];

export default class EmployeeManagement extends LightningElement {

    searchTerm = '';
    employees;
     wiredEmployeeResult; 
    columns = columns;
    validForm=true;

    
    @track
    formData = {
        Name          : '',
        Email__c      : '',
        Department__c : '',
        Joining_Date__c: ''
    };

    departments = [
        { label: 'Sales',       value: 'Sales' },      
        { label: 'Management',  value: 'Management' },
        { label: 'Security',    value: 'Security' },
        { label: 'HR',          value: 'HR' },
        { label: 'Help Desk',   value: 'Help Desk' },
        { label: 'Finance',     value: 'Finance' }
    ];

    
    get today() {
        return new Date().toISOString().split('T')[0];
    }

    

    @wire(getEmployee, { name: '$searchTerm' })
    wiredEmployees(result) {
         this.wiredEmployeeResult = result;
         const { data, error } = result;
        if (data) {
            this.employees = data;
            console.log('employees -->', JSON.stringify(data));
        } else if (error) {
            console.error('error -->', JSON.stringify(error));
        }
    }

    handleChange(event) {
        const field = event.target.dataset.field;
        this.formData = { ...this.formData, [field]: event.target.value };
        this.validForm = ![...this.template.querySelectorAll('lightning-input, lightning-combobox')]
            .every(el => el.checkValidity());
    }

    handleSearch(event) {
        this.searchTerm = event.target.value;
    }

    async AddEmployee() {
        const allValid = [...this.template.querySelectorAll('lightning-input, lightning-combobox')]
            .reduce((valid, el) => el.reportValidity() && valid, true);

        if (!allValid) return;

        try {                     
            console.log(JSON.stringify(this.formData));                        
            await createEmployee(
                {
                    name: this.formData.Name,
                    department:this.formData.Department__c,
                    email:this.formData.Email__c,
                    joiningDate: new Date(this.formData.Joining_Date__c).toISOString().split('T')[0]
                }
            );
            await refreshApex(this.wiredEmployeeResult)
            this.dispatchEvent(new ShowToastEvent({
                title  : 'Success',
                message: 'Employee created successfully!',
                variant: 'success'
            }));
            this.formData = {
                Name:'',
                Email__c:'',
                Department__c:'',
                Joining_Date__c:''
            }
            this.validForm=false
        } catch (error) {
            console.error('Error -->', JSON.stringify(error));
            this.dispatchEvent(new ShowToastEvent({
                title  : 'Error',
                message: error.body?.message || 'Something went wrong',
                variant: 'error'
            }));
        }
    }
}