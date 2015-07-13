var apiConfig = require('./config');
var _ = require('lodash');

var getFields = function(req, endpoint) {

    availableFieldNames = Object.keys(apiConfig.availableFields[endpoint]);
    availableFields = apiConfig.availableFields[endpoint];
    defaultFields = apiConfig.defaultFields[endpoint];




    if (req.query.fields) {

        // Split the request query string to get requested fields
        requestedFields = req.query.fields.split(",");

        // Check if all the requested fields are available
        if ((_.difference(requestedFields, availableFieldNames)).length) {

            // Send bad request if not


            return undefined;
        }
    } else {
        requestedFields = [];
    }


    // Get the union of of requested and default fields
    requestedFields = _.union(requestedFields, defaultFields);
    colNames = [];

    var fields = {};
    // Create alliasing for the API fields
    requestedFields.forEach(function(element) {
        fields[apiConfig.availableFields[endpoint][element]] = element;
    });
    return fields;
};


var hasField = function (field, req) {
    if (!req.query.fields) {
        return false;
    }
    return (req.query.fields.split(",").indexOf(field) != -1);
};

module.exports = {
    getFields : getFields,
    hasField : hasField

};