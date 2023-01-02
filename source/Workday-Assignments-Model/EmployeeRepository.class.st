Class {
	#name : #EmployeeRepository,
	#superclass : #Object,
	#instVars : [
		'employees'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #initialization }
EmployeeRepository >> initialize [

	employees := OrderedCollection new
]
