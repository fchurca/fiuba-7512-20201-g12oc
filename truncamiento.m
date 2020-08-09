function n = truncamiento(P, error, format = "double")
  # Memoizamos (P^2)/4 y aprovechamos para castearlo al tipo deseado
  P_2_4 = feval(format, P * P / 4);
  # Primer término s_0
  a_k = P_2_4 / 2;
  k = 0;
  s_k = 0;
  do
    s_k += a_k;
    k++;
    a_k *= -P_2_4 / (k * (k + 2));
  until ((a_k == 0) || (abs(a_k) < abs(error)))
  n = k;
end