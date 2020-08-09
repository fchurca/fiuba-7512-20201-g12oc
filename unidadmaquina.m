function mu = unidadmaquina (B, format="double")
#   Buscar la unidad de máquina, asumiendo que la máquina trabaja en base `B`
# Para ello, se busca el menor número `mu` tal que aporte a una suma `1 + mu` .
# Si se asume que la máquina trabaja en base `B` , `mu` va a ser una potencia
# inversa de `B` . Por eso, se itera una división por `B` arrancando desde `1`
  mu_nuevo = feval(format, 1);
  do
    mu = mu_nuevo;
    mu_nuevo = mu / B;
  #   Es importante no simplificar a `mu_nuevo <= 0` ya que se busca
  # precisamente un `mu` chico que sea descartado en la suma de `1 + mu`
  until (1 + mu_nuevo <= 1)
end
