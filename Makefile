ERLC=/usr/local/bin/erlc
ERLCFLAGS=-o
ERL=/usr/local/bin/erl
ERLFLAGS=-pa
SRCDIR=src
BEAMDIR=./ebin

all: make_dir compile
	@ echo "Build complete"

compile:
	@ $(ERLC) $(ERLCFLAGS) $(BEAMDIR) $(SRCDIR)/*.erl

make_dir:
	@ mkdir -p $(BEAMDIR)

start:
	@ $(ERL) $(ERLFLAGS) $(BEAMDIR)

clean:
	@ rm -rf $(BEAMDIR)
	@ echo "Clean up complete"
