function Te = t_estabilidad (P1, P2, alpha, beta, k, j)
  yd = double(serie(P1, P2, alpha, beta, k, j, "double"))
  ys = double(serie(P1, P2, alpha, beta, k, j, "single"))
  mu_s = double(unidadmaquina(2, "single"))
  Te = abs(yd-ys)/(abs(yd)*mu_s);
end
