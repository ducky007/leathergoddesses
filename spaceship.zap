

	.FUNCT	HOLD-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	FSET?	HERE,TOUCHBIT /?ELS5
	CALL	QUEUE,I-PASSENGER-SHIP-DEPARTS,12
	RSTACK	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS9
	PRINTI	"You are in the cargo hold of a giant spaceship. "
	EQUAL?	SIDEKICK-EXPLODED,1 \?CND10
	CALL	SPLATTERED-DESC
	PRINTI	" "
?CND10:	PRINTI	"A tiny viewport is set into the curving steel hull, and arched passageways lead in directions that we will arbitrarily call south and southwest."
	RTRUE	
?ELS9:	EQUAL?	RARG,M-END \FALSE
	ZERO?	SIDEKICK-EXPLODED \FALSE
	PRINTI	"   A radium-powered grenade clatters against the deck! You glimpse a shadowy figure, dressed in black, slipping away. "
	IN?	SIDEKICK,HERE \?ELS21
	SET	'FOLLOW-FLAG,12
	CALL	QUEUE,I-FOLLOW,2
	SET	'SIDEKICK-EXPLODED,1
	REMOVE	SIDEKICK
	MOVE	SPLATTERED-SIDEKICK,HERE
	CALL	DPRINT-SIDEKICK
	PRINTI	" yells to hit the deck, and hurls "
	CALL	HIM-HER
	PRINTI	"self onto the grenade!
   A sickening explosion splatters "
	CALL	DPRINT-SIDEKICK
	PRINTI	" all around the room! As you struggle to control your shock and nausea"
	CALL	MEMORIAM
	RSTACK	
?ELS21:	CALL	JIGS-UP,STR?384
	RSTACK	


	.FUNCT	SPLATTERED-DESC
	PRINTI	"Little "
	CALL	DPRINT,SPLATTERED-SIDEKICK
	PRINTI	" cover all the walls, the floor, and the ceiling."
	RTRUE	


	.FUNCT	SPLATTERED-SIDEKICK-F
	EQUAL?	PRSA,V?TASTE,V?LICK,V?EAT \FALSE
	PRINT	YECHH
	RTRUE	


	.FUNCT	STABLE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This must be the flagship for "
	PRINTD	LGOP
	PRINT	ATTACK-FLEET
	PRINTI	", since this stable contains "
	PRINTD	LGOP
	PRINT	ATTACK-FLEET
	PRINTI	" Cavalry Mounts. "
	FSET?	STALLION,NDESCBIT \?CND6
	PRINTI	"The most striking horse is a magnificent white stallion. "
?CND6:	PRINTI	"There are exits to the ""north"" and ""west."""
	RTRUE	


	.FUNCT	HOLD-ENTER-F
	IN?	PROTAGONIST,STALLION /?THN6
	FSET?	STALLION,MUNGBIT \?ELS5
?THN6:	PRINT	HORSE-CANT-FIT
	RFALSE	
?ELS5:	RETURN	HOLD


	.FUNCT	STALLION-F
	EQUAL?	STALLION,WINNER \?ELS5
	EQUAL?	PRSA,V?WALK \?ELS10
	IN?	PROTAGONIST,STALLION \?ELS10
	SET	'WINNER,PROTAGONIST
	CALL	DO-WALK,PRSO
	SET	'WINNER,STALLION
	RETURN	WINNER
?ELS10:	EQUAL?	PRSA,V?GIDDYAP \?ELS14
	SET	'WINNER,PROTAGONIST
	CALL	PERFORM,V?KICK,STALLION
	SET	'WINNER,STALLION
	RTRUE	
?ELS14:	PRINTR	"""Neighhh!!!"""
?ELS5:	EQUAL?	PRSA,V?DISEMBARK \?ELS18
	IN?	PROTAGONIST,STALLION \?ELS18
	MOVE	PROTAGONIST,HERE
	PRINTI	"You"
	CALL	AND-SIDEKICK,HERE
	PRINTR	" dismount."
?ELS18:	EQUAL?	PRSA,V?BOARD \?ELS22
	FCLEAR	STALLION,NDESCBIT
	RFALSE	
?ELS22:	EQUAL?	PRSA,V?PUSH-DIR \?ELS24
	EQUAL?	PRSI,INTDIR \?ELS24
	FSET	STALLION,MUNGBIT
	CALL	DO-WALK,P-DIRECTION
	FCLEAR	STALLION,MUNGBIT
	FCLEAR	STALLION,NDESCBIT
	MOVE	STALLION,HERE
	RTRUE	
?ELS24:	EQUAL?	PRSA,V?BOARD-DIR \?ELS28
	EQUAL?	P-PRSA-WORD,W?RIDE \?ELS28
	EQUAL?	PRSI,INTDIR \?ELS28
	CALL	PERFORM,V?BOARD,INTDIR
	RTRUE	
?ELS28:	EQUAL?	PRSA,V?EXAMINE \?ELS32
	PRINTR	"The stallion is a magnificent white stud."
?ELS32:	EQUAL?	PRSA,V?FUCK \?ELS34
	ZERO?	NAUGHTY-LEVEL \?ELS39
	CALL	PERFORM-PRSA,MALE-GORILLA
	RTRUE	
?ELS39:	PRINTR	"You and Catherine the Great."
?ELS34:	EQUAL?	PRSA,V?KICK \FALSE
	PRINTR	"The horse gallops around in a circle."


	.FUNCT	LONG-CORRIDOR-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"You are partway along an ""east-west"" hall of mind-numbing length. Rings of light pulsate along the corridor in rhythm with the ship's throbbing engines"
	EQUAL?	LONG-CORRIDOR-LOC,3 \?ELS8
	PRINTI	". A tiny alcove contains"
	CALL	APRINT,HOLE
	JUMP	?CND6
