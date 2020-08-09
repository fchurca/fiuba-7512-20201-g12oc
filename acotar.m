function x = acotar(x, E=5, B=10)
  EB = B / E;
  x = (B.^ceil(log2(EB*x)/log2(B)))/EB;
end
