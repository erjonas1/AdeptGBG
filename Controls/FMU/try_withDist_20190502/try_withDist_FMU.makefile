# FIXME: before you push into master...
RUNTIMEDIR=/usr/include/omc/c/
OMC_MINIMAL_RUNTIME=1
OMC_FMI_RUNTIME=1
include $(RUNTIMEDIR)/Makefile.objs
#COPY_RUNTIMEFILES=$(FMI_ME_OBJS:%= && (OMCFILE=% && cp $(RUNTIMEDIR)/$$OMCFILE.c $$OMCFILE.c))

fmu:
	rm -f try_withDist.fmutmp/sources/try_withDist_init.xml
	cp -a /usr/include/omc/c/* try_withDist.fmutmp/sources/include/
	cp -a /usr/share/omc/runtime/c/fmi/buildproject/* try_withDist.fmutmp/sources
	cp -a try_withDist_FMU.libs try_withDist.fmutmp/sources/