?ELS8:	EQUAL?	LONG-CORRIDOR-LOC,1 \?CND6
	PRINTI	". Openings lead ""east"" and ""northeast"""
?CND6:	PRINTI	"."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	IN?	STALLION,HERE \FALSE
	PRINTI	"   The stallion whinnies then gallops "
	EQUAL?	LONG-CORRIDOR-LOC,1 \?ELS17
	MOVE	STALLION,STABLE
	PRINTI	"ea"
	JUMP	?CND15
?ELS17:	MOVE	STALLION,AT-MAIN-HATCH
	PRINTI	"we"
?CND15:	PRINTR	"st."


	.FUNCT	LONG-CORRIDOR-EXIT-F
	EQUAL?	LONG-CORRIDOR-LOC,1 \?ELS5
	IN?	PROTAGONIST,STALLION /?THN11
	FSET?	STALLION,MUNGBIT \?ELS10
?THN11:	PRINT	HORSE-CANT-FIT
	RFALSE	
?ELS10:	RETURN	HOLD
?ELS5:	PRINT	CANT-GO
	RFALSE	


	.FUNCT	LONG-CORRIDOR-MOVEMENT-F
	IN?	PROTAGONIST,STALLION \?ELS3
	CALL	LONG-CORRIDOR-ENTER-F,TRUE-VALUE
	RSTACK	
?ELS3:	EQUAL?	PRSO,P?EAST \?ELS5
	EQUAL?	LONG-CORRIDOR-LOC,1 \?ELS8
	RETURN	STABLE
?ELS8:	DEC	'LONG-CORRIDOR-LOC
	JUMP	?CND1
?ELS5:	EQUAL?	LONG-CORRIDOR-LOC,10 \?ELS12
	RETURN	AT-MAIN-HATCH
?ELS12:	INC	'LONG-CORRIDOR-LOC
?CND1:	CALL	DESCRIBE-ROOM
	IN?	SIDEKICK,HERE \?CND15
	CALL	SIDEKICK-FOLLOWS-YOU
	RETURN	ROOMS
?CND15:	RETURN	ROOMS


	.FUNCT	AT-MAIN-HATCH-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	FSET	PRIVATE-CABIN-DOOR,LOCKEDBIT
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS7
	PRINTI	"To the ""north,"" the main hatch of the flagship is "
	CALL	OPEN-CLOSED,HATCH
	PRINTI	". A long corridor leads ""east."""
	RTRUE	
?ELS7:	EQUAL?	RARG,M-END \?ELS9
	CALL	ULTIMATELY-IN?,THORBAST-SWORD
	ZERO?	STACK \?THN12
	EQUAL?	SPACESHIP-SCENE-STATUS,3 \?ELS9
?THN12:	EQUAL?	SPACESHIP-SCENE-STATUS,1 /?ELS9
	CALL	I-PASSENGER-SHIP-DEPARTS
	RSTACK	
?ELS9:	EQUAL?	RARG,M-END \FALSE
	FSET?	SPACE-YACHT,TOUCHBIT \FALSE
	EQUAL?	SIDEKICK-EXPLODED,1 \FALSE
	SET	'SIDEKICK-EXPLODED,2
	MOVE	SIDEKICK,HERE
	REMOVE	SPLATTERED-SIDEKICK
	PRINTI	"   You hear panting as "
	CALL	DPRINT-SIDEKICK
	PRINTR	" dashes up behind you, somewhat out of breath. ""Good, you're still here! Thank God that time traveller who wandered by the hold had a matter reconstituter!"""


	.FUNCT	LONG-CORRIDOR-ENTER-F,ON-HORSE-IN-LONG-CORRIDOR=0
	IN?	PROTAGONIST,STALLION \?ELS5
	PRINTI	"Kicking your proud mount forcefully in the flank, you gallop down a long corridor pulsing with light. Above the echoes of the hoofbeats, you can hear, almost feel, the throbbing of mighty engines. After a minute of wild riding"
	PRINT	ELLIPSIS
	ZERO?	ON-HORSE-IN-LONG-CORRIDOR /?CND6
	EQUAL?	PRSO,P?EAST \?ELS12
	SET	'HERE,AT-MAIN-HATCH
	JUMP	?CND6
?ELS12:	SET	'HERE,STABLE
?CND6:	EQUAL?	HERE,AT-MAIN-HATCH \?ELS17
	SET	'LONG-CORRIDOR-LOC,1
	MOVE	STALLION,STABLE
	RETURN	STALLION
?ELS17:	SET	'LONG-CORRIDOR-LOC,10
	MOVE	STALLION,AT-MAIN-HATCH
	RETURN	STALLION
?ELS5:	RETURN	LONG-CORRIDOR


	.FUNCT	HATCH-ENTER-F
	FSET?	HATCH,OPENBIT /?ELS5
	CALL	DO-FIRST,STR?66,HATCH
	CALL	THIS-IS-IT,HATCH
	RFALSE	
?ELS5:	IN?	PROTAGONIST,STALLION /?THN8
	FSET?	STALLION,MUNGBIT \?ELS7
?THN8:	PRINT	HORSE-CANT-FIT
	RFALSE	
?ELS7:	RETURN	IN-SPACE


	.FUNCT	WHITE-SUIT-F
	EQUAL?	PRSA,V?TAKE-OFF \?ELS5
	EQUAL?	HERE,IN-SPACE \?ELS5
	CALL	QUEUE,I-CHILL,-1
	RFALSE	
?ELS5:	EQUAL?	PRSA,V?PUT-ON \FALSE
	FSET?	PRSI,ACTORBIT \FALSE
	CALL	WASTES
	RSTACK	


	.FUNCT	SPACE-YACHT-ENTER-F
	IN?	THORBAST,HERE \?ELS5
	CALL	DO-FIRST,STR?390
	RFALSE	
