import ballerina/http;
service / on new http:Listener(8081) {
    
    resource function get .() returns string|error? {
        return "Hello";
    }


}