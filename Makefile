## This is Endemic_curves, a screens project directory
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

# Content

vim_session:
	bash -cl "vmt"

wrap_makeR = defined

Sources += $(wildcard *.R)

groupTest.Rout simpleGroup.Rout: distFuns.Rout groupFuns.Rout

propCurves.Rout: distFuns.Rout groupFuns.Rout propFuns.Rout propCurves.R

## A version of the first propCurves with a higher hline for talks
aedes.Rout: distFuns.Rout groupFuns.Rout propFuns.Rout aedes.R

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

-include makestuff/makeR.mk
-include makestuff/pdfpages.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
