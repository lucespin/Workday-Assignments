Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'availabilities'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #preconditions }
Employee class >> assertHasWorkdayAvailability: anAvailabilityCollection [

	AssertionChecker
		enforce: [ anAvailabilityCollection isNotEmpty ]
		because: 'Un empleado debe tener días disponibles para trabajar.'
		raising: InstanceCreationFailed
]

{ #category : #'instance creation' }
Employee class >> availableOn: anAvailabilityCollection [

	self assertHasWorkdayAvailability: anAvailabilityCollection.

	^ self new initializeAvailableOn: anAvailabilityCollection
]

{ #category : #'instance creation' }
Employee >> initializeAvailableOn: aDate [

	availabilities := aDate
]

{ #category : #testing }
Employee >> isAvailableOn: aDate [

	^ availabilities anySatisfy: [ :availability | 
		  availability satisfies: aDate ]
]
