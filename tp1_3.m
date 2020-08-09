function tp1_3(m, n, P1, P2, alpha, beta, r)
  disp("# TP1 3")
  display("# Datos de entrada")
  display("# Resultado de la serie")
  s = serie(P1, P2, alpha, beta, m, n)
  disp("# TP1 3 I")
  disp("# Condición de Problema aproximada")
  C_p = condicion_problema(P1, P2, alpha, beta, m, n)
  disp("# TP1 3 II")
  disp("# Término de Estabilidad")
  T_e = t_estabilidad(P1, P2, alpha, beta, m, n)
  
  disp("# Error de Redondeo")
  mu_d = unidadmaquina(2)
  disp("# Error total sin inherente")
  E_r = T_e * mu_d * s
  C_E_r = acotar(E_r)
  disp("# Error Inherente")
  E_i = C_p * r * s
  disp("# Error total con inherente")
  E = E_i + E_r
  C_E = acotar(E)
end
