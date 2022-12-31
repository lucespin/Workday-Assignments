Class {
	#name : #AAATest,
	#superclass : #TestCase,
	#instVars : [
		'programmerDay',
		'anotherDay',
		'wednesday'
	],
	#category : #'Workday-Assignments-Tests'
}

{ #category : #running }
AAATest >> setUp [

	super setUp.

	programmerDay := Date year: 2023 day: 256.
	anotherDay := Date year: 2023 day: 115.
	wednesday := GregorianCalendarDefinition new wednesday
]

{ #category : #tests }
AAATest >> testA [

	| lucas |
	lucas := Employee availableOn:
		         (Array with: (SpecificDate on: programmerDay)).

	self assert: (lucas isAvailableOn: programmerDay)
]

{ #category : #tests }
AAATest >> testB [

	| lucas |
	lucas := Employee availableOn:
		         (Array with: (SpecificDate on: programmerDay)).

	self deny: (lucas isAvailableOn: anotherDay)
]

{ #category : #tests }
AAATest >> testC [

	| lucas |
	lucas := Employee availableOn:
		         (Array with: (DayOfWeek on: wednesday)).

	self assert: (lucas isAvailableOn: programmerDay)
]

{ #category : #tests }
AAATest >> testD [

	| lucas |
	lucas := Employee availableOn:
		         (Array with: (DayOfWeek on: wednesday)).

	self deny: (lucas isAvailableOn: anotherDay)
]

{ #category : #tests }
AAATest >> testE [

	self
		should: [ Employee availableOn: Array empty ]
		raise: InstanceCreationFailed
		withMessageText:
			'Un empleado debe tener días disponibles para trabajar.'
]
