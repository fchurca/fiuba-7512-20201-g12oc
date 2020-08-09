function Te = t_estabilidad (P1, P2, alpha, beta, k, j)
  yd = serie(P1, P2, alpha, beta, k, j, "double")
  ys = serie(P1, P2, alpha, beta, k, j, "single")
  mu_s = unidadmaquina(2, "single")
  Te = abs(yd-ys)/(abs(yd)*mu_s);
end
