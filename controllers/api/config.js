var availableFields = {
    emp: {
        "id" : "sys_user.pk_",

        "firstname" : "sys_user.firstname",
        "lastname" : "sys_user.lastname",
        "department" :  "sys_ostr.cname",
        "email" : "sys_user.email" ,
        "phone" : "sys_user.phone",
        "allowedZones" : "emp_permission.sys_area_pk_",
        "tag" : "sys_user.tag",
        "departmentId" : "sys_ostr.pk_",
        "tagNumber" : "sys_user.tag"

    },
    building : {
        "id" : "sys_area.pk_",
        "name" : "sys_area.cname"
    },
    department : {
        "id" : "sys_ostr.pk_",
        "name" : "sys_ostr.cname",
     


    },
    portal : {
        "id" : "sys_reader.pk_", 
        "name" : "sys_reader.cname",
        "zoneTo" : "sys_reader.area_inp_pk_",
        "zoneFrom" : "sys_reader.area_out_pk_",
        "raspiId" : "sys_reader.raspiId"
    },
    map_zones : {
        "id" : "sys_area.pk_", 
        "name" : "sys_area.cname",
        "map_x" : "sys_area.map_x",
        "map_y" : "sys_area.map_y"
    },
    map_portals : {
        "id" : "sys_reader.pk_", 
        "name" : "sys_reader.cname",
        "map_x" : "sys_reader.map_x",
        "zoneTo" : "sys_reader.area_inp_pk_",
        "zoneFrom" : "sys_reader.area_out_pk_",
        "map_y" : "sys_reader.map_y"
    },
    transaction : {
        "id" : "sys_elog.pk_",
        "timestamp" : "UNIX_TIMESTAMP(sys_elog.t_date)",
        "firstname" : "sys_user.firstname",
        "lastname" : "sys_user.lastname",
        "employeeId" : "sys_user.pk_",
        "zoneFromId" : "out.pk_",
        "zoneToId" : "in.pk_",
        "zoneFromName" : "out.cname",
        "zoneToName" : "in.cname",
        "alarm" : "sys_elog.ss5",
        "direction" : "sys_elog.ss6"
    }

};

var defaultFields = {
    emp: ["id", "firstname", "lastname"],
    building : ["id", "name"],
    department : ["id", "name"],
    portal : ["id", "name"],
    map_zones : ["id", "name", "map_x", "map_y"],
    map_portals : ["id", "name", "map_x", "map_y", "zoneFrom", "zoneTo"],
    transaction : ["id", "firstname", "lastname", "timestamp", "employeeId", "alarm", "direction"]
};

module.exports = {
    availableFields: availableFields,
    defaultFields: defaultFields
};