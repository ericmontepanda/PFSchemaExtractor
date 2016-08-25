public class PF_SchemaExtractor {
    public String val {get;set;}
    public string objName {get;set;}
    
    public List<SelectOption> getName()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();     
        List<SelectOption> options = new List<SelectOption>();
        
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
            FieldResults f = new FieldResults();
            f.labelName = fieldVal.getDescribe().getLabel();
            f.APIName = fieldVal.getDescribe().getName();
            if(string.valueof(fieldVal.getDescribe().getType()) == 'REFERENCE'){
                f.FieldType = string.valueof(fieldVal.getDescribe().getType()) +'-'+fieldVal.getDescribe().getSobjectField();
            } else {
                f.FieldType = string.valueof(fieldVal.getDescribe().getType());
            }
            
            f.RelationshipName = fieldVal.getDescribe().getRelationshipName();
            f.fieldLength =  fieldVal.getDescribe().getLength();
            f.inlineHelpText = fieldVal.getDescribe().getInlineHelpText(); 
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
    }
}