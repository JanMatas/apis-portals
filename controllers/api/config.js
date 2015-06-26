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

    },
    department: {
        id : "d.id",
        name : "d.name",
        address : "b.address",
        city : "b.city",
        postcode : "b.postcode",
        country : "b.country"
    },
    permission: {
        employeeId : "e.id",
        firstname: "e.firstname",
        lastname: "e.lastname",
        

        zoneId : "z.id",


    }
};

var defaultFields = {
    emp: ["id", "firstname", "lastname"],
    department : ["id", "name"]
};

module.exports = {
    availableFields: availableFields,
    defaultFields: defaultFields
};