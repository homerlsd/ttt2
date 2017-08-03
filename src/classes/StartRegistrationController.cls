public with sharing class StartRegistrationController {

    private final WorldRegistration__c worldRegistration;

    public StartRegistrationController(ApexPages.StandardController stdController) {
        this.worldRegistration = (WorldRegistration__c)stdController.getRecord();
    }

    public PageReference doAction() {
        Id recId = (Id)this.worldRegistration.get('Id');
        PageReference pr = new PageReference('/'+ recId);
        pr.setRedirect(true);

        if(isRunningBatch() == false) {
            Id jobid = Database.executeBatch(new StartRegistrationBatch(recId), 1);
        }

        return pr;
    }

    public static boolean isRunningBatch() {
        String batchClassId = '01p4100000IWVnv';

        AsyncApexJob[] jobs = [select id from AsyncApexJob where  Status IN ('Processing', 'Preparing', 'Queued') AND ApexClassId= :batchClassId AND JobType='BatchApex'];
        if (!jobs.isEmpty()) {
            return true;
        }

        return false;
    }


    public static Map<String, Object> getWorldData(String worldId) {
        Map<String, Object> result = new Map<String, Object>();

        List<WorldRegistration__c> rec = [SELECT ProdPrefix__c, WorldId__c FROM WorldRegistration__c WHERE Id = :worldId];
        if(!rec.isEmpty()) {
            result.put('ProdPrefix__c', rec.get(0).ProdPrefix__c);
            result.put('WorldId__c', rec.get(0).WorldId__c);
        }
        return result;
    }


}