## This is Endemic_curves, a screens project directory
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

# Content

vim_session:
	bash -cl "vmt"

Sources += $(wildcard *.R)

groupTest.Rout simpleGroup.Rout: distFuns.Rout groupFuns.Rout

propCurves.Rout: distFuns.Rout groupFuns.Rout propFuns.Rout propCurves.R

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
