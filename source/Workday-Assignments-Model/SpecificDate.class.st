Class {
	#name : #SpecificDate,
	#superclass : #Availability,
	#instVars : [
		'date'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #'instance creation' }
SpecificDate class >> on: aDate [

	^ self new initializeOn: aDate
]

{ #category : #'instance creation' }
SpecificDate >> initializeOn: aDate [

	date := aDate
]

{ #category : #testing }
SpecificDate >> satisfies: aDate [

	^ date = aDate
]
