public class PF_PermissionSetTracker {
    public List <ObjectPermissions> myObjectPS {get;set;}
    
    public void retObjPermSet(){
        
        List <PermissionSet> PSList = [SELECT Id,Label FROM PermissionSet ];//WHERE Label LIKE '%LDAP%'];
        system.debug('what is my PS LIst ' +PSLISt.size());
        Set <Id> pSetId = new Set <Id>();
        for(PermissionSet p: [SELECT Id,Label FROM PermissionSet]){ //WHERE Label LIKE '%LDAP%']){
            system.debug(p.id);
            pSetId.add(p.Id);
        }
        system.debug('what is my pSet Id ' +pSetId);
        myObjectPS = [SELECT Parent.Name, Parent.Label, ParentId,PermissionsCreate,PermissionsDelete,PermissionsEdit,
                                            PermissionsModifyAllRecords,PermissionsRead,PermissionsViewAllRecords,SobjectType 
                                            FROM ObjectPermissions where ParentId IN: pSetId];
        
        system.debug('what is my objPerm ' +myObjectPS);
        
       // myObjectPS.add(objPerm);
    }

}
