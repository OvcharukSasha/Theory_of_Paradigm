
findMedian([H|_],0,H):- !.
findMedian([_|T],C,X):-
    C1 is C-1,
    findMedian(T,C1,X).


getmedian(L,X):-
    msort(L,SortedL),
    length(SortedL,Len),
   (parn(Len)->(
    Len1 is (Len//2)-1,
    Len2 is Len//2,
    findMedian(SortedL,Len1,X1),
    findMedian(SortedL, Len2, X2),
    X is (X1+X2)/2) ;
   (Len3 is Len//2,
   findMedian(SortedL, Len3, X)).

indices(List, E, Is) :-
  findall(N,  nth1(N, List, E), Is).

mediana(L, Med, Is):-
    getmedian(L, Med),
    indices(L, Med, Is).

parn(N):-N mod 2=0.
