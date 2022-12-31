Class {
	#name : #EmployeeTest,
	#superclass : #TestCase,
	#instVars : [
		'programmersDay',
		'christmas'
	],
	#category : #'Workday-Assignments-Tests'
}

{ #category : #running }
EmployeeTest >> setUp [

	super setUp.

	programmersDay := September thirteenth, 2023.
	christmas := December twentyfifth, 2022
]

{ #category : #tests }
EmployeeTest >> testA [

	| lucas |
	lucas := Employee workingOn:
		         (Array with: (SpecificDate on: programmersDay)).

	self assert: (lucas worksOn: programmersDay)
]

{ #category : #tests }
EmployeeTest >> testB [

	| lucas |
	lucas := Employee workingOn:
		         (Array with: (SpecificDate on: programmersDay)).

	self deny: (lucas worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testC [

	| lucas |
	lucas := Employee workingOn: (Array with: (DayOfWeek on: Wednesday)).

	self assert: (lucas worksOn: programmersDay)
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
			          with: (SpecificDate on: programmersDay)
			          with: (DayOfWeek on: Sunday)).

	self
		assert: (lucas worksOn: programmersDay);
		assert: (lucas worksOn: christmas)
]
