Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'availableDate'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #'instance creation' }
Employee class >> availableOn: aDate [

	^ self new initializeAvailableOn: aDate
]

{ #category : #'instance creation' }
Employee >> initializeAvailableOn: aDate [

	availableDate := aDate
]

{ #category : #testing }
Employee >> isAvailableOn: aDate [

	^ availableDate = aDate
]
