/****************************************
* Class Name : PF_SchemaExtractor * 
* Description: Allows System Admin to quickly pull Object schema
* Application: Schema Extractor
* Created By : Eric Montelibano
* Last Modified Date: 09/21/2016
* ****************************************/
public class PF_SchemaExtractor {
    public String val {get;set;}
    public string objName {get;set;}
    
    public List<SelectOption> getName()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();     
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', 'Select Object'));
        for(Schema.SObjectType f : ProcessInstance.TargetObjectId.getDescribe().getReferenceTo())
        {
            options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
        }
        return options;
    }
    
    public void objField(){
        FieldResultList = new List <FieldResults>();
        system.debug('object name??? ' +val);
        SObjectType objectType = Schema.getGlobalDescribe().get(val);
        Map<String,Schema.SObjectField> mfields = objectType.getDescribe().fields.getMap();
        system.debug(mfields);
        
        for(Schema.SObjectField fieldVal : mfields.Values()){
            
            Boolean isBooleanType;
            
            FieldResults f = new FieldResults();
            f.labelName = fieldVal.getDescribe().getLabel();
            f.APIName = fieldVal.getDescribe().getName();
            if(string.valueof(fieldVal.getDescribe().getType()) == 'REFERENCE'){
                f.FieldType = string.valueof(fieldVal.getDescribe().getType())+string.valueOf(fieldVal.getDescribe().getReferenceTo());
            } else {
                f.FieldType = string.valueof(fieldVal.getDescribe().getType());
            }
            
            f.RelationshipName = fieldVal.getDescribe().getRelationshipName();
            f.fieldLength =  fieldVal.getDescribe().getLength();
            f.inlineHelpText = fieldVal.getDescribe().getInlineHelpText();
            
            if(string.valueof(fieldVal.getDescribe().getType()) == 'BOOLEAN'){
                f.required = 'N/A';
            } else{
                if(fieldVal.getDescribe().isNillable() == true) {
                    f.required = 'No';
                } else {
                    f.required = 'Yes';
                }
            }
            
            if(fieldVal.getDescribe().isCustom() == true){
                f.isCustom = 'Yes';
            } else {
                f.isCustom = 'No';
            }
           
            
            
            //f.required = string.valueof(fieldVal.getDescribe().isNillable());
            schema.describefieldresult dfield = fieldVal.getDescribe();
            Schema.DisplayType FldType = fieldVal.getDescribe().getType();
            
            system.debug(fieldVal.getDescribe());
            FieldResultList.add(f);
            
        }
    }
    
    public list <FieldResults> FieldResultList {get;set;}
    
    public class FieldResults{
        public String LabelName {get;set;}
        public string APIName {get;set;}
        public string FieldType {get;set;}
        public string RelationshipName {get;set;}
        public integer fieldlength {get;set;}
        public string inlineHelpText {get;set;}
        public string required {get;set;}
        public string isCustom {get;set;}
    }
}