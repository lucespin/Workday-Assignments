Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'workdays'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #preconditions }
Employee class >> assertHasWorkdays: aWorkdayCollection [

	AssertionChecker
		enforce: [ aWorkdayCollection isNotEmpty ]
		because: 'Un empleado debe tener días laborables.'
		raising: InstanceCreationFailed
]

{ #category : #'instance creation' }
Employee class >> workingOn: aWorkdayCollection [

	self assertHasWorkdays: aWorkdayCollection.

	^ self new initializeWorkingOn: aWorkdayCollection
]

{ #category : #'instance creation' }
Employee >> initializeWorkingOn: aWorkdayCollection [

	workdays := aWorkdayCollection
]

{ #category : #querying }
Employee >> worksOn: aDate [

	^ workdays anySatisfy: [ :workday | workday matchesWith: aDate ]
]
