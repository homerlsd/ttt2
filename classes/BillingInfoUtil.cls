public virtual with sharing class BillingInfoUtil {

    public static final String CONFIG_NAME = 'sandbox';
    public static final Integer VALID_STATUS_CODE = 200;

    public BillingInfoUtil() {}

    public static Billing_Api_Config__c API_CONFIG {
        get {
            if (API_CONFIG == null) {
                API_CONFIG = Billing_Api_Config__c.getInstance(CONFIG_NAME);
            }
            return API_CONFIG;
        }
        set;
    }

    public static Boolean isConfigValid() {

        if(API_CONFIG == null) {
            return false;
        }
        if(String.isEmpty(API_CONFIG.Endpoint__c) || String.isEmpty(API_CONFIG.Api_Key__c)) {
            return false;
        }

        return true;
    }

    public static List<Error_Log__c> getErrorLogs(List<Database.SaveResult> saveResults, String errorLocation){
        List<Error_Log__c> errorLogs = new List<Error_Log__c>();

        for (Database.SaveResult sr : saveResults) {
            errorLogs.addAll(constructErrorLogs(sr.getErrors(), errorLocation));
        }
        return errorLogs;
    }

    private static List<Error_Log__c> constructErrorLogs(List<Database.Error> errors, String errorLocation) {
        List<Error_Log__c> errorLogs = new List<Error_Log__c>();
        for(Database.Error err : errors) {
            errorLogs.add(
                new Error_Log__c(
                    Error_Message__c = err.getStatusCode() + ': ' + err.getMessage()
                )
            );
        }
        return errorLogs;
    }

    public class CalloutResult {

        public Map<String, Object> data {get; set;}
        public String errorMessage {get; set;}
        public Boolean error {get; set;}
        public Integer statusCode {get; set;}
        public CalloutRequest request {get; set;}

        public CalloutResult(){
            this.error = false;
            this.data = new Map<String, Object>();
            this.request = new CalloutRequest();
        }

        public void parse(String data) {
            try {
                this.data = (Map<String, Object>)JSON.deserializeUntyped(data);
            }
            catch(Exception e) {
                this.error = true;
                this.errorMessage = e.getMessage();
            }
        }
    }

    public class CalloutRequest {
        public String method {get; set;}
        public String url {get; set;}
        public String body {get; set;}

        public CalloutRequest() {}
    }

    public static String getRequestAsString(CalloutRequest request) {
        String result = '';

        if(request != null) {
            if(request.method != null) {
                result += 'Method: ' + request.method + '\r\n';
            }
            if(request.url != null) {
                result += 'Url: ' + request.url + '\r\n';
            }
            if(request.body != null) {
                result += 'Body: ' + request.body + '\r\n';
            }
        }

        return result;
    }

    public static DateTime getDateTime(Decimal unixTime) {
        DateTime result = null;

        try {
            Decimal timeSeconds = unixTime/1000;
            DateTime startDate = DateTime.newInstance(0);
            Integer startInt = Integer.valueOf(timeSeconds);
            result = startDate.addSeconds(startInt);
        }
        catch(Exception e) {}

        return result;
    }
}
