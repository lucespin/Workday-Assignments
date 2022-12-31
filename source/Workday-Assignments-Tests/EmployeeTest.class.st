Class {
	#name : #EmployeeTest,
	#superclass : #TestCase,
	#instVars : [
		'programmersDay',
		'christmas'
	],
	#category : #'Workday-Assignments-Tests'
}

{ #category : #accessing }
EmployeeTest >> fridayWorkday [

	^ Array with: (DayOfWeek on: Friday)
]

{ #category : #running }
EmployeeTest >> setUp [

	super setUp.

	programmersDay := September thirteenth, 2023.
	christmas := December twentyfifth, 2022
]

{ #category : #tests }
EmployeeTest >> testA [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (SpecificDate on: programmersDay)).

	self assert: (luna worksOn: programmersDay)
]

{ #category : #tests }
EmployeeTest >> testB [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (SpecificDate on: programmersDay)).

	self deny: (luna worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testC [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (DayOfWeek on: Wednesday)).

	self assert: (luna worksOn: programmersDay)
]

{ #category : #tests }
EmployeeTest >> testD [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (DayOfWeek on: Wednesday)).

	self deny: (luna worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testE [

	self
		should: [ Employee named: '' workingOn: self fridayWorkday ]
		raise: InstanceCreationFailed
		withMessageText: 'Une empleade debe tener un nombre.'
]

{ #category : #tests }
EmployeeTest >> testF [

	| lucas |
	lucas := Employee named: 'Luna' workingOn: (Array
			          with: (SpecificDate on: programmersDay)
			          with: (DayOfWeek on: Sunday)).

	self
		assert: (lucas worksOn: programmersDay);
		assert: (lucas worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testG [

	self
		should: [ Employee named: 'Luna' workingOn: Array empty ]
		raise: InstanceCreationFailed
		withMessageText: 'Une empleade debe tener días laborables.'
]
