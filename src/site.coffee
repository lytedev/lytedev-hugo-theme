document.documentElement.classList.remove 'no-js'

# simple wrapper for console.log
log = ->
	if not console? then return false
	args = [].slice.apply arguments
	console.log.apply console, args

log 'Thanks for checking out my site\'s theme\'s code!'
log 'The raw source is available on my GitHub at https://github.com/lytedev'

# TODO: I should use the non-trig solution here...
easeInOut = (t) -> (Math.sin((t + (Math.PI / 2)) * (Math.PI)) + 1) / 2

# function for easing object number properties using requestAnimationFrame
animate = (obj, key, endValue, duration, easeFunc) ->
	# if we don't have requestAnimationFrame, just instantly set the value
	if not requestAnimationFrame? then return obj[key] = endValue
	if not easeFunc? then easeFunc = (time) -> time
	initialVal = parseFloat(obj[key])
	diff = parseFloat(endValue) - initialVal
	initialTime = 0
	elapsed = 0
	update = (elapsed) ->
		if initialTime == 0
			initialTime = elapsed
		else
			if elapsed - initialTime >= duration
				return obj[key] = endValue
			else
				obj[key] = initialVal + (easeFunc(parseFloat((elapsed - initialTime) / duration)) * diff)
		requestAnimationFrame update
	requestAnimationFrame update

do -> # setup scroll-to-content buttons
	scrollToMains = document.querySelectorAll '.scroll-to-main'
	header = document.getElementById 'site-header'
	main = document.getElementById 'site-content'
	for el in scrollToMains
		el.addEventListener 'click', ->
			scrollTo = main.offsetTop
			animate document.body, 'scrollTop', scrollTo, 500, easeInOut

do -> # resize body min-height to account for mobile address bar?
	window.addEventListener 'load', ->
		h = Math.max document.documentElement.clientHeight, (window.innerHeight or 0)
		console.log h, document.body.style.minHeight
		document.body.style.minHeight = h
