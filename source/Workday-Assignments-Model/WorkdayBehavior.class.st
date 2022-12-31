Class {
	#name : #WorkdayBehavior,
	#superclass : #Object,
	#category : #'Workday-Assignments-Model'
}

{ #category : #testing }
WorkdayBehavior >> matchesWith: aDate [

	^ self subclassResponsibility
]
