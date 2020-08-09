function mn = tp1_2(P1, P2)
  m = truncamiento(P1, .5e-6);
  n = truncamiento(P2, .5e-6);
  mn = [m; n];
end
