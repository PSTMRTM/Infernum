/atom/movable/verb/pull()
	set name = "Pull"
	set category = "Object"
	set src in oview(1)

	if(Adjacent(usr))
		usr.start_pulling(src)
	return

/atom/verb/point()
	set name = "Point To"
	set category = "Object"
	set src in oview()
	var/atom/this = src//detach proc from src
	src = null

	if(!usr || !isturf(usr.loc))
		return
	if(usr.stat || usr.restrained())
		return
	if(usr.status_flags & FAKEDEATH)
		return

	var/tile = get_turf(this)
	if (!tile)
		return

	var/P = new /obj/effect/decal/point(tile)
	spawn (20)
		if(P)	qdel(P)

	usr.visible_message("<span class='examinebold'>[usr]</span> points at <span class='examine'>[this].</span>")
