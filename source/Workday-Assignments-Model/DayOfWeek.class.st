Class {
	#name : #DayOfWeek,
	#superclass : #WorkdayBehavior,
	#instVars : [
		'day'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #'instance creation' }
DayOfWeek class >> on: aDay [

	^ self new initializeOn: aDay
]

{ #category : #initialization }
DayOfWeek >> initializeOn: aDay [

	day := aDay
]

{ #category : #testing }
DayOfWeek >> matchesWith: aDate [

	^ aDate day = day
]
