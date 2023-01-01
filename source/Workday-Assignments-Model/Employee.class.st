Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'workdays',
		'name'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #'instance creation' }
Employee class >> assertHasName: aName [

	AssertionChecker
		enforce: [ aName isNotEmpty ]
		because: 'Une empleade debe tener nombre.'
		raising: InstanceCreationFailed
]

{ #category : #preconditions }
Employee class >> assertHasWorkdays: aWorkdayCollection [

	AssertionChecker
		enforce: [ aWorkdayCollection isNotEmpty ]
		because: 'Une empleade debe tener días laborables.'
		raising: InstanceCreationFailed
]

{ #category : #'instance creation' }
Employee class >> named: aName workingOn: aWorkdayCollection [

	self
		assertHasName: aName;
		assertHasWorkdays: aWorkdayCollection.

	^ self new initializeNamed: aName workingOn: aWorkdayCollection
]

{ #category : #'instance creation' }
Employee >> initializeNamed: aName workingOn: aWorkdayCollection [

	name := aName.
	workdays := aWorkdayCollection
]

{ #category : #printing }
Employee >> printOn: aStream [

	aStream nextPutAll: name
]

{ #category : #querying }
Employee >> worksOn: aDate [

	^ workdays anySatisfy: [ :workday | workday matchesWith: aDate ]
]