?ELS5:	EQUAL?	SPACESHIP-SCENE-STATUS,1 \?ELS7
	PRINT	CANT-GO
	RFALSE	
?ELS7:	RETURN	SPACE-YACHT


	.FUNCT	IN-SPACE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	CALL	DEQUEUE,I-PASSENGER-SHIP-DEPARTS
	SET	'CHILL-COUNTER,0
	CALL	QUEUE,I-CHILL,-1
	CALL	THIS-IS-IT,YOUNG-WOMAN
	CALL	THIS-IS-IT,BEM
	CALL	THIS-IS-IT,THORBAST
	ZERO?	SPACESHIP-SCENE-STATUS \FALSE
	REMOVE	BEM
	REMOVE	YOUNG-WOMAN
	REMOVE	THORBAST
	SET	'THORBAST-ATTACKED,FALSE-VALUE
	SET	'FIGHT-COUNTER,0
	SET	'DISARM-PROB,0
	SET	'FREE-MOVE-COUNTER,0
	FSET	SWORD,NARTICLEBIT
	FCLEAR	IN-SPACE,MUNGBIT
	PUTP	SWORD,P?SDESC,STR?391
	CALL	QUEUE,I-FIGHT,-1
	SET	'BEM-COUNTER,0
	CALL	QUEUE,I-BEM,-1
	RSTACK	
?ELS5:	EQUAL?	RARG,M-LOOK \?ELS12
	PRINTI	"You are floating in outer space near a "
	PRINTD	BATTLESHIP
	PRINTI	" (to the ""south"")"
	EQUAL?	SPACESHIP-SCENE-STATUS,1 /?CND13
	PRINTI	" and"
	CALL	APRINT,PASSENGER-SHIP
	PRINTI	" (to the ""north"")"
?CND13:	PRINTI	". "
	PRINT	BATTLESHIP-DESC
	PRINTI	" Saturn looms above (below?) you, her rings sparkling in the sunlight."
	RTRUE	
?ELS12:	EQUAL?	RARG,M-SMELL \FALSE
	PRINTI	"The rumors that "
	CALL	DPRINT,THORBAST
	PRINTI	" enjoys munching on hunks of raw garlic seem to be true. Let's hope "
	CALL	HE-SHE
	PRINTI	" doesn't talk anymore."
	RTRUE	


	.FUNCT	BATTLESHIP-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINT	BATTLESHIP-DESC
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?WALK-TO,V?BOARD,V?ENTER \?ELS7
	EQUAL?	HERE,IN-SPACE \?ELS12
	CALL	DO-WALK,P?SOUTH
	RSTACK	
?ELS12:	CALL	GLOBAL-IN?,BATTLESHIP,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	RTRUE	
?ELS7:	EQUAL?	PRSA,V?DISEMBARK,V?EXIT,V?LEAVE \FALSE
	EQUAL?	HERE,AT-MAIN-HATCH \?ELS21
	CALL	DO-WALK,P?NORTH
	RSTACK	
?ELS21:	EQUAL?	HERE,IN-SPACE \?ELS23
	PRINT	LOOK-AROUND
	RTRUE	
?ELS23:	PRINT	CANT-FROM-HERE
	RTRUE	


	.FUNCT	PASSENGER-SHIP-F
	EQUAL?	SPACESHIP-SCENE-STATUS,1 \?ELS5
	CALL	CANT-SEE,PASSENGER-SHIP
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?BOARD,V?WALK-TO,V?ENTER \?ELS7
	EQUAL?	HERE,IN-SPACE \?ELS12
	CALL	DO-WALK,P?NORTH
	RSTACK	
?ELS12:	EQUAL?	HERE,SPACE-YACHT \?ELS14
	PRINT	LOOK-AROUND
	RTRUE	
?ELS14:	PRINT	CANT-FROM-HERE
	RTRUE	
?ELS7:	EQUAL?	PRSA,V?DISEMBARK,V?EXIT,V?LEAVE \?ELS18
	EQUAL?	HERE,SPACE-YACHT \?ELS23
	CALL	DO-WALK,P?SOUTH
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?SEARCH \FALSE
	PRINT	NOTHING-NEW
	RTRUE	


	.FUNCT	GENERIC-SHIP-F
	EQUAL?	SPACESHIP-SCENE-STATUS,1 \FALSE
	RETURN	BATTLESHIP


	.FUNCT	I-CHILL
	INC	'CHILL-COUNTER
	EQUAL?	HERE,IN-SPACE \?THN4
	FSET?	WHITE-SUIT,WORNBIT \?CND1
?THN4:	SET	'CHILL-COUNTER,0
	CALL	DEQUEUE,I-CHILL
	RFALSE	
?CND1:	PRINTI	"   "
	EQUAL?	CHILL-COUNTER,1 \?ELS10
	PRINTR	"It sure gets chilly this far from the sun!"
?ELS10:	EQUAL?	CHILL-COUNTER,2,3 \?ELS12
	PRINTR	"You're becoming frigid."
?ELS12:	CALL	JIGS-UP,STR?392
	RSTACK	


	.FUNCT	I-BEM
	INC	'BEM-COUNTER
	EQUAL?	HERE,IN-SPACE /?ELS3
	EQUAL?	BEM-COUNTER,12 \FALSE
	SET	'SPACESHIP-SCENE-STATUS,3
	CALL	DEQUEUE,I-BEM
	REMOVE	BEM
	REMOVE	YOUNG-WOMAN
	RFALSE	
