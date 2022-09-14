!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'fat 9/13/2022 08:26:50'!
* aMultiplier 
	
	^aMultiplier multiplyToFirstEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'fat 9/13/2022 00:11:46'!
+ anAdder 
	^ anAdder addToFirstEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'fat 9/13/2022 00:43:54'!
- aSubtrahend 
	^aSubtrahend substractFromAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'fat 9/13/2022 08:39:27'!
/ aDivisor 
	^aDivisor divideToEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'mbp 9/13/2022 08:55:51'!
fibonacci
	self subclassResponsibility 
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 00:11:46'!
addToFirstEntero: anIntegerAdder
	^anIntegerAdder class with: anIntegerAdder integerValue + value. ! !

!Entero methodsFor: 'double dispatch messages' stamp: 'mbp 9/14/2022 16:20:48'!
addToFirstFraccion: anFirstFraccionAdder
	"Aprovechamos que la suma es conmutativa"
	^self + anFirstFraccionAdder.! !

!Entero methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 08:39:27'!
divideToEntero: anEnteroDividend
	^ Fraccion with: anEnteroDividend over: self! !

!Entero methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 08:37:05'!
divideToFraccion: aFraccionToDivide
	
	^(aFraccionToDivide numerator) / (aFraccionToDivide denominator * self).! !

!Entero methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 08:26:50'!
multiplyToFirstEntero: anEnteroFirstMultiplier 
	
	^anEnteroFirstMultiplier class with: anEnteroFirstMultiplier integerValue * value.! !

!Entero methodsFor: 'double dispatch messages' stamp: 'mbp 9/14/2022 16:17:07'!
multiplyToFirstFraccion: aFraccionFirstMultiplier
	"Aprovechamos que la multiplicacion es conmutativa"
	^self * aFraccionFirstMultiplier.! !

!Entero methodsFor: 'double dispatch messages' stamp: 'mbp 9/13/2022 08:44:43'!
substractFromAFraccion: aFraccionToSubstract
	
	^ aFraccionToSubstract numerator - (aFraccionToSubstract denominator * self)/ aFraccionToSubstract denominator.
	! !

!Entero methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 00:39:00'!
substractFromAnEntero: anEnteroToSubstract
	^ anEnteroToSubstract class with: anEnteroToSubstract integerValue - value! !


!Entero methodsFor: 'assert and do' stamp: 'mbp 9/14/2022 16:14:46'!
isNegativeDo: aClosure
	"Se espera que si el numero no es negativo, no haga nada"! !

!Entero methodsFor: 'assert and do' stamp: 'mbp 9/14/2022 16:14:55'!
isOneDo: aClosure
	"Se espera que si el numero no es uno, no haga nada"! !

!Entero methodsFor: 'assert and do' stamp: 'mbp 9/14/2022 16:15:07'!
isZeroDo: aClosure
	"Se espera que si el numero no es cero, no haga nada"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'mbp 9/13/2022 09:20:07'!
inCase: aClosureToCompare inicializeTheClass: aClass withValue: aValue orContinueWith: aClosureToContinue
	aClosureToCompare value ifTrue: [^ aClass new initalizeWith: aValue].
	aClosureToCompare value ifFalse: aClosureToContinue.! !

!Entero class methodsFor: 'instance creation' stamp: 'mbp 9/13/2022 09:25:11'!
inicializeInCorrectClass: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^ self inCase: [aValue < 0] inicializeTheClass: EnteroNegativo withValue: aValue orContinueWith:[
		^self inCase: [aValue = 0] inicializeTheClass: Cero withValue: aValue orContinueWith:[
			^self inCase: [aValue = 1] inicializeTheClass: Uno withValue: aValue orContinueWith:[
				^self inCase: [aValue > 1] inicializeTheClass: EnteroPositivoMayorAUno withValue: aValue orContinueWith:[
					self error: 'Estas en otro caso']
				]
			]
		].! !

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'mbp 9/13/2022 09:25:11'!
with: aValue 
	^self inicializeInCorrectClass:aValue! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'assert and do' stamp: 'mbp 9/14/2022 16:15:53'!
