var availableFields = {
    emp: {
        "id" : "sys_user.pk_",
        "employmentId" : "sys_employment.pk_",
        "firstname" : "sys_user.firstname",
        "lastname" : "sys_user.lastname",
        "department" :  "sys_ostr.cname",
        "email" : "sys_user.email" ,
        "phone" : "sys_user.phone",
        "allowedZones" : "user_permission.sys_area_pk_",
        "username" : "sys_user.loginname",
        "departmentId" : "sys_ostr.pk_",
        "tagNumber" : "sys_static_card.cardnumber"

    },
    building : {
        "id" : "sys_area.pk_",
        "name" : "sys_area.cname"
    },
    department : {
        "id" : "sys_ostr.pk_",
        "name" : "sys_ostr.cname",
        "sname" : "sys_ostr.shortname"


    },
    portal : {
        "id" : "sys_reader.pk_", 
        "name" : "sys_reader.cname",
        "zoneTo" : "sys_reader.area_inp_pk_",
        "zoneFrom" : "sys_reader.area_out_pk_",
        "raspiId" : "por_portal.raspiId"
    },
    map_zones : {
        "id" : "sys_area.pk_", 
        "name" : "sys_area.cname",
        "map_x" : "por_zone.map_x",
        "map_y" : "por_zone.map_y"
    },
    map_portals : {
        "id" : "sys_reader.pk_", 
        "name" : "sys_reader.cname",
        "map_x" : "por_portal.map_x",
        "zoneTo" : "sys_reader.area_inp_pk_",
        "zoneFrom" : "sys_reader.area_out_pk_",
        "map_y" : "por_portal.map_y"
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
        "zoneToName" : "in.cname"
    }

};

var defaultFields = {
    emp: ["id", "firstname", "lastname"],
    building : ["id", "name"],
    department : ["id", "name"],
    portal : ["id", "name"],
    map_zones : ["id", "name", "map_x", "map_y"],
    map_portals : ["id", "name", "map_x", "map_y", "zoneFrom", "zoneTo"],
    transaction : ["id", "firstname", "lastname", "timestamp", "employeeId"]
};

module.exports = {
    availableFields: availableFields,
    defaultFields: defaultFields
};