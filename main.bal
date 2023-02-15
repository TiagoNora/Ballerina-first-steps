import ballerina/http;
import ballerina/io;
import teste.util;

service /employees on new http:Listener(8080) {

    resource function post .(@http:Header string authorization, @http:Payload util:Employee emp) returns int|error? {
        io:println(authorization);
        string header = authorization;
        int length = header.length();
        string token = header.substring(7, length);
        io:println(token);
        return util:addEmployee(emp);
    }
    
    resource function get [int id]() returns util:Employee|error? {
        return util:getEmployee(id);
    }
    
    resource function get .() returns util:Employee[]|error? {
        return util:getAllEmployees();
    }
    
    resource function put .(@http:Payload util:Employee emp) returns int|error? {
        return util:updateEmployee(emp);
    }
    
    resource function delete [int id]() returns int|error? {
        return util:removeEmployee(id);       
    }

}
