Class {
	#name : #BaselineOfWorkdayAssignments,
	#superclass : #BaselineOf,
	#category : #BaselineOfWorkdayAssignments
}

{ #category : #baselines }
BaselineOfWorkdayAssignments >> baseline: spec [

	<baseline>
	spec for: #pharo do: [ 
		self
			setUpDependenciesIn: spec;
			setUpPackagesIn: spec;
			setUpGroupsIn: spec ]
]

{ #category : #accessing }
BaselineOfWorkdayAssignments >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfWorkdayAssignments >> setUpDependenciesIn: spec [

	spec
		baseline: 'Aconcagua'
		with: [ spec repository: 'github://ba-st/Aconcagua:v8/source' ];
		baseline: 'Chalten'
		with: [ spec repository: 'github://ba-st/Chalten:v8/source' ];
		baseline: 'Buoy'
		with: [ spec repository: 'github://ba-st/Buoy:v6/source' ]
]

{ #category : #baselines }
BaselineOfWorkdayAssignments >> setUpGroupsIn: spec [

	spec
		group: 'Deployment' with: 'Workday-Assignments-Model';
		group: 'Tests' with: 'Workday-Assignments-Tests';
		group: 'CI' with: 'Tests';
		group: 'Development' with: 'Tests'
]

{ #category : #baselines }
BaselineOfWorkdayAssignments >> setUpPackagesIn: spec [

	spec
		package: 'Workday-Assignments-Model' with: [ spec requires: #('Aconcagua' 'Chalten' 'Buoy') ];
		package: 'Workday-Assignments-Tests' with: [ spec requires: 'Workday-Assignments-Model' ]
]
