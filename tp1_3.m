function tp1_3(m, n, P1, P2, alpha, beta, r)
  disp("# TP1 3")
  display("# Datos de entrada")
  display("# Resultado de la serie")
  s = serie(P1, P2, alpha, beta, m, n)
  display("# mu")
  mu_d = unidadmaquina(2)
  display("# Error de Truncamiento")
  E_t_rel = 10^-6
  E_t = E_t_rel * s

  disp("# TP1 3 I")
  disp("# Condición de Problema aproximada")
  C_p = condicion_problema(P1, P2, alpha, beta, m, n)

  disp("# TP1 3 II")
  disp("# Término de Estabilidad")
  T_e = t_estabilidad(P1, P2, alpha, beta, m, n)
 
  disp("# TP1 3 III")
  disp("# Error de Redondeo")
  E_r_rel = T_e * mu_d
  E_r = E_r_rel * s
  C_E_r = acotar(E_r)
  disp("# Error total sin inherente")
  E = sum(abs([E_t_rel, E_r_rel])) * s
  C_E = acotar(E)

  disp("# TP1 3 IV")
  disp("# Error Inherente")
  E_i_rel = C_p * r
  E_i = E_i_rel * s
  C_E_i = acotar(E_i)
  disp("# Error total")
  E = sum(abs([E_r, E_t, E_i]))
  C_E = acotar(E)
end
