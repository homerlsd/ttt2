global class StartRegistrationBatch implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful,Schedulable {

	private Id worldRecordId;
    private static final String STATUS_PENDING = 'Pending';
    private static final String STATUS_SUCCESS = 'Success';
    private static final String STATUS_FAILED = 'Failed';
    private  Integer counter = 0;

	global StartRegistrationBatch(Id worldRecordId) {
        this.worldRecordId = worldRecordId;

        if(StartRegistrationController.getWorldData(this.worldRecordId).isEmpty()) return;
	}

	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator([
            SELECT Id, Status__c, Username__c, Password__c, IsGDI__c, Start_Direction__c
            FROM PlayerRegistration__c
            WHERE WorldRegistration__c =: this.worldRecordId
                AND Status__c IN (:STATUS_PENDING , :STATUS_FAILED)
        ]);
	}

    global void execute(schedulablecontext sc){
        Id jobid = Database.executeBatch(new StartRegistrationBatch(this.worldRecordId), 1);
    }

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {

        if(this.counter >= 1) {
            Datetime sysTime = System.now().addMinutes(1);
            String chronExpression = '' + sysTime.second() + ' ' + sysTime.minute() + ' ' + sysTime.hour() + ' ' + sysTime.day() + ' ' + sysTime.month() + ' ? ' + sysTime.year();
            System.schedule( 'world registration' + sysTime, chronExpression, new StartRegistrationBatch(this.worldRecordId) );
            //String cronID = System.scheduleBatch(new StartRegistrationBatch(this.worldRecordId), 'world registration', 1);

            System.abortJob(BC.getJobId());
        }

        Map<String, Object> worldData = StartRegistrationController.getWorldData(this.worldRecordId);

        for(SObject prSO : scope) {
            PlayerRegistration__c pr = (PlayerRegistration__c)prSO;
            processRegistration(pr, worldData);
        }

        this.counter = this.counter + 1;

	}

	global void finish(Database.BatchableContext BC) {

	}

    public static void processRegistration(PlayerRegistration__c userReg, Map<String, Object> worldData) {

        Integer stage = 0;
        String prodPrefix = String.valueOf(worldData.get('ProdPrefix__c'));
        String worldId = String.valueOf(worldData.get('WorldId__c'));

        try {

            String sessionId = Utils.getSessionId(userReg.Username__c, userReg.Password__c, prodPrefix, worldId);

            // failed authorization
            if(String.isBlank(sessionId) || '00000000-0000-0000-0000-000000000000'.equals(sessionId)) {
                stage = 1;
            }

            if(stage == 0) {
                Integer fraction = (userReg.IsGDI__c) ? 1 : 2;
                String startDir = userReg.Start_Direction__c;

                Utils.invokeServerInfo(sessionId, prodPrefix, worldId, 0);

                Utils.invokeGetPlayerInfo(sessionId, prodPrefix, worldId, 0);

                String keepAlive = Utils.keepAlive(sessionId, prodPrefix, worldId);
                String slots = Utils.getFreeWorldSectorsSlots(sessionId, prodPrefix, worldId);
                String keepAlive2 = Utils.keepAlive(sessionId, prodPrefix, worldId);
                String createNewPlayerResult = Utils.createNewPlayer(sessionId, prodPrefix, worldId, fraction, startDir);

                if(createNewPlayerResult == '0') {
                    stage = 2;
                }
                else {
                    stage = 3;
                }
            }

        }
        catch(Exception e) {
            system.debug('--ecxeption--'+e.getMessage());
        }

        String statusResult = (stage == 2) ? STATUS_SUCCESS : STATUS_FAILED;

        if (stage == 2 || stage == 3) {
        //    update new PlayerRegistration__c(Id = userReg.Id, Status__c = statusResult, Stage__c = stage);
        }

    }
}