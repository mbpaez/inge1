!classDefinition: #I category: 'Numeros-Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros-Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operations' stamp: 'fat 8/28/2022 23:09:26'!
* aFactor 
	^aFactor.! !

!I class methodsFor: 'operations' stamp: 'fat 8/25/2022 21:13:15'!
+ anAdder 
	^anAdder next! !

!I class methodsFor: 'operations' stamp: 'mbp 9/4/2022 15:23:00'!
- anNumber
	self error: 'Negative numbers are not supported'. ! !

!I class methodsFor: 'operations' stamp: 'mbp 9/4/2022 15:23:07'!
/ aDivisor 
	aDivisor = I ifTrue: [^I].
	self error: 'Can not divide by bigger number'.! !

!I class methodsFor: 'operations' stamp: 'fat 8/28/2022 23:52:45'!
< aFactor 
	aFactor = I ifTrue:[^false].
	^true! !

!I class methodsFor: 'operations' stamp: 'mbp 9/4/2022 15:26:08'!
negativeNumbersNotSupportedErrorDescription
	^'Negative numbers are not supported'.! !

!I class methodsFor: 'operations' stamp: 'fat 8/25/2022 21:08:53'!
next
	^II.! !

!I class methodsFor: 'operations' stamp: 'fat 8/29/2022 20:33:40'!
substraeteDe: aMinuend
	^aMinuend previous.! !


!classDefinition: #II category: 'Numeros-Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros-Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'operations' stamp: 'fat 8/28/2022 23:15:26'!
* aFactor 
	^self previous * aFactor + aFactor.! !

!II class methodsFor: 'operations' stamp: 'fat 8/25/2022 21:18:06'!
+ anAdder
	^ self previous + anAdder next.
	! !

!II class methodsFor: 'operations' stamp: 'mbo 9/4/2022 14:18:37'!
- aSubtrahend
	^aSubtrahend substraeteDe: self.! !

!II class methodsFor: 'operations' stamp: 'mbp 9/4/2022 15:23:16'!
/ aDivisor
	self < aDivisor ifTrue:[self error: 'Can not divide by bigger number'.]. "No se puede dividir por más grandes"
	self = aDivisor ifTrue:[^I]. "Caso no restar iguales porque 0 no está definido"
	self - aDivisor < aDivisor ifTrue: [^I]. "Caso base en el que no tengo que dividir más" 
	^self - aDivisor/ aDivisor + I. "Paso recursivo"! !

!II class methodsFor: 'operations' stamp: 'fat 8/28/2022 23:52:32'!
< aFactor 
	aFactor = I ifTrue:[^false].
	^(self previous < aFactor previous).! !

!II class methodsFor: 'operations' stamp: 'mbp 9/4/2022 15:26:16'!
canNotDivideByBiggerNumberErrorDescription
	^'Can not divide by bigger number'.! !

!II class methodsFor: 'operations' stamp: 'fat 9/1/2022 12:45:06'!
next
	next ifNil:[
		next _ II createChildNamed: self nombreEnRomano.
		next previous: self.
	].
	^next! !

!II class methodsFor: 'operations' stamp: 'fat 9/1/2022 12:44:41'!
nombreEnRomano
	(self name endsWith: 'CMXCIX') ifTrue: [^(self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue: [^(self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CDXCIX') ifTrue: [^(self name withoutSuffix: 'CDXCIX'), 'D'].
	(self name endsWith: 'CCCXCIX') ifTrue: [^(self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue: [^(self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'DXXXIX') ifTrue: [^(self name withoutSuffix: 'DXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue: [^(self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue: [^(self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'IX') ifTrue: [^(self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'VIII') ifTrue: [^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV') ifTrue: [^(self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'III') ifTrue: [^(self name withoutSuffix: 'III'), 'IV'].
	^self name,'I'! !

!II class methodsFor: 'operations' stamp: 'fat 8/25/2022 21:22:46'!
previous
	^previous! !

!II class methodsFor: 'operations' stamp: 'fat 8/25/2022 21:25:31'!
previous: aNumber
	previous := aNumber.! !

!II class methodsFor: 'operations' stamp: 'fat 8/25/2022 21:39:11'!
removeAllNext
	next ifNotNil:[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
	]! !

!II class methodsFor: 'operations' stamp: 'fat 8/29/2022 20:40:23'!
substraeteDe: aMinuend
	^aMinuend previous - self previous.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'mbp 9/4/2022 15:26:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Numeros-Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros-Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'mbp 9/4/2022 15:26:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	previous := II.! !


!classDefinition: #IV category: 'Numeros-Naturales'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'Numeros-Naturales'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'mbp 9/4/2022 15:26:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!