?ELS3:	EQUAL?	BEM-COUNTER,1 /FALSE
?CND1:	PRINTI	"   "
	EQUAL?	BEM-COUNTER,2 \?ELS13
	MOVE	BEM,HERE
	PRINTI	"A "
	PRINTD	BEM
	PRINTI	", sort of a cross between a space squid and a humanoid tree, swims into view. Its hideous ""bark"" is covered with squirmy little suckers, and its branches wave about like tentacles. It takes one look around and heads straight towards the defenseless "
	CALL	DPRINT,YOUNG-WOMAN
	PRINT	PERIOD-CR
	RTRUE	
?ELS13:	EQUAL?	BEM-COUNTER,3 \?ELS15
	PRINTI	"The alien monstrosity reaches the "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	", and its tentacles begin undulating toward "
	CALL	HER-HIS
	PRINTR	" clothing."
?ELS15:	EQUAL?	BEM-COUNTER,12 \?ELS17
	SET	'FOLLOW-FLAG,4
	CALL	QUEUE,I-FOLLOW,2
	REMOVE	BEM
	REMOVE	YOUNG-WOMAN
	CALL	DEQUEUE,I-BEM
	SET	'SPACESHIP-SCENE-STATUS,3
	PRINTI	"The tree-squid finishes disrobing and untying the frenzied "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	". Wrapping a suckered tentacle around "
	CALL	HER-HIS
	PRINTR	" midsection, it swims away. You hear a shriek from the void, which slowly fades."
?ELS17:	PRINTI	"The monster "
	CALL	BEGIN-CONTINUE
	PRINTI	"undress the poor "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	", who "
	CALL	BEGIN-CONTINUE
	PRINTR	"shriek in terror."


	.FUNCT	BEGIN-CONTINUE
	EQUAL?	BEM-COUNTER,4 \?ELS3
	PRINTI	"begin"
	JUMP	?CND1
?ELS3:	PRINTI	"continue"
?CND1:	PRINTI	"s to "
	RTRUE	


	.FUNCT	I-FIGHT
	INC	'FIGHT-COUNTER
	EQUAL?	HERE,IN-SPACE /?ELS3
	CALL	QUEUE,I-PASSENGER-SHIP-DEPARTS,6
	CALL	DEQUEUE,I-FIGHT
	RFALSE	
?ELS3:	FSET?	THORBAST,MUNGBIT \?CND1
	CALL	DEQUEUE,I-FIGHT
	RFALSE	
?CND1:	PRINTI	"   "
	EQUAL?	FIGHT-COUNTER,1 \?ELS8
	MOVE	THORBAST,HERE
	MOVE	YOUNG-WOMAN,HERE
	PRINTI	"A figure in black, doubtless the same person who tossed the grenade into the hold, is near the smaller ship. Given "
	CALL	HIS-HER
	PRINTI	" mean expression and characteristic black outfit, it must be "
	CALL	DPRINT,THORBAST
	PRINTI	", the Chief Assassin for "
	PRINTD	LGOP
	PRINTI	".
   "
	CALL	DPRINT,THORBAST
	PRINTI	" is struggling with a "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	" of wealthy garb and demeanor. Noticing you, "
	CALL	HE-SHE
	PRINTI	" straps the "
	ZERO?	MALE /?CND9
	PRINTI	"wo"
?CND9:	PRINTI	"man to the hull of"
	CALL	TPRINT,PASSENGER-SHIP
	PRINTI	" and jumps toward you, stopping just a few feet away.
   With a chillingly evil grin, "
	CALL	HE-SHE
	PRINTI	" draws a long, pointed sword."
	FSET?	THORBAST,TOUCHBIT /?CND13
	FSET	THORBAST,TOUCHBIT
	PRINTI	" ""Ah, the escaped prisoner. Disposing of you will be a small but enjoyable feather in my cap."""
	FSET?	NOSE,MUNGBIT /?CND13
	PRINTI	" As "
	CALL	HE-SHE
	PRINTI	" speaks, a foul odor wafts toward you."
?CND13:	CRLF	
	JUMP	?CND6
?ELS8:	IN?	THORBAST-SWORD,THORBAST /?ELS20
	DEC	'FIGHT-COUNTER
	CALL	DPRINT,THORBAST
	PRINTI	" eyes you warily."
	CRLF	
	JUMP	?CND6
?ELS20:	GRTR?	FIGHT-COUNTER,1 \?ELS22
	ZERO?	THORBAST-ATTACKED \?ELS22
	CALL	DPRINT,THORBAST
	PRINTI	" takes advantage of your inactivity and "
	EQUAL?	FREE-MOVE-COUNTER,2 \?ELS27
	CALL	SHISHKABOB
	JUMP	?CND6
?ELS27:	INC	'FREE-MOVE-COUNTER
	PRINTI	"launches a fierce attack. You dodge, avoiding the blade more by luck than by skill."
	CRLF	
	JUMP	?CND6
?ELS22:	RANDOM	100
	LESS?	DISARM-PROB,STACK /?ELS31
	SET	'DISARM-PROB,0
	MOVE	THORBAST-SWORD,HERE
	FSET	THORBAST-SWORD,TAKEBIT
	FCLEAR	THORBAST-SWORD,NDESCBIT
	CALL	THIS-IS-IT,THORBAST-SWORD
	CALL	DPRINT,THORBAST
	PRINTI	" feints backward and then launches a blow straight at your neck! Moving with a speed rarely associated with anything besides self-preservation, you parry, knocking the sword out of "
	CALL	DPRINT,THORBAST
	PRINTI	"'s hands! It drifts toward you, spinning slowly."
	CRLF	
	JUMP	?CND6
?ELS31:	GRTR?	FIGHT-COUNTER,24 \?ELS33
	PRINTI	"Fatigue overcomes you. "
	CALL	DPRINT,THORBAST
	PRINTI	", exhibiting more stamina, "
	CALL	SHISHKABOB
	JUMP	?CND6
