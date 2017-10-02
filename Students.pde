// Place student's code here
// Student's names: Anna Greene & Dibyendu Mondal
// Date last edited:
/* Functionality provided (say what works):
We created the 4-arcs caplet and the 6-arcs caplet
*/

void b1(pt S, pt E, pt L, pt R, float s, float e){
  beginShape(); 
  stroke(#66A4E2);
  fill(#A2E5CF);
  vec EL = V(E,L);
  vec T = R(U(S,L));
  float radius = (e*e - n2(EL))/(2 * dot(EL,T));
  vec LQ = T; LQ.scaleBy(radius);
  pt Q = P(L,LQ);
  float w = atan(radius/e);
  vec EM = R(U(E,Q),w).scaleBy(e);
  pt M = P(E,EM);
  //drawCircleArcInHat(L,Q,M);
  
  vec SR = V(S,R);
  T = R(U(E,R));
  radius = (s*s - n2(SR))/(2 * dot(SR,T));
  vec RP = T; RP.scaleBy(radius);
  pt P = P(R,RP);
  w = atan(radius/s);
  vec SO = R(U(S,P),w).scaleBy(s);
  pt O = P(S,SO);
  //drawCircleArcInHat(R,P,O);
  
  float a = angle(V(S,O),V(S,L)), da=a/40;
  if (a<0) {
    a = (TWO_PI)+a;
    da = a/60;
  }
  for (float x=0; x<=a; x+=da) v(P(S,R(SO,x)));
  
  drawCircleArcInHat(L,Q,M);
  
  float b = angle(V(E,M),V(E,R)), db=b/40;
  if (b<0) {
    b = (TWO_PI)+b;
    db = b/60;
  }
  for (float x=0; x<=b; x+=db) v(P(E,R(EM,x))); 
  
  drawCircleArcInHat(R,P,O);
  v(O);
  endShape();
}

void b2(pt S, pt E, pt L, pt R, pt A, pt B, float s, float e){
  beginShape();
  stroke(#66A4E2);
  fill(#A2E5CF);
  //E = A; R = A; e = 0;
  vec AL = V(A,L);
  vec T = R(U(S,L));
  float radius = (0 - n2(AL))/(2 * dot(AL,T));
  vec LQ = T; LQ.scaleBy(radius);
  pt Q = P(L,LQ);
  drawCircleArcInHat(L,Q,A);
  //A = L; A = S; s = 0
  vec T2 = U(Q,A);
  vec EA = V(E,A);
  radius = (e*e - n2(EA))/(2 * dot(EA,T2));
  vec AQ = T2; AQ.scaleBy(radius);
  Q = P(A,AQ);
  float w = atan(radius/e);
  vec EM = R(U(E,Q),w).scaleBy(e);
  pt M = P(E,EM);
  drawCircleArcInHat(A,Q,M);
  
  float b = angle(V(E,M),V(E,R)), db=b/40;
  if (b<0) {
    b = (TWO_PI)+b;
    db = b/60;
  }
  for (float x=0; x<=b; x+=db) v(P(E,R(EM,x))); 
  
  //S = B; L = B; s = 0;
  vec BR = V(B,R);
  T = R(U(E,R));
  radius = (0 - n2(BR))/(2 * dot(BR,T));
  vec RP = T; RP.scaleBy(radius);
  pt P = P(R,RP);
  drawCircleArcInHat(R,P,B);
  //B = R; B = E; s = 0
  T2 = U(P,B);
  vec SB = V(S,B);
  radius = (s*s - n2(SB))/(2 * dot(SB,T2));
  vec BP = T2; BP.scaleBy(radius);
  P = P(B,BP);
  w = atan(radius/s);
  vec SO = R(U(S,P),w).scaleBy(s);
  pt O = P(S,SO);
  drawCircleArcInHat(B,P,O);
  
  float a = angle(V(S,O),V(S,L)), da=a/40;
  if (a<0) {
    a = (TWO_PI)+a;
    da = a/60;
  }
  for (float x=0; x<=a; x+=da) v(P(S,R(SO,x)));
  
  v(L);
  endShape();
}