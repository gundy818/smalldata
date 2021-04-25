

APP	:= smalldata

CRYSTAL	:= crystal
CRYSTALFLAGS	:=


all:	$(APP)

$(APP):	src/*.cr
	$(CRYSTAL) $(CRYSTALFLAGS) build src/smalldata.cr