?ELS33:	EQUAL?	FIGHT-COUNTER,6,12,18 \?CND36
	PRINTI	"Your strength "
	FSET?	IN-SPACE,MUNGBIT /?ELS41
	FSET	IN-SPACE,MUNGBIT
	PRINTI	"begin"
	JUMP	?CND39
?ELS41:	PRINTI	"continue"
?CND39:	PRINTI	"s to ebb. "
?CND36:	ADD	DISARM-PROB,12 >DISARM-PROB
	RANDOM	100
	LESS?	33,STACK /?ELS46
	CALL	DPRINT,THORBAST
	PRINTI	"'s blade whirls invisibly toward you. Ducking, you feel the blade whiz by an inch above "
	PRINTD	HEAD
	PRINTI	"!"
	JUMP	?CND44
?ELS46:	RANDOM	100
	LESS?	50,STACK /?ELS48
	PRINTI	"You fend off a volley of powerful blows, leaving you dizzy."
	JUMP	?CND44
?ELS48:	CALL	DPRINT,THORBAST
	PRINTI	" lunges at your chest, but your own blade knocks "
	CALL	HIS-HER
	PRINTI	" away in the nick of time."
?CND44:	CRLF	
?CND6:	SET	'THORBAST-ATTACKED,FALSE-VALUE
	RTRUE	


	.FUNCT	SHISHKABOB
	CALL	JIGS-UP,STR?393
	RSTACK	


	.FUNCT	THORBAST-F,OARG=0
	ZERO?	OARG /?ELS5
	EQUAL?	OARG,M-OBJDESC? /TRUE
	EQUAL?	PRSA,V?EXAMINE /?CND10
	PRINTI	"   "
?CND10:	PRINTI	"Chief Assassin "
	CALL	DPRINT,THORBAST
	PRINTI	" floats before you, "
	CALL	HIS-HER
	PRINTI	" black-garbed body almost invisible against the backdrop of space. "
	CALL	HE-SHE,TRUE-VALUE
	PRINTI	" is "
	IN?	THORBAST-SWORD,THORBAST \?ELS17
	PRINTI	"brandishing a deadly-looking sword."
	RTRUE	
?ELS17:	PRINTI	"tensed, as though ready to strike like a snake."
	RTRUE	
?ELS5:	EQUAL?	THORBAST,WINNER \?ELS21
	EQUAL?	PRSA,V?WHAT \?ELS30
	EQUAL?	PRSO,LGOP /?THN27
?ELS30:	EQUAL?	PRSA,V?TELL-ABOUT \?ELS26
	EQUAL?	PRSO,ME \?ELS26
	EQUAL?	PRSI,LGOP \?ELS26
?THN27:	PRINTI	"""Just the name is enough to psych out a wimp like you. In fact, they simply liked the initials L.G.O.P. and "
	PRINTD	LGOP
	PRINTR	" was the first thing they thought of."""
?ELS26:	CALL	DPRINT,THORBAST
	PRINTI	" ignores you, although "
	CALL	HIS-HER
	PRINTI	" evil grin widens a bit."
	CRLF	
	CALL	STOP
	RSTACK	
?ELS21:	EQUAL?	PRSA,V?FOLLOW \?ELS36
	EQUAL?	FOLLOW-FLAG,7 \?ELS41
	PRINT	DONT-WANT-TO
	RTRUE	
?ELS41:	EQUAL?	FOLLOW-FLAG,12 \FALSE
	CALL	DO-WALK,P?SW
	RSTACK	
?ELS36:	EQUAL?	PRSA,V?LEAP,V?WALK-AROUND \?ELS45
	CALL	DPRINT,THORBAST
	PRINTI	", who's nobody's fool, keeps you in front of "
	CALL	HIM-HER
	PRINT	PERIOD-CR
	RTRUE	
?ELS45:	EQUAL?	PRSA,V?GIVE \?ELS47
	EQUAL?	PRSO,SWORD \?ELS47
	CALL	DPRINT,THORBAST
	PRINTI	", delighted by your gift, "
	CALL	SHISHKABOB
	RSTACK	
?ELS47:	EQUAL?	PRSA,V?CUT,V?KILL \?ELS51
	CALL	PLAYER-CANT-SEE
	ZERO?	STACK \TRUE
	ZERO?	PRSI \?CND52
	IN?	SWORD,PROTAGONIST /?THN60
	IN?	THORBAST-SWORD,PROTAGONIST \?ELS59
?THN60:	SET	'PRSI,SWORD
	PRINTI	"[with the sword]"
	CRLF	
	JUMP	?CND52
?ELS59:	SET	'PRSI,HANDS
?CND52:	EQUAL?	PRSI,THORBAST-SWORD,SWORD \?ELS68
	MOVE	PRSI,PROTAGONIST
	SET	'THORBAST-ATTACKED,TRUE-VALUE
	IN?	THORBAST-SWORD,THORBAST \?ELS73
	RANDOM	100
	LESS?	25,STACK /?ELS76
	PRINTI	"Your sword misses "
	CALL	DPRINT,THORBAST
	PRINTI	" by inches!"
	JUMP	?CND74
?ELS76:	RANDOM	100
	LESS?	33,STACK /?ELS78
	PRINTI	"You nick "
	CALL	DPRINT,THORBAST
	PRINTI	" on the arm, drawing blood!"
	JUMP	?CND74
?ELS78:	RANDOM	100
	LESS?	50,STACK /?ELS80
	PRINTI	"With a clang of steel, your sword smashes against "
	CALL	DPRINT,THORBAST
	PRINTI	"'s!"
	JUMP	?CND74
?ELS80:	PRINTI	"A mighty swing, but "
	CALL	DPRINT,THORBAST
	PRINTI	" easily dodges in this light gravity."
?CND74:	CRLF	
	RTRUE	
