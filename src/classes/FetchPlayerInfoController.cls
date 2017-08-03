public with sharing class FetchPlayerInfoController {

    private String recordId;
    private SystemInfoPlayer__c config;
    private String sessionId;
    private String playerName;
    private String worldId;
    private String prodPrefix;
    private DateTime dtOpenSessionId;

    public FetchPlayerInfoController() {
        this.recordId = ApexPages.currentPage().getParameters().get('id');

        Player__c player = [SELECT Id, Name, Username__c, Password__c, World__r.WorldId__c, World__r.ProdPrefix__c, SessionId__c FROM Player__c WHERE Id = :this.recordId LIMIT 1];
        this.playerName = player.Name;


        String username;
        String password;

        if(String.isBlank(player.Username__c) || String.isBlank(player.Password__c)) {
            this.config = SystemInfoPlayer__c.getValues(String.valueOf(player.World__r.WorldId__c));
            worldId = this.config.WorldId__c;
            prodPrefix = this.config.ProdPrefix__c;
            username = this.config.Username__c;
            password = this.config.Password__c;
        }
        else {
            worldId = String.valueOf(player.World__r.WorldId__c);
            prodPrefix = player.World__r.ProdPrefix__c;
            username = player.Username__c;
            password = player.Password__c;
        }



        if(String.isBlank(player.SessionId__c)) {
            this.sessionId = Utils.getSessionId(
                username,//this.config.Username__c,
                password,//this.config.Password__c,
                prodPrefix,//this.config.ProdPrefix__c,
                worldId//this.config.WorldId__c
            );
            dtOpenSessionId = DateTime.now();
        }
        else {
            this.sessionId = player.SessionId__c;
        }

        //Utils.invokeBattle(this.sessionId, prodPrefix, worldId, 10);
        //Utils.invokeBattle(this.sessionId, prodPrefix, worldId, 11);
    }

    public PageReference pageAction() {
        PageReference result;
        try {
        String playerInfo = Utils.getInfoByName(this.playerName, this.sessionId, this.prodPrefix, this.worldId);
        //Utils.PlayerWrapper pw = (Utils.PlayerWrapper)JSON.deserializeStrict(playerInfo, Utils.PlayerWrapper.class);

        Map<String, Object> pw = (Map<String, Object>)JSON.deserializeUntyped(playerInfo);
        String allianceName = (String)pw.get('an');
        String playerId = String.valueOf(Integer.valueOf(pw.get('p')));
        List<Object> cityArray = (List<Object> )pw.get('c');

        List<City__c> cityes = new List<City__c>();
        Player__c player = new Player__c(Id = this.recordId, PlayerId__c = playerId, AllianceName__c = allianceName, SessionId__c = this.sessionId);
        if(dtOpenSessionId != null) {
            player.StartSessionId__c = dtOpenSessionId;
        }
        update player;

        //Utils.invokeBattle(this.sessionId, prodPrefix, worldId, 10);
        //Utils.invokeBattle(this.sessionId, prodPrefix, worldId, 11);

        for(Object cc : cityArray) {
            Map<String, Object> c = (Map<String, Object>)cc;
            String sityName =(String)c.get('n');
            Integer cityId = (Integer)c.get('i');
            Integer x = Integer.valueOf(c.get('x'));
            Integer y = Integer.valueOf(c.get('y'));

            City__c nc = new City__c(Name = sityName);
            nc.CityId__c = String.valueOf(cityId);
            nc.Player__c = this.recordId;
            nc.x__c = x;
            nc.y__c = y;

            cityes.add(nc);
        }

        upsert cityes CityId__c;
        }
        catch(Exception e) {}

        result = new PageReference('/'+this.recordId);
        result.setRedirect(true);
        return result;
    }
}