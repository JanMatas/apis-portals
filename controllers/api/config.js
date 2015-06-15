var availableFields = {
	emp : ["e.id","departmentId", "firstname", "lastname", "validFrom", "validTo", "email", "phone"]
}

var defaultFields = {
	emp : ["e.id","firstname", "lastname"]
}

module.exports = {
	availableFields : availableFields,
	defaultFields : defaultFields
}