?ELS73:	CALL	DPRINT,THORBAST
	PRINTI	" somersaults in a neat circle, easily avoiding your thrust and ending up back in front of you. Further proof of "
	CALL	DPRINT,THORBAST
	PRINTI	"'s uncanny "
	CALL	VISIBLE?,THORBAST-SWORD
	ZERO?	STACK /?ELS87
	PRINTI	"agility"
	JUMP	?CND85
?ELS87:	PRINTI	"legerdemain"
?CND85:	MOVE	THORBAST-SWORD,THORBAST
	FSET	THORBAST-SWORD,NDESCBIT
	FCLEAR	THORBAST-SWORD,TAKEBIT
	PRINTI	": "
	CALL	HE-SHE
	PRINTI	" is again holding"
	CALL	TRPRINT,THORBAST-SWORD
	RSTACK	
?ELS68:	PRINT	YOU-CANT
	PRINTI	"expect to kill a tough g"
	ZERO?	MALE /?ELS94
	PRINTI	"uy"
	JUMP	?CND92
?ELS94:	PRINTI	"al"
?CND92:	PRINTI	" like "
	CALL	DPRINT,THORBAST
	PRINTI	" with"
	CALL	ARPRINT,PRSI
	RSTACK	
?ELS51:	EQUAL?	PRSA,V?GIVE \?ELS99
	EQUAL?	PRSO,THORBAST-SWORD \?ELS99
	SET	'SPACESHIP-SCENE-STATUS,2
	REMOVE	THORBAST
	REMOVE	THORBAST-SWORD
	SET	'FOLLOW-FLAG,7
	CALL	QUEUE,I-FOLLOW,2
	CALL	DEQUEUE,I-FIGHT
	FSET	THORBAST,MUNGBIT
	PRINTI	"As "
	CALL	DPRINT,THORBAST
	PRINTI	" accepts the sword, "
	CALL	INCREMENT-SCORE,5,15
	CALL	HE-SHE
	PRINTI	" realizes that such a gesture is the final proof that you are the good guy, and therefore "
	CALL	HE-SHE
	PRINTI	" hasn't got a chance of winning. Being a practical person, "
	CALL	DPRINT,THORBAST
	PRINTI	" saves both of you a lot of time and aggravation by goring "
	CALL	HIM-HER
	PRINTI	"self on "
	CALL	HIS-HER
	PRINTI	" own blade. Spewing droplets of blood, "
	CALL	HIS-HER
	PRINTI	" body drifts away into the blackness of space."
	CRLF	
	RETURN	8
?ELS99:	EQUAL?	PRSA,V?SMELL \?ELS105
	CALL	PERFORM-PRSA,ODOR
	RTRUE	
?ELS105:	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL	THORBAST-F,M-OBJDESC
	CRLF	
	RTRUE	


	.FUNCT	THORBAST-SUIT-F
	EQUAL?	PRSA,V?TAKE-OFF,V?TAKE \FALSE
	CALL	IMPOSSIBLES
	RSTACK	


	.FUNCT	THORBAST-SWORD-F
	EQUAL?	PRSA,V?RETURN \FALSE
	ZERO?	PRSI \FALSE
	IN?	THORBAST,HERE \FALSE
	CALL	PERFORM,V?GIVE,THORBAST-SWORD,THORBAST
	RTRUE	


	.FUNCT	YOUNG-WOMAN-F,OARG
	ZERO?	OARG /?ELS5
	EQUAL?	HERE,IN-SPACE \FALSE
	EQUAL?	OARG,M-OBJDESC? /TRUE
	PRINTI	"   A "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	" of refined bearing"
	CALL	DESCRIBE-YOUNG-WOMAN
	RSTACK	
?ELS5:	ZERO?	MALE /?ELS22
	CALL	NOUN-USED,W?MAN,YOUNG-WOMAN
	ZERO?	STACK \?THN19
?ELS22:	ZERO?	MALE \?ELS18
	CALL	NOUN-USED,W?WOMAN,YOUNG-WOMAN
	ZERO?	STACK /?ELS18
?THN19:	EQUAL?	PRSO,YOUNG-WOMAN \?ELS29
	CALL	PERFORM-PRSA,MAN-WOMAN,PRSI
	RTRUE	
?ELS29:	CALL	PERFORM-PRSA,PRSO,MAN-WOMAN
	RTRUE	
?ELS18:	EQUAL?	YOUNG-WOMAN,WINNER \?ELS33
	IN?	BEM,HERE \?ELS36
	EQUAL?	PRSA,V?SHUT-UP \?ELS36
	EQUAL?	PRSO,ROOMS \?ELS36
	PRINTI	"You might as well tell the stars not to shine."
	CRLF	
	JUMP	?CND34
?ELS36:	IN?	BEM,HERE \?ELS40
	PRINTI	"The "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	" is too busy screaming to reply."
	CRLF	
	JUMP	?CND34
?ELS40:	EQUAL?	PRSA,V?WHAT \?ELS46
	EQUAL?	PRSO,LGOP /?THN43
?ELS46:	EQUAL?	PRSA,V?TELL-ABOUT \?ELS42
	EQUAL?	PRSO,ME \?ELS42
	EQUAL?	PRSI,LGOP \?ELS42
?THN43:	PRINTI	"""They've built up a real interplanetary rep for debauchery, but actually they're just plain Kansas girls -- a group of sisters from Wichita, the daughters of Gus and Elmira Leather."""
	CRLF	
	JUMP	?CND34
?ELS42:	PRINTI	"The "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	" blinks shyly, but says nothing."
	CRLF	
?CND34:	CALL	STOP
	RSTACK	
?ELS33:	CALL	TOUCHING?,YOUNG-WOMAN
	ZERO?	STACK /?ELS52
	IN?	THORBAST,HERE \?ELS52
	CALL	PERFORM,V?KILL,BEM
	RTRUE	
