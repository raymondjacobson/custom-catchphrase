$ ->
	$('#startstop').click ->
		start()
	$('#next').click ->
 		next()
	$(document).keypress (e) ->
		alert e.keyCode
		start() if e.keyCode == 32
		next() if e.keyCode == 110
	# $(document).keypress (e) ->
	# 	if e.keyCode == 78
	# 		next()



start = () ->
	alert 'startstop'


next = () ->
	alert 'next'