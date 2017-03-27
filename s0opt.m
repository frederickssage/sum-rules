(* ::Package:: *)

(* ::Input:: *)
(*BeginPackage["TestPackage`"];*)
(*opts0::usage = "Module to iteratively optimize \!\(\*SubscriptBox[\(s\), \(0\)]\) and \!\(\*SubscriptBox[\(\[Tau]\), \(min\)]\) value. Assumes a pole contribution of 10% and \!\(\*FractionBox[\(\(<\)\(\[Alpha]GG\)\(>\)\(+\(\(<\)\(mqq\)\(>\)\)\)\), \((perturbation\\\ theory)\)]\)<=\!\(\*FractionBox[\(1\), \(3\)]\). Output is last two iterations of \!\(\*SubscriptBox[\(s\), \(0\)]\) and \!\(\*SubscriptBox[\(\[Tau]\), \(\(min\)\(\\\ \)\)]\)values to confirm consistency, {\!\(\*SuperscriptBox[SubscriptBox[\(s\), \(0\)], \(1\)]\), \!\(\*SuperscriptBox[SubscriptBox[\(s\), \(0\)], \(2\)]\),\!\(\*SuperscriptBox[SubscriptBox[\(\[Tau]\), \(min\)], \(1\)]\),\!\(\*SuperscriptBox[SubscriptBox[\(\[Tau]\), \(min\)], \(2\)]\)}."*)
(*upperbound\[Tau]::usage = "Function of sum-rule weight k. Determines most restrictive \!\(\*SubscriptBox[\(\[Tau]\), \(max\)]\) from the condition that: \!\(\*FractionBox[\(\(<\)\(\[Alpha]GG\)\(>\)\(+\(\(<\)\(mqq\)\(>\)\)\)\), \((perturbation\\\ theory)\)]\)<=\!\(\*FractionBox[\(1\), \(3\)]\) && \!\(\*FractionBox[\(\(<\)\(gggGGG\)\(>\)\), \(\(<\)\(\[Alpha]GG\)\(>\)\(+\(\(<\)\(mqq\)\(>\)\)\)\)]\)<=\!\(\*FractionBox[\(1\), \(3\)]\)."*)
(*Begin["`Private`"]*)
(*upperbound\[Tau][k_]:=Module[{percent,cond1,cond2},*)
(*percent=1/3;*)
(*cond1=\[Tau]/.FindRoot[Abs[Re@dim4Asym[\[Tau],k]/Re@pertAsym[\[Tau],k]]==percent//.applyNumericValues,{\[Tau],0.5}];*)
(*cond2=\[Tau]/.FindRoot[Abs[Re@dim6Asym[\[Tau],k]/Re@dim4Asym[\[Tau],k]]==percent//.applyNumericValues,{\[Tau],0.5}];*)
(*Piecewise[{{cond2,cond1>cond2},{cond1,cond1<cond2}}]*)
(*]*)
(*PC0[\[Tau]_,s0_,k_]:=(c10[\[Tau],s0,k]+c40[\[Tau],s0,k]+c60[\[Tau],s0,k]+c50[\[Tau],s0,k])/(Re@(pertAsym[\[Tau],k]+dim4Asym[\[Tau],k]+dim6Asym[\[Tau],k]+dim5Asym[\[Tau],k])//Chop) //.applyNumericValues//ReleaseHold//Chop*)
(*lowerbound\[Tau][k_?NumericQ,s0_?NumericQ]:=\[Tau]/.FindRoot[{PC0[\[Tau],s0,k]==.1},{\[Tau],0.1}]*)
(*opts0[s0init_,lowerbound\[Tau]init_,k_]:=*)
(*Module[{s0initial,s0opt1,s0opt2,lowerbound\[Tau]initial,lowerbound\[Tau]1,lowerbound\[Tau]2},*)
(*s0initial=s0init;*)
(*s0opt1=s0initial+10;*)
(*s0opt2=s0initial-10;*)
(*lowerbound\[Tau]initial=lowerbound\[Tau]init;*)
(*lowerbound\[Tau]1=lowerbound\[Tau]initial+0.1;*)
(*lowerbound\[Tau]2=lowerbound\[Tau]initial+0.05;*)
(*While[Abs[s0opt1-s0opt2]>0.05||Abs[lowerbound\[Tau]1-lowerbound\[Tau]2]>0.005,*)
(*Module[{avgM,s0,\[Tau],root1,root2,tauInterval},*)
(*(*sample 20 points in the tau range*)*)
(*tauInterval=Abs[upperbound\[Tau][k]-lowerbound\[Tau]initial]/20;avgM=Sum[mx[\[Tau],s0,k]/Length[Table[\[Tau],{\[Tau],(lowerbound\[Tau]initial),(upperbound\[Tau][k]),tauInterval}]],{\[Tau],lowerbound\[Tau]initial,(upperbound\[Tau][k]),tauInterval}];*)
(*s0opt1=s0/.FindMinimum[{Sum[(mx[\[Tau],s0,k]/avgM-1)^2,{\[Tau],lowerbound\[Tau]initial,(upperbound\[Tau][k]),tauInterval}]},{s0,s0initial},PrecisionGoal->0.001][[2]];*)
(*root1=FindRoot[Evaluate@PC0[\[Tau],s0opt1,k]==.1,{\[Tau],0.1}]//Chop;*)
(*lowerbound\[Tau]1=\[Tau]/.root1//Chop;*)
(*(*avgM=Sum[mx[\[Tau],s0]/Length[Table[\[Tau],{\[Tau],(lowerbound\[Tau]init),(upperbound\[Tau]),0.01}]],{\[Tau],lowerbound\[Tau]init,(upperbound\[Tau]),0.01}];*)*)
(*s0opt2=s0/.FindMinimum[{Sum[(mx[\[Tau],s0,k]/avgM-1)^2,{\[Tau],lowerbound\[Tau]1,(upperbound\[Tau][k]),tauInterval}]},{s0,s0initial},PrecisionGoal->0.001][[2]];*)
(*root2=FindRoot[Evaluate@PC0[\[Tau],s0opt2,k]==.1,{\[Tau],0.1}]//Chop;*)
(*lowerbound\[Tau]2=\[Tau]/.root2;*)
(*s0initial=s0opt2;*)
(*lowerbound\[Tau]initial=lowerbound\[Tau]2//Chop*)
(*];*)
(*];*)
(*{s0opt1,s0opt2,lowerbound\[Tau]1,lowerbound\[Tau]2}*)
(*]*)
(*End[]*)
(**)
(*EndPackage[]*)
