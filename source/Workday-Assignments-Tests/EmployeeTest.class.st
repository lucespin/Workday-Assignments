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
EmployeeTest >> testAnEmployeeMustHaveAName [

	self
		should: [ Employee named: '' workingOn: self fridayWorkday ]
		raise: InstanceCreationFailed
		withMessageText: 'Une empleade debe tener nombre.'
]

{ #category : #tests }
EmployeeTest >> testAnEmployeeMustHaveWorkdays [

	self
		should: [ Employee named: 'Pepe' workingOn: Array empty ]
		raise: InstanceCreationFailed
		withMessageText: 'Une empleade debe tener días laborables.'
]

{ #category : #tests }
EmployeeTest >> testAnEmployeeWhitDayOfWeekAsWorkdayWorksOnDateFallingOnThatDay [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (DayOfWeek on: Wednesday)).

	self assert: (luna worksOn: programmersDay)
]

{ #category : #tests }
EmployeeTest >> testAnEmployeeWhitSpecificDateAndDayOfWeekAsWorkdaysWorksOnCompatibleDates [

	| luna |
	luna := Employee named: 'Luna' workingOn: (Array
			          with: (SpecificDate on: programmersDay)
			          with: (DayOfWeek on: Sunday)).

	self
		assert: (luna worksOn: programmersDay);
		assert: (luna worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testAnEmployeeWhitSpecificDateAsUniqueWorkdayDoesNotWorkOnOtherDate [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (SpecificDate on: programmersDay)).

	self deny: (luna worksOn: christmas)
]

{ #category : #tests }
EmployeeTest >> testAnEmployeeWhitSpecificDateAsWorkdayWorksOnThatDate [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (SpecificDate on: programmersDay)).

	self assert: (luna worksOn: programmersDay)
]

{ #category : #tests }
EmployeeTest >> testAnEmployeeWithDayOfWeekAsWorkdayDoesNotWorkOnDateFallingOnAnotherDay [

	| luna |
	luna := Employee
		        named: 'Luna'
		        workingOn: (Array with: (DayOfWeek on: Wednesday)).

	self deny: (luna worksOn: christmas)
]
