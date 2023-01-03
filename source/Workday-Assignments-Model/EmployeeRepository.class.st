Class {
	#name : #EmployeeRepository,
	#superclass : #Object,
	#instVars : [
		'employees'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #asserting }
EmployeeRepository >> assertNotManaged: anEmployee [

	AssertionChecker
		refuse: [ employees includes: anEmployee ]
		because: (
			'<1s> ya fue dade de alta.' 
				expandMacrosWith: anEmployee asString)
		raising: ObjectAlreadyManaged
]

{ #category : #querying }
EmployeeRepository >> employeesWorkingOn: aDate [

	^ employees select: [ :employee | employee worksOn: aDate ]
]

{ #category : #initialization }
EmployeeRepository >> initialize [

	employees := OrderedCollection new
]

{ #category : #managing }
EmployeeRepository >> startManaging: anEmployee [

	self assertNotManaged: anEmployee.

	employees add: anEmployee
]
