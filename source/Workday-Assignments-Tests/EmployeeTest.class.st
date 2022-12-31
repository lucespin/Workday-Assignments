Class {
	#name : #EmployeeTest,
	#superclass : #TestCase,
	#instVars : [
		'programmerDate',
		'christmas'
	],
	#category : #'Workday-Assignments-Tests'
}

{ #category : #running }
EmployeeTest >> setUp [

	super setUp.

	programmerDate := September thirteenth, 2023.
	christmas := December twentyfifth, 2022
]

{ #category : #tests }
EmployeeTest >> testA [

	| lucas |
	lucas := Employee workingOn:
		         (Array with: (SpecificDate on: programmerDate)).

	self assert: (lucas worksOn: programmerDate)
]

{ #category : #tests }
EmployeeTest >> testB [

	| lucas |
	lucas := Employee workingOn:
		         (Array with: (SpecificDate on: programmerDate)).

	self deny: (lucas worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testC [

	| lucas |
	lucas := Employee workingOn: (Array with: (DayOfWeek on: Wednesday)).

	self assert: (lucas worksOn: programmerDate)
]

{ #category : #tests }
EmployeeTest >> testD [

	| lucas |
	lucas := Employee workingOn: (Array with: (DayOfWeek on: Wednesday)).

	self deny: (lucas worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testE [

	self
		should: [ Employee workingOn: Array empty ]
		raise: InstanceCreationFailed
		withMessageText: 'Un empleado debe tener días laborables.'
]

{ #category : #tests }
EmployeeTest >> testF [

	| lucas |
	lucas := Employee workingOn: (Array
			          with: (SpecificDate on: programmerDate)
			          with: (DayOfWeek on: Sunday)).

	self
		assert: (lucas worksOn: programmerDate);
		assert: (lucas worksOn: christmas)
]
