function tp1()
  Padron1 = 91352
  Padron2 = 102410
  P1 = Padron1/500
  P2 = Padron2/1000
  alpha = 0.2734
  beta = 0.4867
  r = 0.5e-4
  tp1_1;
  disp("# TP1 2 a")
  mn = tp1_2(P1, P2);
  m = mn(1)
  n = mn(2)
  tp1_3(m, n, P1, P2, alpha, beta, r);
  T_e = t_estabilidad(P1, P2, alpha, beta, m, n);
  if(isnan(T_e))
    T_e = NaN;
    P1 *= 10;
    P2 *= 10;
    do
      P1 /= 10
      P2 /= 10
      mn = tp1_2(P1, P2);
      m = mn(1)
      n = mn(2)
      T_e = t_estabilidad(P1, P2, alpha, beta, m, n)
    until (!isnan(T_e))
    tp1_3(m, n, P1, P2, alpha, beta, r);
  end
end
