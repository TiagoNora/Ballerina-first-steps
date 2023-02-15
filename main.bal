import ballerina/http;
import teste.util;

service /employees on new http:Listener(8080) {

    resource function post .(@http:Payload util:Employee emp) returns int|error? {
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
