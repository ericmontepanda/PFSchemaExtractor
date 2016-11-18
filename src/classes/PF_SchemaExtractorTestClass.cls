/****************************************
* Class Name : PF_SchemaExtractorTestClass * 
* Description: Test Class for PF_SchemaExtractor
* Application: Schema Extractor
* Created By : Eric Montelibano
* Last Modified Date: 09/21/2016
* ****************************************/
@isTest
public class PF_SchemaExtractorTestClass {
    public static testMethod void testSchemaExtractor() {
        PF_SchemaExtractor controller = new PF_SchemaExtractor();
        controller.getName();
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();  
        system.assert(gd.size() > 0);
        system.debug(gd[0]);
        controller.val = string.valueof(gd[0]);
        controller.objField();
    }
    
    /*public static testMethod void getSchemaObjet() {
        PF_SchemaExtractor controller = new PF_SchemaExtractor();
        controller.objName = 'Account';
        controller.getallSchema(); 
    }*/
    
    public static testMethod void testRetObjectName() {
        PF_SchemaExtractor controller = new PF_SchemaExtractor();
        controller.retObjectNames();
        
    }
    
    
    
    
}