isZeroDo: aClosure
	aClosure value! !


!Cero methodsFor: 'arithmetic operations' stamp: 'mbp 9/13/2022 08:48:41'!
fibonacci
	| one |
	one := Entero with: 1.
	^one! !


!classDefinition: #EnteroNegativo category: 'Numero-Exercise'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'mbp 9/13/2022 08:50:21'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription ! !


!EnteroNegativo methodsFor: 'assert and do' stamp: 'fat 9/14/2022 09:47:46'!
isNegativeDo: aClosure
	aClosure value.! !


!classDefinition: #EnteroPositivoMayorAUno category: 'Numero-Exercise'!
Entero subclass: #EnteroPositivoMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroPositivoMayorAUno methodsFor: 'arithmetic operatios' stamp: 'mbp 9/13/2022 08:50:22'!
fibonacci
	
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	^ (self - one) fibonacci + (self - two) fibonacci! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'assert and do' stamp: 'fat 9/14/2022 09:49:46'!
isOneDo: aClosure
	aClosure value.! !


!Uno methodsFor: 'arithmetic operations' stamp: 'mbp 9/13/2022 08:50:22'!
fibonacci
	| one |
	one := Entero with: 1.
	^one! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'fat 9/13/2022 08:29:54'!
* aMultiplier 
	
	^aMultiplier multiplyToFirstFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'fat 9/13/2022 08:20:08'!
+ anAdder 
	
	^anAdder addToFirstFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'mbp 9/13/2022 08:45:06'!
- aSubtrahend 
	
	^ aSubtrahend substractFromAFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'fat 9/13/2022 08:37:33'!
/ aDivisor 
	
	^aDivisor divideToFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'mbp 9/14/2022 15:58:17'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZeroDo: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOneDo: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 00:11:46'!
addToFirstEntero: anIntegerAdder
	^anIntegerAdder * denominator + numerator / denominator .! !

!Fraccion methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 08:19:37'!
addToFirstFraccion: anFraccionFirstAdder
	
	| newNumerator newDenominator |
	
	newNumerator := (anFraccionFirstAdder numerator * denominator) + (anFraccionFirstAdder denominator * numerator).
	newDenominator := anFraccionFirstAdder denominator * denominator.
	
	^newNumerator / newDenominator
! !

!Fraccion methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 08:39:27'!
divideToEntero: anEnteroDividend
	^ Fraccion with: anEnteroDividend * denominator over:  numerator! !

!Fraccion methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 08:36:34'!
divideToFraccion: aFraccionToDivide
	
	^(aFraccionToDivide numerator * denominator) / (aFraccionToDivide denominator * numerator).
	! !

!Fraccion methodsFor: 'double dispatch messages' stamp: 'mbp 9/14/2022 16:18:56'!
multiplyToFirstEntero: anEnteroFirstMultiplier 
	
	^anEnteroFirstMultiplier *  numerator /  denominator.! !

!Fraccion methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 08:27:38'!
multiplyToFirstFraccion: aFraccionFirstMultiplier
	^(aFraccionFirstMultiplier numerator * numerator) / (aFraccionFirstMultiplier denominator * denominator).! !

!Fraccion methodsFor: 'double dispatch messages' stamp: 'mbp 9/13/2022 08:42:54'!
substractFromAFraccion: aFraccionToSubstract
	
	| newNumerator newDenominator |
	
	newNumerator := (aFraccionToSubstract numerator * denominator) - (aFraccionToSubstract denominator * numerator).
	newDenominator := aFraccionToSubstract denominator * denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'double dispatch messages' stamp: 'fat 9/13/2022 00:29:25'!
substractFromAnEntero: anEnteroToSubstract
	^ anEnteroToSubstract * denominator - numerator / denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'fat 9/14/2022 09:50:14'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZeroDo: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZeroDo: [ ^aDividend ].
	
	aDivisor isNegativeDo:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOneDo: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
