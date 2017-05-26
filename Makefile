# Endemic_curves
### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

groupTest.Rout simpleGroup.Rout: distFuns.Rout groupFuns.Rout

propCurves.Rout: distFuns.Rout groupFuns.Rout propFuns.Rout propCurves.R

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
