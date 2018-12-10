CXX = g++
CXXFLAGS = -O3 -g -std=c++11
CFLAGS=$(CXXFLAGS)
#LDFLAGS  = -static-libstdc++
LDFLAGS  =
#LIBS = -lm -lc
LIBS = -lm

HEADERS = calcdb.h Array.h
#TARGET  = exttpose getconf makebin b2a
TARGET  = makebin getconf exttpose cspade cspade-full

default: $(TARGET)

makebin: makebin_main.cc argv_parser.o makebin.o common.o argv_parser.h makebin.h common.h
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o makebin makebin_main.cc common.o makebin.o argv_parser.o $(LIBS)

getconf: getconf_main.cc argv_parser.o calcdb.o getconf.o argv_parser.o common.o argv_parser.h calcdb.h getconf.h argv_parser.h common.h
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o getconf getconf_main.cc common.o calcdb.o getconf.o argv_parser.o $(LIBS)

exttpose: exttpose_main.cc exttpose.o calcdb.o TransArray.o argv_parser.o common.o calcdb.h TransArray.h argv_parser.h common.h
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o exttpose exttpose_main.cc common.o exttpose.o calcdb.o argv_parser.o TransArray.o $(LIBS)

HEADER  = Array.h Itemset.h Lists.h Eqclass.h Partition.h common.h argv_parser.h spade_main.cc \
          Sequence.h SpadeArguments.h FreqIt.h EqGrNode.h InvertDatabase.h Partition.h ClassInfo.h
OBJS	= Itemset.o Array.o Eqclass.o Lists.o Partition.o Sequence.o common.o argv_parser.o \
          InvertDatabase.o SpadeArguments.o FreqIt.o EqGrNode.o ClassInfo.o

cspade: $(OBJS) $(HEADER)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o cspade spade_main.cc $(OBJS) $(LIBS)

FULL_HEADER = $(HEADER) makebin.h calcdb.h getconf.h TransArray.h exttpose.h wrappers.h
FULL_OBJS = $(OBJS) main.cc makebin.o calcdb.o getconf.o TransArray.o exttpose.o wrappers.o

cspade-full: $(FULL_OBJS) $(FULL_HEADER)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o cspade-full $(FULL_OBJS) $(LIBS)

clean:
	rm -rf *.o $(TARGET) *.dSYM
