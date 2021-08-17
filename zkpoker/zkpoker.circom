include “../node_modules/circomlib/circuits/gates.circom”;
include “../node_modules/circomlib/circuits/comparators.circom”;
template Poker() {
 signal private input cards[5]; // Each 2..14
 signal input isSee; // 1 or 0
 signal input raise; // int
 signal input isFold; // 1 or 0
 signal output out; // 1 or 0
 // Intermediate results
 signal isBid;
 signal isRaise;
 signal hasChosen;
 // Count pairs
 var numPairs = 0;
 for (var i=0; i<4; i++) {
    for (var j=i+1; j<5; j++) {
       if (cards[i] == cards[j]) {
          numPairs++;
          // break doesn’t work. Just force j and i to exit
          j = 5;
          i = 5;
       }
    }
 }
 // isRaise = (raise != 0)
 isRaise <--(raise > 0);
 isBid <--(isRaise || isSee);
// Constraint: Must be either bid or fold: isBid XOR isFold = 1
 hasChosen <--isBid + isFold — 2*isBid*isFold;
 hasChosen === 1;
 // Constraint: numPairs must be > 0 if isBid = 1
 var hasPairs = (numPairs > 0);
 component not3 = NOT();
 not3.in <-- isBid;
 component or2 = OR();
 or2.a <-- hasPairs;
 or2.b <-- not3.out;
 or2.out === 1;
 out <-- or2.out;
}
component main = Poker();
