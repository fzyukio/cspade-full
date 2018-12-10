cmake_minimum_required(VERSION 3.9)
project(utilities)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS_DEBUG "-g -O3 -fsanitize=undefined -fno-omit-frame-pointer")

add_executable(
        makebin
        makebin_main.cc
        argv_parser.cc argv_parser.h
        makebin.cc makebin.h
        common.cc common.h
        Env.h)

add_executable(
        getconf
        getconf_main.cc
        getconf.cc getconf.h
        argv_parser.cc argv_parser.h
        calcdb.cc calcdb.h
        common.cc common.h
        Env.h)

add_executable(
        exttpose
        exttpose_main.cc
        exttpose.cc exttpose.h
        argv_parser.cc argv_parser.h
        calcdb.cc calcdb.h
        TransArray.cc TransArray.h
        common.cc common.h
        Env.h)

add_executable(cspade
        spade_main.cc
        Sequence.cc Sequence.h
        Array.cc Array.h
        Itemset.cc Itemset.h
        Lists.cc Lists.h
        Eqclass.cc Eqclass.h
        InvertDatabase.cc InvertDatabase.h
        Partition.cc Partition.h
        common.cc common.h
        argv_parser.cc argv_parser.h
        Sequence.h Sequence.h
        SpadeArguments.cc SpadeArguments.h
        FreqIt.cc FreqIt.h
        EqGrNode.cc EqGrNode.h
        ClassInfo.cc ClassInfo.h
        Env.h)

add_executable(cspade-full
        main.cc
        makebin.cc makebin.h
        getconf.cc getconf.h
        exttpose.cc exttpose.h
        Sequence.cc Sequence.h
        wrappers.cc wrappers.h
        calcdb.cc calcdb.h
        TransArray.cc TransArray.h
        Array.cc Array.h
        Itemset.cc Itemset.h
        Lists.cc Lists.h
        Eqclass.cc Eqclass.h
        InvertDatabase.cc InvertDatabase.h
        Partition.cc Partition.h
        Sequence.cc Sequence.h
        common.cc common.h
        argv_parser.cc argv_parser.h
        Sequence.h Sequence.h
        SpadeArguments.cc SpadeArguments.h
        FreqIt.cc FreqIt.h
        EqGrNode.cc EqGrNode.h
        ClassInfo.cc ClassInfo.h
        Env.h)