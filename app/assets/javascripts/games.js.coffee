# Initial calls
$ ->
	# "globals" for phrase list
	window.gameon = false
	window.place = 0
	window.phrases_arr = phrases.split ", "
	window.phrases_arr = shuffle(window.phrases_arr)

	if $('#game') # if we're actually playing the game
		$('#startstop').click ->
			if window.gameon
				stop()
			else
				start()
		$('#next').click ->
	 		next()
		$(document).keypress (e) ->
			if e.keyCode == 115
				if window.gameon
					stop()
				else
					start()
			next() if e.keyCode == 32

###################################
# Global-esqe funcitons
###################################

# Fisher yates shuffle
shuffle = (a) ->
  # From the end of the list to the beginning, pick element `i`.
  for i in [a.length-1..1]
    # Choose random element `j` to the front of `i` to swap with.
    j = Math.floor Math.random() * (i + 1)
    # Swap `j` with `i`, using destructured assignment
    [a[i], a[j]] = [a[j], a[i]]
  # Return the shuffled array.
  a

###################################
# Game management related functions
###################################

start = () ->
	window.gameon = true
	$('#phrase').html window.phrases_arr[window.place]
	toggleStartStop("start")
	time = getBuzzerTime()
	# Do an initial beep
	playBeep()
	playBeeping time

stop = () ->
	window.gameon = false
	window.place = 0
	window.phrases_arr = shuffle(window.phrases_arr)
	$('#phrase').html "Press start to play"
	toggleStartStop("stop")
	clearInterval window.beeping
	clearInterval window.timesUp

toggleStartStop = (s) ->
	if s == "start"
		$('#startstop').html "Stop Playing"

	if s == "stop"
		$('#startstop').html "Start Playing"

	$('#startstop').toggleClass 'btn-success'
	$('#startstop').toggleClass 'btn-danger'

next = () ->
	if window.gameon
		window.place = window.place + 1
		if window.place == window.phrases_arr.length
			window.place = 0
		$('#phrase').html window.phrases_arr[window.place]

###################################
# Sound and timer related functions
###################################

getBuzzerTime = () ->
	random = Math.random() * 10000
	time = 30000 + random

timesUp = () ->
	window.gameon = false
	window.place = 0
	$('#phrase').html "Time's up!"
	playBuzzer()
	toggleStartStop("stop")
	clearInterval window.beeping

playBeep = () ->
 	beep = $('#beep-sound')
 	beep[0].play()

playBuzzer = () ->
	buzzer = $('#buzzer-sound')
	buzzer[0].play()

playBeeping = (time) ->
	beepingRate = time/20
	window.beeping = setInterval(( -> incrementingInterval beepingRate), beepingRate)
	window.timesUp = setTimeout timesUp, time

incrementingInterval = (beepingRate) ->
	clearInterval window.beeping
	beepingRate = beepingRate/(1.05)
	playBeep()
	window.beeping = setInterval(( -> incrementingInterval beepingRate), beepingRate)
