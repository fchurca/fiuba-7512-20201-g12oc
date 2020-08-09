function tp1_1()
  disp("# TP1 1 a")
  # Buscar la unidad de máquina, asumiendo que la máquina trabaja en base `10`
  mu_10 = unidadmaquina(10)

  disp("# TP1 1 b")
  # Buscar la unidad de máquina, asumiendo que la máquina trabaja en base `2`
  mu_2 = unidadmaquina(2)

  disp("#mu single para el calculo de Te(en base 2) ")
  # Buscar la unidad de máquina, esta vez en single, asumiendo que la máquina trabaja en base `2`
  mu_2s = unidadmaquina(2, "single")
end
