var availableFields = {
    emp: {
        id: "e.id",
        departmentId: "d.id",
        firstname: "e.firstname",
        lastname: "e.lastname",
        validFrom: "e.validFrom",
        validTo: "e.validTo",
        email: "e.email",
        phone: "e.phone",
        department: "d.name",
        
    }
};

var defaultFields = {
    emp: ["id", "firstname", "lastname"]
};

module.exports = {
    availableFields: availableFields,
    defaultFields: defaultFields
};