?ELS52:	EQUAL?	PRSA,V?EXAMINE \?ELS56
	EQUAL?	HERE,IN-SPACE \?ELS56
	PRINTI	"The "
	CALL	DPRINT,YOUNG-WOMAN
	CALL	DESCRIBE-YOUNG-WOMAN
	CRLF	
	RTRUE	
?ELS56:	EQUAL?	PRSA,V?FOLLOW \?ELS60
	EQUAL?	FOLLOW-FLAG,4 \?ELS65
	PRINT	DONT-WANT-TO
	RTRUE	
?ELS65:	EQUAL?	FOLLOW-FLAG,5 \?ELS67
	CALL	DO-WALK,P?NORTH
	RSTACK	
?ELS67:	EQUAL?	FOLLOW-FLAG,6 \FALSE
	CALL	DO-WALK,P?EAST
	RSTACK	
?ELS60:	EQUAL?	PRSA,V?SAVE-SOMETHING \?ELS71
	EQUAL?	HERE,IN-SPACE \?ELS71
	PRINTI	"Psst! "
	IN?	BEM,HERE \?ELS78
	PRINTI	"Kill"
	CALL	TRPRINT,BEM
	RSTACK	
?ELS78:	PRINTI	"Untie"
	CALL	TRPRINT,YOUNG-WOMAN
	RSTACK	
?ELS71:	EQUAL?	PRSA,V?UNTIE \?ELS82
	EQUAL?	HERE,IN-SPACE \?ELS82
	IN?	THORBAST,HERE \?ELS89
	CALL	PERFORM,V?TOUCH,YOUNG-WOMAN
	RTRUE	
?ELS89:	IN?	BEM,HERE \?ELS91
	CALL	DO-FIRST,STR?394
	RSTACK	
?ELS91:	MOVE	YOUNG-WOMAN,SPACE-YACHT
	SET	'FOLLOW-FLAG,5
	CALL	QUEUE,I-FOLLOW,2
	PRINTI	"You untie"
	CALL	TPRINT,YOUNG-WOMAN
	PRINTI	" who, beckoning you to follow, enters"
	CALL	TRPRINT,PASSENGER-SHIP
	RSTACK	
?ELS82:	EQUAL?	PRSA,V?KISS,V?FUCK,V?TOUCH /?THN98
	EQUAL?	PRSA,V?EAT \FALSE
?THN98:	EQUAL?	HERE,IN-SPACE \FALSE
	ZERO?	NAUGHTY-LEVEL /FALSE
	CALL	V-RAPE
	RSTACK	


	.FUNCT	DESCRIBE-YOUNG-WOMAN
	PRINTI	" is tied to the hull of the "
	PRINTD	PASSENGER-SHIP
	PRINTI	". "
	CALL	HER-HIS,TRUE-VALUE
	PRINTI	" elegantly expensive tunic is torn, exposing delicate white skin."
	IN?	BEM,HERE \TRUE
	PRINTI	" A "
	PRINTD	BEM
	PRINTI	" is attacking"
	CALL	TPRINT,YOUNG-WOMAN
	PRINTI	", who is understandably screaming at the top of "
	CALL	HER-HIS
	PRINTI	" lungs."
	RTRUE	


	.FUNCT	BEM-F
	CALL	TOUCHING?,BEM
	ZERO?	STACK /?ELS5
	IN?	THORBAST,HERE \?ELS10
	CALL	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	REMOVE	BEM
	CALL	DEQUEUE,I-BEM
	SET	'FOLLOW-FLAG,4
	CALL	QUEUE,I-FOLLOW,2
	SET	'BEM-COUNTER,12
	PRINTR	"The tree-monster squawks and flees, proving that its bark is worse than its bite."
?ELS5:	EQUAL?	PRSA,V?FOLLOW \FALSE
	EQUAL?	FOLLOW-FLAG,4 \FALSE
	PRINT	DONT-WANT-TO
	RTRUE	


	.FUNCT	I-PASSENGER-SHIP-DEPARTS
	EQUAL?	SPACESHIP-SCENE-STATUS,1 /FALSE
	SET	'SPACESHIP-SCENE-STATUS,1
	REMOVE	THORBAST
	REMOVE	BEM
	REMOVE	YOUNG-WOMAN
	CALL	DEQUEUE,I-BEM
	IN?	THORBAST-SWORD,IN-SPACE \?CND4
	REMOVE	THORBAST-SWORD
?CND4:	CALL	IN-SPACE?
	ZERO?	STACK /FALSE
	PRINTI	"   A rumbling from outside the ship sends shivers running through the deck."
	EQUAL?	HERE,HOLD /?THN13
	EQUAL?	HERE,AT-MAIN-HATCH \?CND10
	FSET?	HATCH,OPENBIT \?CND10
?THN13:	PRINTI	" Through the "
	EQUAL?	HERE,HOLD \?ELS19
	PRINTI	"viewport"
	JUMP	?CND17
?ELS19:	PRINTI	"hatchway"
?CND17:	PRINTI	", you see"
	CALL	TPRINT,PASSENGER-SHIP
	PRINTI	" roaring away on a tail of ion flame!"
?CND10:	CRLF	
	RTRUE	


	.FUNCT	SPACE-YACHT-F,RARG
	EQUAL?	RARG,M-END \FALSE
	IN?	YOUNG-WOMAN,HERE \FALSE
	SET	'FOLLOW-FLAG,6
	CALL	QUEUE,I-FOLLOW,2
	REMOVE	YOUNG-WOMAN
	FCLEAR	PRIVATE-CABIN-DOOR,LOCKEDBIT
	MOVE	PHOTO,PROTAGONIST
	CALL	INCREMENT-SCORE,17,13,TRUE-VALUE
	PRINTI	"   The "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	" turns to you. ""I am called Elysi"
	ZERO?	MALE /?ELS10
	PRINTI	"a"
	JUMP	?CND8
