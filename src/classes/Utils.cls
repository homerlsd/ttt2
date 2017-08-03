public with sharing class Utils {

    private static String LOGIN_COOKIE_URL = 'https://www.tiberiumalliances.com/j_security_check';
    private static String SECURITY_CHECK_URL = 'https://www.tiberiumalliances.com/j_security_check';
    private static String WORLDBROWSER_URL = 'https://alliances.commandandconquer.com/en/game/worldBrowser';
    private static String WebWorldBrowser = 'https://gamecdnorigin.alliances.commandandconquer.com/WebWorldBrowser/index.aspx';
    //private string AJAX_ENDPOINT = 'https://gamecdnorigin.alliances.commandandconquer.com/Farm/Service.svc/ajaxEndpoint/';
    private static String AJAX_ENDPOINT = 'https://prodgame02.alliances.commandandconquer.com/325/Presentation/Service.svc/ajaxEndpoint/RankingGetData';
    //private static String AJAX_ENDPOINT_OPEN_SESSION = 'https://prodgame02.alliances.commandandconquer.com/325/Presentation/Service.svc/ajaxEndpoint/OpenSession';
    private static String AJAX_ENDPOINT_OPEN_SESSION = 'https://{0}.alliances.commandandconquer.com/{1}/Presentation/Service.svc/ajaxEndpoint/OpenSession';

    private static String POLL_ENDPOINT = 'https://{0}.alliances.commandandconquer.com/{1}/Presentation/Service.svc/ajaxEndpoint/Poll';

    public static String cookiePage;

    public static SystemInfoPlayer__c getDefaultSettings() {
        SystemInfoPlayer__c settings = SystemInfoPlayer__c.getValues('357');
        return settings;
    }

    public static SystemInfoPlayer__c getSettings(String worldId) {
        SystemInfoPlayer__c settings = SystemInfoPlayer__c.getValues(worldId);
        return settings;
    }

    //public static void resetSessionId() {
    //    TASettings__c settings = TAUtil.getSettings();
    //    if (settings.SessionId__c == NULL) {
    //        String resetedSessionId = getSessionId(settings.Username__c, settings.Password__c);
    //        settings.SessionId__c = resetedSessionId;
    //        update settings;
    //    }
    //}

    public static void invokeGetPlayerInfo(String sessionId, String prodPrefix, String worldId, Integer sequenceid) {
        String result;
        String dtS = String.valueOf(Datetime.now().getTime());
        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId
        };

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/GetPlayerInfo');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokeGetPlayerInfo--'+result);
        }
        catch (Exception e) {
        }
    }


    public static void invokeNotificationGetRange(String sessionId, String prodPrefix, String worldId, Integer sequenceid) {
        String result;
        String dtS = String.valueOf(Datetime.now().getTime());
        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId,
            'category' => 0,
            'skip' => 0,
            'take' => 50,
            'sortOrder' => 1,
            'ascending' => false
        };

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/NotificationGetRange');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokeNotificationGetRange--'+result);
        }
        catch (Exception e) {
        }
    }

    public static void invokeServerInfo(String sessionId, String prodPrefix, String worldId, Integer sequenceid) {
        String result;
        String dtS = String.valueOf(Datetime.now().getTime());
        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId
        };

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/GetServerInfo');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokeServerInfo--'+result);
        }
        catch (Exception e) {
        }
    }

     public static void invokeSetConfig(String sessionId, String prodPrefix, String worldId, Integer sequenceid) {
        String result;
        String dtS = String.valueOf(Datetime.now().getTime());
        Long dtL = Datetime.now().getTime();
        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId,
            'configValues' => new List<Map<String, Object>> {
                new Map<String, Object> {
                    'n' => 'tll',
                    'v' => dtL
                }
            }
        };



        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/SetConfig');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokeSetConfig-1--'+result);
        }
        catch (Exception e) {
        }

        Long dtL2 = Datetime.now().getTime();
        Map<String, Object> data2 = new Map<String, Object> {
            'session' => sessionId,
            'configValues' => new List<Map<String, Object>> {
                new Map<String, Object> {
                    'n' => 'tll',
                    'v' => dtL
                },
                new Map<String, Object> {
                    'n' => 'tlsl',
                    'v' => dtL2
                }
            }
        };

         http = new Http();
         //httpResponse;
         request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/SetConfig');
         dataString = JSON.serialize(data2);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokeSetConfig-2--'+result);
        }
        catch (Exception e) {
        }

    }

    public static void invokePoll2(String sessionId, String prodPrefix, String worldId, Integer sequenceid) {
        String result;
        String dtS = String.valueOf(Datetime.now().getTime());

        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId,
            'sequenceid' => sequenceid,
            'requests' => 'WC:ATIME:'+dtS+'CHAT:IGNOREL:WORLD:,(A-.(A- (A-:(A-2+A-3+A-4+A-5+A-l A-m A-n A-o A-U<A-V<A-W<A-X<A-GIFT:ACS:87ASS:0CAT:1',
            'requestid' => sequenceid
        };

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/Poll');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokePoll--'+result);
        }
        catch (Exception e) {
        }
    }

    public static void invokePoll(String sessionId, String prodPrefix, String worldId, Integer sequenceid) {
        String result;
        String dtS = String.valueOf(Datetime.now().getTime());
        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId,
            'sequenceid' => sequenceid,
            'requests' => 'WC:ATIME:'+ dtS + 'CHAT:IGNOREL:WORLD:GIFT:ACS:0ASS:0CAT:0',
            'requestid' => sequenceid
        };

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/Poll');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokePoll--'+result);
        }
        catch (Exception e) {
        }
    }

    public static void invokeRepairUnit(
            String sessionId,
            String prodPrefix,
            String worldId,
            Integer sequenceid,
            Integer entityId,
            Integer cityid) {

        String result;
        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId,
            'sequenceid' => sequenceid,
            'entityId' => entityId,
            'cityid' => cityid,
            'mode' => 4 // repair unit
        };

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/Repair');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokeRepairUnit--'+result);
        }
        catch (Exception e) {
        }
    }

    public static void invokeBattle(String sessionId, String prodPrefix, String worldId, Integer sequenceid) {
        //{"session":"99e1a0d5-e44b-4a53-8520-23dca92aa757","sequenceid":220,"battleSetup":{"d":4310245,"a":76811,"u":[{"i":101947300,"x":0,"y":0}],"s":0}}
        String result;
        Map<String, Object> data = new Map<String, Object> {
            'session' => sessionId,
            'sequenceid' => sequenceid,
            'battleSetup' => new Map<String, Object> {
                'd' => 7261586,
                'a' => 7310661,
                'u' => new List<Map<String, Object>> {
                    new Map<String, Object> {
                        'i' => 114630158,
                        'x' => 0,
                        'y' => 0
                    }
                },
                's' => 0
            }
        };

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Connection', 'keep-alive');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/InvokeBattle');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        System.debug('--dataString--'+dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--invokeBattle--'+result);
        }
        catch (Exception e) {
        }
    }


    public static String getInfoByName(String name, String sessionId, String prodPrefix, String worldId) {
        String result = '';
        Map<String, Object> data = new Map<String, Object>();
        data.put('name', name);
        data.put('session', sessionId);


        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/GetPublicPlayerInfoByName');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        system.debug(dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--getInfoByName--'+result);
        }
        catch (Exception e) {
        }
        return result;
    }

    //public static String getRanking(String sessionId, Integer startIndex, Integer endIndex) {
    //    String result = '';

    //    Map<String, Object> data = new Map<String, Object>();
    //    data.put('ascending', true);
    //    data.put('firstIndex', startIndex);
    //    data.put('lastIndex', endIndex);
    //    data.put('rankingType', 0);
    //    data.put('session', sessionId);
    //    data.put('sortColumn', 2);
    //    data.put('view', 0);

    //    Http http = new Http();
    //    HttpResponse httpResponse;
    //    HttpRequest request = new HttpRequest();
    //    request.setTimeout(120 * 1000);
    //    request.setMethod('POST');
    //    request.setHeader('Content-Type', 'application/json');
    //    request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
    //    request.setHeader('Host', 'prodgame02.alliances.commandandconquer.com');
    //    request.setHeader('Origin', 'https://prodgame02.alliances.commandandconquer.com');
    //    request.setHeader('Referer', 'https://prodgame02.alliances.commandandconquer.com/325/index.aspx');

    //    request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
    //    request.setEndpoint(AJAX_ENDPOINT);
    //    String dataString = JSON.serialize(data);
    //    request.setHeader('Content-Length', String.valueOf(dataString.length()));
    //    system.debug(dataString);
    //    request.setBody(dataString);

    //    try {
    //        httpResponse = http.send(request);
    //        result = httpResponse.getBody();
    //        system.debug('---getRanking---' +httpResponse.getBody());
    //    }
    //    catch (Exception e) {
    //    }
    //    return result;
    //}


    //public static Integer getPlayersCount() {
    //    return 3376;
    //    TASettings__c settings = TAUtil.getSettings();

    //    if (settings.SessionId__c == NULL) return 0;

    //    Integer result = 0;
    //    Map<String, Object> data = new Map<String, Object>();
    //    data.put('rankingType', 0);
    //    data.put('session', settings.SessionId__c);
    //    data.put('view', 0);

    //    Http http = new Http();
    //    HttpResponse httpResponse;
    //    HttpRequest request = new HttpRequest();
    //    request.setTimeout(120 * 1000);
    //    request.setMethod('POST');
    //    request.setHeader('Content-Type', 'application/json');
    //    request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
    //    request.setHeader('Host', 'prodgame02.alliances.commandandconquer.com');
    //    request.setHeader('Origin', 'https://prodgame02.alliances.commandandconquer.com');
    //    request.setHeader('Referer', 'https://prodgame02.alliances.commandandconquer.com/325/index.aspx');
    //    request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');

    //    request.setEndpoint('https://prodgame02.alliances.commandandconquer.com/325/Presentation/Service.svc/ajaxEndpoint/RankingGetCount');
    //    String dataString = JSON.serialize(data);
    //    request.setHeader('Content-Length', String.valueOf(dataString.length()));
    //    system.debug('--getPlayersCount--'+dataString);
    //    request.setBody(dataString);

    //    try {
    //        httpResponse = http.send(request);
    //        result = Integer.valueOF(httpResponse.getBody());
    //        system.debug('---getPlayersCount---' +httpResponse.getBody());

    //    }
    //    catch (Exception e) {
    //    }
    //    return result;
    //}

    public static String keepAlive(String sessionId, String prodPrefix, String worldId) {
        String result = '';
        Map<String, Object> data = new Map<String, Object>();
        data.put('session', sessionId);


        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Connection', 'keep-alive');

        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        //Origin:http://evil.com/
        //request.setHeader('Origin', 'http://evil.com/');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/KeepAlive');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        system.debug(dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--KeepAlive--'+result);
        }
        catch (Exception e) {
            System.debug('--KeepAlive-e-'+e.getMessage());
        }
        return result;
    }

    public static String getFreeWorldSectorsSlots(String sessionId, String prodPrefix, String worldId) {
        String result = '';
        Map<String, Object> data = new Map<String, Object>();
        data.put('session', sessionId);


        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Connection', 'keep-alive');

        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        //Origin:http://evil.com/
        //request.setHeader('Origin', 'http://evil.com/');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/GetFreeWorldSectorsSlots');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        system.debug(dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--GetFreeWorldSectorsSlots--'+result);
        }
        catch (Exception e) {
            System.debug('--GetFreeWorldSectorsSlots-e-'+e.getMessage());
        }
        return result;
    }


    public static String createNewPlayer(String sessionId, String prodPrefix, String worldId, Integer faction, String startDir) {
        String result = '';
        Map<String, Object> data = new Map<String, Object>();
        data.put('faction', faction);
        data.put('name', null);
        data.put('session', sessionId);
        data.put('startDir', startDir);


        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Connection', 'keep-alive');
        request.setHeader('Host', prodPrefix + '.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        //Origin:http://evil.com/
        //request.setHeader('Origin', 'http://evil.com/');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');

        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/CreateNewPlayer');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        system.debug(dataString);
        request.setBody(dataString);

        try {
            httpResponse = http.send(request);
            result = httpResponse.getBody();
            System.debug('--createNewPlayer--'+result);
        }
        catch (Exception e) {
            System.debug('--createNewPlayer-e-'+e.getMessage());
        }
        return result;
    }

    public static String getSessionId(String username, String password, String prodPrefix, String worldId) {
        String loginCookie = getLoginCookie();
        String secureCheckCookie = getSecureCheckCookie(username, password, loginCookie);
        String pageWithSessionId = getPageWithSessionId(secureCheckCookie);
        String preSessionId = parsePageWithSessionId(pageWithSessionId);
        String sessionId =  openSession(preSessionId, prodPrefix, worldId);
        return sessionId;
    }

    public static String openSession(String presessionId, String prodPrefix, String worldId) {
        String result = '';
        Map<String, Object> data = new Map<String, Object>();
        data.put('session', presessionId);
        data.put('reset', true);
        data.put('refId', -1);
        data.put('version', -1);
        data.put('platformId', 1);

        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Qooxdoo-Response-Type', 'application/json');
        request.setHeader('Host', prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Origin', 'https://'+prodPrefix+'.alliances.commandandconquer.com');
        request.setHeader('Referer', 'https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/index.aspx');
        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');

        request.setEndpoint('https://'+prodPrefix+'.alliances.commandandconquer.com/'+worldId+'/Presentation/Service.svc/ajaxEndpoint/OpenSession');
        String dataString = JSON.serialize(data);
        request.setHeader('Content-Length', String.valueOf(dataString.length()));
        request.setBody(dataString);
        system.debug('--dataString--'+dataString);

        try {
            httpResponse = http.send(request);
            String tmpresult = httpResponse.getBody();
            Map<String, Object> tmp = (Map<String, OBject>)JSON.deserializeUntyped(tmpresult);
            String resultSessionId = (String)tmp.get('i');
            result = resultSessionId;
            system.debug('---openSession---' +httpResponse.getBody());
            system.debug('--'+httpResponse.getBodyAsBlob());
        }
        catch (Exception e) {
        }
        return result;
    }

    public static String parsePageWithSessionId(String page) {
        String sessionId = '';
        Pattern myPattern = Pattern.compile('value=\"(.*?)\"');
        Matcher m = myPattern.matcher(page);
        while(m.find())
        {
            system.debug(m.group());
            String jopa2 = m.group();
            jopa2 = jopa2.replaceAll('value=\"','');
            sessionId = jopa2.replaceAll('\"','');
            system.debug(sessionId);
            return sessionId;
        }
        return sessionId;
    }

    public static String getLoginCookie() {
        String loginCookie = '';
        Map<String, Object> result = new Map<String, Object>();
        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('GET');
        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setEndpoint(LOGIN_COOKIE_URL);

        try {
            httpResponse = http.send(request);
            loginCookie = httpResponse.getHeader('Set-Cookie');
            system.debug('--loginCookie-'+loginCookie);
        }
        catch (Exception e) {

        }
        return loginCookie;
    }

    public static string securecookie = '';

    public static String getSecureCheckCookie(String username, String password, String loginCookie) {
        String secureCheckCookie = '';
        Map<String, Object> result = new Map<String, Object>();
        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('POST');
        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setHeader('Cookie', loginCookie);
        String postData = '_web_remember_me=&spring-security-redirect=&id=&timezone=3&j_username=' + EncodingUtil.urlEncode(username, 'UTF-8')+ '&j_password=' + password;
        system.debug(postData);
        request.setBody(postData);
        request.setEndpoint(SECURITY_CHECK_URL);

        try {
            httpResponse = http.send(request);
            secureCheckCookie = httpResponse.getHeader('Set-Cookie');

            cookiePage = httpResponse.getHeader('Set-Cookie');
            system.debug('--cookiePage--'+cookiePage);

        }
        catch (Exception e) {
        }
        return secureCheckCookie;
    }

    public static String getPageWithSessionId(String secureCheckCookie) {
        String result;
        Http http = new Http();
        HttpResponse httpResponse;
        HttpRequest request = new HttpRequest();
        request.setTimeout(120 * 1000);
        request.setMethod('GET');
        request.setEndpoint('https://www.tiberiumalliances.com/game/launch');
        request.setHeader('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');
        request.setHeader('Host', 'www.tiberiumalliances.com');
        request.setHeader('Referer', 'https://www.tiberiumalliances.com/ru/login/auth');
        request.setHeader('Cookie', secureCheckCookie);

        try {
            httpResponse = http.send(request);
            system.debug('--getPageWithSessionId--'+httpResponse.getBody());
            result = httpResponse.getBody();

        }
        catch (Exception e) {

        }
        return result;
    }

//05:02:44.626 (2745020433)|USER_DEBUG|[62]|DEBUG|--getInfoByName--{"a":1989,"an":"Reign of Fire 99","bd":33,"bde":28,"c":[{"i":1788375,"n":"homer","p":203465,"x":517,"y":713},{"i":2767903,"n":"bart","p":225200,"x":521,"y":713},{"i":3380154,"n":"HQ homer","p":505246,"x":519,"y":711},{"i":4394530,"n":"marge","p":208789,"x":517,"y":711},{"i":5599065,"n":"maggie","p":189306,"x":521,"y":711},{"i":6638482,"n":"lisa","p":194159,"x":519,"y":713}],"cw":[{"bt":0,"f":1,"ia":true,"n":"- I_am_Legion -","nc":"Back to School","ns":"Мир 19   ","r":2,"ws":1476705600583},{"bt":0,"f":1,"ia":true,"n":"Northern-PINK_Empire","nc":"Back to School","ns":"Мир 20    ","r":3,"ws":1476705600547},{"bt":0,"f":1,"ia":true,"n":"- I_am_Legion -","nc":"Summer Offensive","ns":"Мир 19   ","r":2,"ws":1469725200690},{"bt":0,"f":1,"ia":true,"n":"-UNITED-","nc":"Summer Offensive","ns":"Мир 21     ","r":2,"ws":1469725200660},{"bt":0,"f":1,"ia":true,"n":"-UNITED KILLERS-","nc":"Spring Invasion","ns":"Мир 21     ","r":3,"ws":1463342400720},{"bt":0,"f":1,"ia":true,"n":"- I_am_Legion -","nc":"Spring Invasion","ns":"Мир 19   ","r":1,"ws":1463342400077},{"bt":0,"f":1,"ia":true,"n":"- I_am_Legion -","nc":"April Invasion","ns":"Мир 19   ","r":2,"ws":1462046400820},{"bt":0,"f":1,"ia":true,"n":"-UNITED KILLERS-","nc":"April Invasion","ns":"Мир 21     ","r":3,"ws":1462046400413},{"bt":0,"f":1,"ia":true,"n":"-UNITED KILLERS-","nc":"Infected Egg Hunt","ns":"Мир 21     ","r":3,"ws":1459270800730},{"bt":1,"f":1,"ia":true,"n":"- I_am_Legion -","nc":"January Offensive","ns":"Мир 19   ","r":3,"ws":1454263200830},{"bt":0,"f":1,"ia":true,"n":"-UNITED OF ABADDON-","nc":"Black Friday Offensive","ns":"Мир 21     ","r":2,"ws":1448696192620}],"d":5,"dccc":211.68,"ew":[{"an":"Reign  of  Fire","f":2,"is":false,"iv":false,"mr":"Leader","n":"Tiberian 10                             ","r":1,"ws":1464383130877},{"an":"Northern Empire nex","f":1,"is":false,"iv":false,"mr":null,"n":"Мир 20    ","r":2,"ws":1421430207103},{"an":"--UNITED 2--","f":1,"is":false,"iv":false,"mr":null,"n":"Мир 19   ","r":3,"ws":1437245998937},{"an":"-UNITED OF ABADDON-","f":1,"is":false,"iv":false,"mr":null,"n":"Мир 21     ","r":5,"ws":1447534696727}],"f":2,"hchc":false,"i":17707,"ii":false,"lr":0,"mv":0.001,"mw":[{"bt":1,"ia":false,"n":"Commander","na":"20 Years CnC!","of":-1,"onjson":null,"ons":"Мир 21     ","or":-1,"ws":1453190400000}],"n":"homerlsd","np":50,"nr":1,"p":1526165,"r":57,"sli":[],"vp":0}


    public class PlayerWrapper {
        //"a":524,"an":"-Anvil-","aw":false,"bc":5,"er":0,"es":0,"ewf":1,"f":2,"p":82,"pn":"Andrsav","r":1,"s":321186,"vwr":0,"w":true
        public Integer a; //Alliance Id
        public String an; //Alliance Name
        public Integer bd;
        public Integer bde;

        public List<CityWrapper> c; //cityes

        public List<CWWrapper> cw;
        public Integer d;
        public Double dccc;
        public List<EWWrapper> ew;
        public Integer f;
        public Boolean hchc;
        public Integer i;
        public Boolean ii;
        public Integer ir;
        public double mv;
        public List<EmptyWrapper> mw;

        public String n; //Player Name
        public integer np;
        public integer nr;
        public integer p; //Player Id
        public integer r;
        public List<EmptyWrapper> sli;
        public Integer vp;

        ////public Integer bc; //Player Base count
        //public String pn; //Player Name
        //public Integer r; //Player Rank
        //public Integer s; //Player Total Score
        //public Integer p; //Player Id



        //public Boolean aw;
        //public Boolean w;
        //public Integer er;
        //public Integer es;
        //public Integer ewf;
        //public Integer f;
        //public Integer vwr;
    }

    public class EmptyWrapper {

    }

    //public class MWWrapper {
    //    public Integer bt;
    //    public Boolean ia;
    //    public String n;
    //    public String na;
    //    public Double of;


    //    public Boolean iv;
    //    public String mr;
    //    public String n;
    //    public integer r;
    //    public integer ws;


    //}

    public class EWWrapper {
        public String an;
        public integer f;
        public Boolean is;
        public Boolean iv;
        public String mr;
        public String n;
        public integer r;
        public integer ws;


    }

    public class CWWrapper {
        public integer bt;
        public integer f;
        public Boolean ia;
        public string n;
        public string nc;
        public string ns;
        public integer r;
        public integer ws;

    }


    public class CityWrapper {
        public Integer i; //sityId
        public String n; //sityName
        public Integer x;
        public Integer y;
        public Integer p;
    }

}