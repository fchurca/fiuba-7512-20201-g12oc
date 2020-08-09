function T = serie (P1, P2, alpha, beta, k, j, format="double")
  # Vamos a reutilizar la subserie en ambos términos
  #   Los términos factoriales y exponenciales se van de rango rápidamente si
  # los calculamos independientemente pero pueden cancelarse. Por eso vamos a
  # implementar cada subtérmino de la serie como un producto del término
  # anterior, arrancando desde un término inicial
  function s = subserie(P, n)
    # Memoizamos (P^2)/4 y aprovechamos para castearlo al tipo deseado
    P_2_4 = feval(format, P * P / 4);
    # Primer término s_0
    a_k = P_2_4 / 2;
    s = a_k;
    for k = 1:n
      a_k *= -P_2_4 / (k * (k + 2));
      s += a_k;
    end
  end
  T = alpha * subserie(P1, k) + beta * subserie(P2, j);
end
