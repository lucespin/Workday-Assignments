Class {
	#name : #AAATest,
	#superclass : #TestCase,
	#category : #'Workday-Assignments-Tests'
}

{ #category : #tests }
AAATest >> testA [

	| date lucas |
	date := Date year: 2023 day: 256.
	lucas := Employee availableOn: date.

	self assert: (lucas isAvailableOn: date)
]

{ #category : #tests }
AAATest >> testB [

	| date anotherDate lucas |
	date := Date year: 2023 day: 256.
	anotherDate := Date year: 2023 day: 115.
	lucas := Employee availableOn: date.

	self deny: (lucas isAvailableOn: anotherDate)
]
