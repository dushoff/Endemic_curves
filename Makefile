## This is Endemic_curves, a screens project directory
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

# Content

vim_session:
	bash -cl "vmt"

autowrapR = defined

Sources += $(wildcard *.R)

groupTest.Rout simpleGroup.Rout: distFuns.rda groupFuns.rda

propCurves.Rout: distFuns.rda groupFuns.rda propFuns.rda propCurves.R

## A version of the first propCurves with a higher hline for talks
aedes.Rout: distFuns.rda groupFuns.rda propFuns.rda aedes.R

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

-include makestuff/pipeR.mk
-include makestuff/pdfpages.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
