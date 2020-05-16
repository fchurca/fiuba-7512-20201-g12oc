
function T = serie (P1, P2, alpha, beta,k,j)

format long;
A = P1/200;
B = P2/2000;

s1 = 0;
s2 = 0;

for i1 =1:k;
  for h1 =1:i1; 
    ak=1;
    ak *= A/h1;
  end
  
  s1 += (-1).^(i1-1) *ak.^2*(i1/(i1+1)); 
end

for i2 =1:j;
  for h2 =1:i2; 
    bk=1;
    bk *= B/h2;
  end
  s2 += (-1).^(i2-1) *bk.^2*(i2/(i2+1));
end

s1;
s2;
T = alpha*s1 + beta*s2;

end