?ELS10:	PRINTI	"um"
?CND8:	PRINTI	"; my "
	ZERO?	MALE /?ELS16
	PRINTI	"fa"
	JUMP	?CND14
?ELS16:	PRINTI	"mo"
?CND14:	PRINTI	"ther is the wealthiest "
	ZERO?	MALE \?CND20
	PRINTI	"wo"
?CND20:	PRINTI	"man in the system. You will be grandly rewarded for saving me from that horrid kidnapper.""
   "
	CALL	SHE-HE,TRUE-VALUE
	PRINTI	" grabs a photo off the wall, scribbles on the back of it, and hands it to you. ""Here is "
	ZERO?	MALE /?ELS25
	PRINTI	"fa"
	JUMP	?CND23
?ELS25:	PRINTI	"mo"
?CND23:	PRINTI	"ther's address; see "
	CALL	HIM-HER
	PRINTI	" the next time you're on Ganymede, and you will be handsomely repaid. But now, I must retire to my cabin to recover from this hideous ordeal."" "
	ZERO?	MALE /?ELS31
	PRINTI	"She curtsie"
	JUMP	?CND29
?ELS31:	PRINTI	"He bow"
?CND29:	PRINTI	"s, a bit unsteadily, and exits to the east, closing the door behind "
	CALL	HER-HIM
	PRINT	PERIOD-CR
	RTRUE	


	.FUNCT	PRIVATE-CABIN-DOOR-F
	EQUAL?	PRSA,V?KNOCK \FALSE
	IN?	YOUNG-WOMAN,IN-SPACE /FALSE
	EQUAL?	SPACESHIP-SCENE-STATUS,3 /FALSE
	PRINTI	"""Please leave me to rest!"""
	FSET?	PRIVATE-CABIN-DOOR,LOCKEDBIT /?CND8
	FSET	PRIVATE-CABIN-DOOR,LOCKEDBIT
	FSET?	PRIVATE-CABIN-DOOR,OPENBIT \?ELS13
	FCLEAR	PRIVATE-CABIN-DOOR,OPENBIT
	PRINTI	" The door closes and y"
	JUMP	?CND11
?ELS13:	PRINTI	" Y"
?CND11:	PRINTI	"ou hear a click as the door is locked."
?CND8:	CRLF	
	RTRUE	


	.FUNCT	PRIVATE-CABIN-ENTER-F
	FSET?	PRIVATE-CABIN-DOOR,OPENBIT \?ELS3
	FCLEAR	PRIVATE-CABIN-DOOR,OPENBIT
	FSET	PRIVATE-CABIN-DOOR,LOCKEDBIT
	PRINTI	"Private Cabin
   You have entered a plush sleeping cabin. The "
	CALL	DPRINT,YOUNG-WOMAN
	PRINTI	" is standing in the center of the cabin, clutching "
	CALL	HER-HIS
	PRINTI	" clothes, looking shocked to see you."
	ZERO?	NAUGHTY-LEVEL \?ELS6
	PRINTI	" Naturally, you apologize and beat a hasty retreat."
	JUMP	?CND4
?ELS6:	CRLF	
	PRINTI	"   ""How dare you come in here without knocking! Am I to be allowed no privacy at all? Will my horror never end? Will..."" "
	CALL	SHE-HE,TRUE-VALUE
	PRINTI	" trails off and, as the multiple shocks of the day set in, begins sobbing. Moved, you take "
	CALL	HER-HIM
	PRINTI	" in your arms."
	EQUAL?	NAUGHTY-LEVEL,1 \?ELS11
	PRINTI	" One thing leads to another..."
	JUMP	?CND9
?ELS11:	CRLF	
	PRINTI	"   You dry "
	CALL	HER-HIS
	PRINTI	" tears, and as your bodies press closer, hysteria slowly turns to lust. You tenderly lead Elysi"
	ZERO?	MALE /?ELS16
	PRINTI	"a"
	JUMP	?CND14
?ELS16:	PRINTI	"um"
?CND14:	PRINTI	" to the bed, and within seconds, your bodies lock together in slow rhythm.
   After a series of spectacular climaxes, Elysi"
	ZERO?	MALE /?ELS22
	PRINTI	"a"
	JUMP	?CND20
?ELS22:	PRINTI	"um"
?CND20:	PRINTI	" is struck with an idea. ""Would ... would you like to tie me up? It really turns me on..."""
?CND9:	CRLF	
	PRINTI	"   Much, much later, making sure that Elysi"
	ZERO?	MALE /?ELS28
	PRINTI	"a"
	JUMP	?CND26
?ELS28:	PRINTI	"um"
?CND26:	PRINTI	" is sleeping peacefully, you tiptoe out of the cabin, closing the door."
?CND4:	CRLF	
	CRLF	
	CALL	DESCRIBE-ROOM
	RFALSE	
?ELS3:	CALL	THIS-IS-IT,PRIVATE-CABIN-DOOR
	CALL	DO-FIRST,STR?66,PRIVATE-CABIN-DOOR
	RFALSE	


	.FUNCT	PHOTO-F
	FSET?	PHOTO,UNTEEDBIT /FALSE
	EQUAL?	PRSA,V?READ \?ELS7
	PRINTI	"  ""Elysi"
	ZERO?	MALE /?ELS10
	PRINTI	"a's Dadd"
	JUMP	?CND8
?ELS10:	PRINTI	"um's Momm"
?CND8:	PRINTR	"y
   The Big House With All The Windows
   Ganymede"""
?ELS7:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"It is a "
	CALL	DPRINT,PHOTO
	PRINTI	" with writing on the back:"
	CRLF	
	CALL	PERFORM,V?READ,PHOTO
	RTRUE	

	.ENDI
