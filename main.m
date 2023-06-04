function All_Run()
clc
clear all
close all
format long
format compact
addpath('Public');
addpath('CEC2015');
TEV=Error(Dim(1));
runmax=25 ;
Fun_Num=1:15;

%算法内部参数
N=100;               %population size


TestData=[];
TestResult=[];
TestValue={};
TestTime=[];
TestRatio=[];
TestFES=[];
TestOptimization={};
TestParameter={};
for problem = Fun_Num
    parfor run=1:runmax
        [RunResult(run),RunValue(run,:),RunTime(run),RunFES(run),RunOptimization(run,:),RunParameter{1,run}]...
            =MRDE(problem,N,run);
    end
    sign=(RunResult<=TEV(problem));
    Ratio=sum(sign)/runmax;
    FES=sign.*RunFES;
    TestData=[TestData;RunResult];
    TestFitness=[TestFitness;RunResult];
    TestResult=[TestResult;min(RunResult) max(RunResult) median(RunResult) mean(RunResult) std(RunResult)];
    TestValue=[TestValue;mean(RunValue)];
    TestTime=[TestTime;mean(RunTime)];
    TestRatio=[TestRatio;Ratio];
    TestFES=[TestFES;mean(FES)];
    TestOptimization=[TestOptimization;RunOptimization];
    TestParameter=[TestParameter;RunParameter];
end


