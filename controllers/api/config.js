var availableFields = {
    emp: {
        "id" : "sys_user.pk_",
        "employmentId" : "sys_employment.pk_",
        "firstname" : "sys_user.firstname",
        "lastname" : "sys_user.lastname",
        "department" :  "sys_ostr.cname"

        
    },
    building : {
        "id" : "sys_area.pk_",
        "name" : "sys_area.cname"
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
    }

};

var defaultFields = {
    emp: ["id", "firstname", "lastname"],
    building : ["id", "name"],
    map_zones : ["id", "name", "map_x", "map_y"],
    map_portals : ["id", "name", "map_x", "map_y", "zoneFrom", "zoneTo"]
};

module.exports = {
    availableFields: availableFields,
    defaultFields: defaultFields
};